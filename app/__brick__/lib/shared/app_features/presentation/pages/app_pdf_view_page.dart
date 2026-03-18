import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:{{packageName}}/shared/core/translation/generated/l10n.dart';
import 'package:{{packageName}}/shared/theme/styles/app_colors.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:dio/dio.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:{{packageName}}/shared/core/helper/extensions.dart';

@RoutePage()
class AppPdfViewPage extends StatefulWidget {
  final String pdfUrl;
  const AppPdfViewPage({super.key, required this.pdfUrl});

  @override
  State<AppPdfViewPage> createState() => _AppPdfViewPageState();
}

class _AppPdfViewPageState extends State<AppPdfViewPage> {
  late PdfViewerController _pdfViewerController;
  String? _error;
  bool _isLoading = true;
  String? _cachedFilePath;
  final Dio _dio = Dio();

  // Переменные для отображения прогресса
  double _downloadProgress = 0.0;
  bool _isDownloading = false;
  String _downloadStatus = '';

  // Константы для управления кэшем
  static const int maxCacheSizeMb = 200; // Максимум 200MB кэша
  static const int maxCacheFiles = 50; // Максимум 50 файлов

  @override
  void initState() {
    super.initState();
    _pdfViewerController = PdfViewerController();
    _loadPdf();
  }

  @override
  void dispose() {
    _pdfViewerController.dispose();
    _dio.close();
    super.dispose();
  }

  Future<void> _loadPdf() async {
    try {
      setState(() {
        _downloadStatus = '';
      });

      // Проверяем кэш
      final cachedFile = await _getCachedFile();
      if (cachedFile != null && await cachedFile.exists()) {
        // Обновляем время доступа к кэшированному файлу
        await _updateFileAccessTime(cachedFile.path);

        setState(() {
          _cachedFilePath = cachedFile.path;
          _isLoading = false;
          _downloadStatus = '';
        });
        return;
      }

      // Загружаем PDF с прогрессом
      await _downloadPdf();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
    }
  }

  Future<File?> _getCachedFile() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final fileName = _getFileNameFromUrl(widget.pdfUrl);
      final file = File('${directory.path}/pdf_cache/$fileName');
      return file;
    } catch (e) {
      return null;
    }
  }

  String _getFileNameFromUrl(String url) {
    // Создаем уникальное имя файла на основе URL
    final uri = Uri.parse(url);
    final pathSegments = uri.pathSegments;
    if (pathSegments.isNotEmpty) {
      return pathSegments.last;
    }
    // Если не удалось извлечь имя, используем хеш URL
    return '${url.hashCode}.pdf';
  }

  Future<void> _downloadPdf() async {
    try {
      setState(() {
        _isDownloading = true;
        _downloadProgress = 0.0;
        _downloadStatus = context.tr.download;
      });

      final directory = await getApplicationDocumentsDirectory();
      final pdfCacheDir = Directory('${directory.path}/pdf_cache');
      if (!await pdfCacheDir.exists()) {
        await pdfCacheDir.create(recursive: true);
      }

      // Проверяем и очищаем кэш перед загрузкой
      await _manageCacheSize();

      final fileName = _getFileNameFromUrl(widget.pdfUrl);
      final file = File('${pdfCacheDir.path}/$fileName');

      setState(() {
        _downloadStatus = context.tr.download;
      });

      await _dio.download(
        widget.pdfUrl,
        file.path,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            setState(() {
              _downloadProgress = received / total;
              final receivedMB = (received / (1024 * 1024)).toStringAsFixed(1);
              final totalMB = (total / (1024 * 1024)).toStringAsFixed(1);
              _downloadStatus =
                  '${context.tr.download}: $receivedMB / $totalMB MB';
            });
          }
        },
      );

      // Обновляем время последнего доступа
      await _updateFileAccessTime(file.path);

      setState(() {
        _cachedFilePath = file.path;
        _isLoading = false;
        _isDownloading = false;
        _downloadProgress = 1.0;
        _downloadStatus = context.tr.finish;
      });
    } catch (e) {
      setState(() {
        _error = '${context.tr.loadingError}: ${e.toString()}';
        _isLoading = false;
        _isDownloading = false;
      });
    }
  }

  /// Управление размером кэша - удаляет старые файлы при превышении лимитов
  Future<void> _manageCacheSize() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final pdfCacheDir = Directory('${directory.path}/pdf_cache');

      if (!await pdfCacheDir.exists()) return;

      final files = await pdfCacheDir.list().toList();
      final pdfFiles = files.whereType<File>().toList();

      // Получаем информацию о файлах с временными метками
      final fileInfos = <Map<String, dynamic>>[];
      for (final file in pdfFiles) {
        final stat = await file.stat();
        fileInfos.add({
          'file': file,
          'size': stat.size,
          'modified': stat.modified,
          'path': file.path,
        });
      }

      // Сортируем по времени последнего доступа (LRU)
      fileInfos.sort((a, b) => a['modified'].compareTo(b['modified']));

      // Проверяем лимиты
      int totalSize = fileInfos.fold(
        0,
        (sum, info) => sum + (info['size'] as int),
      );
      const maxSizeBytes = maxCacheSizeMb * 1024 * 1024;

      // Удаляем файлы если превышены лимиты
      while ((totalSize > maxSizeBytes || fileInfos.length > maxCacheFiles) &&
          fileInfos.isNotEmpty) {
        final oldestFile = fileInfos.removeAt(0);
        await oldestFile['file'].delete();
        totalSize -= (oldestFile['size'] as int);
      }
    } catch (e) {
      // Игнорируем ошибки очистки кэша
      log('Ошибка очистки кэша: $e');
    }
  }

  /// Обновляет время последнего доступа к файлу
  Future<void> _updateFileAccessTime(String filePath) async {
    try {
      final file = File(filePath);
      await file.setLastModified(DateTime.now());
    } catch (e) {
      // Игнорируем ошибки обновления времени
    }
  }

  /// Получает размер кэша в мегабайтах
  Future<double> _getCacheSizeMB() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final pdfCacheDir = Directory('${directory.path}/pdf_cache');

      if (!await pdfCacheDir.exists()) return 0.0;

      final files = await pdfCacheDir.list().toList();
      int totalSize = 0;

      for (final file in files) {
        if (file is File) {
          totalSize += await file.length();
        }
      }

      return totalSize / (1024 * 1024); // Конвертируем в MB
    } catch (e) {
      return 0.0;
    }
  }

  /// Очищает весь кэш
  Future<void> _clearAllCache() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final pdfCacheDir = Directory('${directory.path}/pdf_cache');

      if (await pdfCacheDir.exists()) {
        await pdfCacheDir.delete(recursive: true);
      }
    } catch (e) {
      log('Ошибка очистки кэша: $e');
    }
  }

  /// Показывает информацию о кэше
  Future<void> _showCacheInfo() async {
    final cacheSize = await _getCacheSizeMB();
    final cacheCount = await _getCacheFileCount();

    if (!mounted) return;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(context.tr.cacheInformation),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${context.tr.cacheSize}: ${cacheSize.toStringAsFixed(1)} MB'),
            Text('${context.tr.numberOfFiles}: $cacheCount'),
            const SizedBox(height: 8),
            Text(
              '${context.tr.maximum}: ${maxCacheSizeMb}MB / $maxCacheFiles files',
            ),
            const SizedBox(height: 8),
            Text(
              context.tr.cacheAutoClearDescription,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(context.tr.close),
          ),
        ],
      ),
    );
  }

  /// Показывает диалог очистки кэша
  Future<void> _showClearCacheDialog() async {
    if (!mounted) return;

    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(context.tr.clearCache),
        content: Text(context.tr.clearCacheDescription),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(context.tr.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: Text(context.tr.clear),
          ),
        ],
      ),
    );

    if (result == true) {
      await _clearAllCache();
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(context.tr.cacheCleared)));
      }
    }
  }

  /// Получает количество файлов в кэше
  Future<int> _getCacheFileCount() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final pdfCacheDir = Directory('${directory.path}/pdf_cache');

      if (!await pdfCacheDir.exists()) return 0;

      final files = await pdfCacheDir.list().toList();
      return files.whereType<File>().length;
    } catch (e) {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert),
            onSelected: (value) async {
              switch (value) {
                case 'cache_info':
                  await _showCacheInfo();
                  break;
                case 'clear_cache':
                  await _showClearCacheDialog();
                  break;
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'cache_info',
                child: Row(
                  children: [
                    const Icon(Icons.info_outline),
                    const SizedBox(width: 8),
                    Text(context.tr.cacheInformation),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 'clear_cache',
                child: Row(
                  children: [
                    const Icon(Icons.delete_outline),
                    const SizedBox(width: 8),
                    Text(context.tr.clearCache),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return _buildLoadingWidget();
    }

    return _buildPdfViewer();
  }

  Widget _buildLoadingWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Текст статуса
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              _downloadStatus,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          // Прогресс бар при загрузке
          if (_isDownloading) ...[
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48),
              child: Column(
                children: [
                  // Линейный прогресс бар
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: LinearProgressIndicator(
                      value: _downloadProgress,
                      minHeight: 8,
                      backgroundColor: AppColors.primaryColor.withValues(
                        alpha: 0.2,
                      ),
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        AppColors.primaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Процент загрузки крупным шрифтом
                  Text(
                    '${(_downloadProgress * 100).toStringAsFixed(0)}%',
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildPdfViewer() {
    if (_error != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 64, color: Colors.red),
              const SizedBox(height: 16),
              Text(
                S.of(context).cantLoadPdf,
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                _error!,
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: Colors.red.shade700),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    _error = null;
                    _isLoading = true;
                    _downloadProgress = 0.0;
                  });
                  _loadPdf();
                },
                icon: const Icon(Icons.refresh),
                label: Text(context.tr.repeat),
              ),
            ],
          ),
        ),
      );
    }

    return SfPdfViewerTheme(
      data: const SfPdfViewerThemeData(
        backgroundColor: AppColors.white,
        progressBarColor: AppColors.primaryColor,
      ),
      child: _cachedFilePath != null
          ? SfPdfViewer.file(
              File(_cachedFilePath!),
              controller: _pdfViewerController,
              pageSpacing: 4,
              onDocumentLoaded: (PdfDocumentLoadedDetails details) {
                // PDF успешно загружен из кэша
                log('PDF загружен из кэша: $_cachedFilePath');
              },
              onDocumentLoadFailed: (PdfDocumentLoadFailedDetails details) {
                setState(() {
                  _error = details.error;
                });
              },
            )
          : SfPdfViewer.network(
              widget.pdfUrl,
              controller: _pdfViewerController,
              pageSpacing: 4,
              onDocumentLoaded: (PdfDocumentLoadedDetails details) {
                // PDF успешно загружен
                log('PDF загружен с сервера');
              },
              onDocumentLoadFailed: (PdfDocumentLoadFailedDetails details) {
                setState(() {
                  _error = details.error;
                });
              },
            ),
    );
  }
}
