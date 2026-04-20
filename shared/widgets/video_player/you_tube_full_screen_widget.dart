import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:work_up/shared/widgets/no_screenshot_scope_widget.dart';
import 'package:work_up/shared/widgets/video_player/custom_full_screen_button.dart';
import 'package:work_up/shared/widgets/video_player/video_settings_button.dart';
import 'package:work_up/shared/widgets/video_player/youtube_mute_button.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YouTubeFullScreenWidget extends StatefulWidget {
  final String videoUrl;
  final Duration initialPosition;
  final bool wasPlaying;

  const YouTubeFullScreenWidget({
    super.key,
    required this.videoUrl,
    required this.initialPosition,
    this.wasPlaying = false,
  });

  @override
  State<YouTubeFullScreenWidget> createState() =>
      _YouTubeFullScreenWidgetState();
}

class _YouTubeFullScreenWidgetState extends State<YouTubeFullScreenWidget> {
  late YoutubePlayerController _controller;
  Duration _lastSavedPosition = Duration.zero;
  bool _isDisposed = false;

  @override
  void initState() {
    super.initState();

    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.videoUrl) ?? '',
      flags: YoutubePlayerFlags(
        startAt: widget.initialPosition.inSeconds,
        enableCaption: false,
        hideThumbnail: true,
        autoPlay: widget.wasPlaying,
        mute: false,
      ),
    );

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }

  Future<void> saveProgress() async {
    if (_isDisposed || !mounted) return;
    try {
      if (!_controller.value.isReady) return;
      final currentPosition = _controller.value.position;
      final duration = _controller.metadata.duration;
      if (currentPosition != _lastSavedPosition && duration.inSeconds > 0) {
        _lastSavedPosition = currentPosition;
      }
    } on MissingPluginException catch (_) {
      // iOS: WebView channel не найден при full screen — игнорируем.
    } catch (e) {
      if (!_isDisposed) debugPrint('Error saving progress: $e');
    }
  }

  Future<void> exitFullScreen() async {
    if (_isDisposed || !mounted) return;

    await saveProgress(); // Сохраняем перед выходом

    Duration? position;
    try {
      if (!_isDisposed && _controller.value.isReady) {
        position = _controller.value.position;
      }
    } on MissingPluginException catch (_) {
      position = _lastSavedPosition;
    } catch (e) {
      position = _lastSavedPosition;
    }

    if (mounted && !_isDisposed) {
      Navigator.of(context, rootNavigator: true).pop(position);
    }
  }

  @override
  void dispose() {
    if (mounted) {
      try {
        if (_controller.value.isReady) {
          final currentPosition = _controller.value.position;
          final duration = _controller.metadata.duration;
          if (duration.inSeconds > 0) {
            _lastSavedPosition = currentPosition;
          }
        }
      } on MissingPluginException catch (_) {
      } catch (e) {
        // Игнорируем ошибки при сохранении прогресса
      }
    }

    // Теперь устанавливаем флаг disposed
    _isDisposed = true;

    // Пытаемся остановить контроллер перед dispose
    try {
      if (_controller.value.isReady && _controller.value.isPlaying) {
        _controller.pause();
      }
    } catch (e) {
      // Игнорируем ошибки при паузе
    }

    // Dispose контроллера
    try {
      _controller.dispose();
    } catch (e) {
      // Игнорируем ошибки если контроллер уже disposed
    }

    SystemChrome.setPreferredOrientations(DeviceOrientation.values);
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (!didPop) {
          await exitFullScreen();
        }
      },
      child: ColoredBox(
        color: Colors.black,
        child: SafeArea(
          bottom: false,
          child: NoScreenshotScope(
            child: YoutubePlayerBuilder(
              player: YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
                topActions: [
                  const Spacer(),
                  VideoSettingsButton(controller: _controller),
                  const SizedBox(width: 12),
                ],
                progressIndicatorColor: Colors.red,
                progressColors: const ProgressBarColors(
                  playedColor: Colors.red,
                  handleColor: Colors.redAccent,
                ),
                bottomActions: [
                  YoutubeMuteButton(controller: _controller),
                  const CurrentPosition(),
                  const SizedBox(width: 10),
                  const ProgressBar(isExpanded: true),
                  const SizedBox(width: 10),
                  const RemainingDuration(),
                  InkWell(
                    onTap: () {
                      if (!_controller.value.isReady) return;
                      final pos = _controller.value.position;
                      final duration = _controller.metadata.duration;
                      final newSec = (pos.inSeconds - 10).clamp(
                        0,
                        duration.inSeconds,
                      );
                      _controller.seekTo(Duration(seconds: newSec));
                    },
                    borderRadius: BorderRadius.circular(40),
                    child: const Padding(
                      padding: EdgeInsets.all(16),
                      child: Icon(
                        Icons.skip_previous,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                  ),
                  const SizedBox(width: 4),
                  InkWell(
                    onTap: () {
                      if (!_controller.value.isReady) return;
                      final pos = _controller.value.position;
                      final duration = _controller.metadata.duration;
                      final newSec = (pos.inSeconds + 10).clamp(
                        0,
                        duration.inSeconds,
                      );
                      _controller.seekTo(Duration(seconds: newSec));
                    },
                    borderRadius: BorderRadius.circular(40),
                    child: const Padding(
                      padding: EdgeInsets.all(16),
                      child: Icon(
                        Icons.skip_next,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                  ),
                  const SizedBox(width: 4),
                  CustomFullScreenButton(
                    onPressed: exitFullScreen,
                    isFullScreen: true,
                  ),
                ],
              ),

              builder: (context, player) {
                return AspectRatio(aspectRatio: 16 / 9, child: player);
              },
            ),
          ),
        ),
      ),
    );
  }
}
