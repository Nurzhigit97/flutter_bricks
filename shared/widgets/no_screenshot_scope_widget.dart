import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:no_screenshot/no_screenshot.dart';

/// Виджет на основе [no_screenshot](https://pub.dev/packages/no_screenshot).
///
/// Пока экран с этим виджетом отображается и [enableProtection] = true,
/// скриншоты и запись экрана отключены. При уходе со экрана защита снимается.
///
/// Поддерживаются Android, iOS, macOS. На web вызовы плагина не выполняются.
class NoScreenshotScope extends StatefulWidget {
  /// Контент, который нужно показывать под защитой.
  final Widget child;

  /// Включать ли отключение скриншотов/записи на время жизни виджета.
  /// По умолчанию true.
  final bool enableProtection;

  /// Вызывается при попытке сделать скриншот (если включено прослушивание).
  /// На iOS с [screenshotOff] скриншот блокируется; на Android событие может
  /// приходить уже после попытки.
  final void Function()? onScreenshotAttempt;

  const NoScreenshotScope({
    super.key,
    required this.child,
    this.enableProtection = true,
    this.onScreenshotAttempt,
  });

  @override
  State<NoScreenshotScope> createState() => _NoScreenshotScopeState();
}

class _NoScreenshotScopeState extends State<NoScreenshotScope> {
  static final _noScreenshot = NoScreenshot.instance;
  StreamSubscription<dynamic>? _screenshotSubscription;

  @override
  void initState() {
    super.initState();
    if (widget.enableProtection && !kIsWeb) {
      _applyProtection();
    }
    if (widget.onScreenshotAttempt != null && !kIsWeb) {
      _startScreenshotListening();
    }
  }

  @override
  void didUpdateWidget(NoScreenshotScope oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.enableProtection != oldWidget.enableProtection && !kIsWeb) {
      if (widget.enableProtection) {
        _applyProtection();
      } else {
        _removeProtection();
      }
    }
    if (widget.onScreenshotAttempt != oldWidget.onScreenshotAttempt &&
        !kIsWeb) {
      _screenshotSubscription?.cancel();
      if (widget.onScreenshotAttempt != null) {
        _startScreenshotListening();
      }
    }
  }

  Future<void> _applyProtection() async {
    try {
      await _noScreenshot.screenshotOff();
      if (kDebugMode) {
        debugPrint('NoScreenshotScope: protection ON');
      }
    } catch (e) {
      if (kDebugMode) {
        debugPrint('NoScreenshotScope: screenshotOff failed: $e');
      }
    }
  }

  Future<void> _removeProtection() async {
    try {
      await _noScreenshot.screenshotOn();
      if (kDebugMode) {
        debugPrint('NoScreenshotScope: protection OFF');
      }
    } catch (e) {
      if (kDebugMode) {
        debugPrint('NoScreenshotScope: screenshotOn failed: $e');
      }
    }
  }

  void _startScreenshotListening() {
    _screenshotSubscription?.cancel();
    _screenshotSubscription = _noScreenshot.screenshotStream.listen((value) {
      final taken = value.wasScreenshotTaken;
      if (taken && widget.onScreenshotAttempt != null && mounted) {
        widget.onScreenshotAttempt!();
      }
    });
    _noScreenshot.startScreenshotListening();
  }

  @override
  void dispose() {
    _screenshotSubscription?.cancel();
    if (widget.enableProtection && !kIsWeb) {
      _removeProtection();
    }
    if (widget.onScreenshotAttempt != null && !kIsWeb) {
      _noScreenshot.stopScreenshotListening();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
