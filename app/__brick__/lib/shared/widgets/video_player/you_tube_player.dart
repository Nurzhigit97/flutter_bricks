import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:{{packageName}}/shared/widgets/no_screenshot_scope_widget.dart';
import 'package:{{packageName}}/shared/widgets/video_player/custom_full_screen_button.dart';
import 'package:{{packageName}}/shared/widgets/video_player/video_settings_button.dart';
import 'package:{{packageName}}/shared/widgets/video_player/you_tube_full_screen_widget.dart';
import 'package:{{packageName}}/shared/widgets/video_player/youtube_mute_button.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

/// Плеер для одного YouTube-видео.
class YouTubePlayer extends StatefulWidget {
  final String youtubeUrl;
  final String? subjectName;

  const YouTubePlayer({super.key, required this.youtubeUrl, this.subjectName});

  @override
  State<YouTubePlayer> createState() => _YouTubePlayerState();
}

class _YouTubePlayerState extends State<YouTubePlayer> {
  late YoutubePlayerController _controller;

  void _initController() {
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.youtubeUrl) ?? '',
      flags: const YoutubePlayerFlags(autoPlay: false),
    );
  }

  @override
  void initState() {
    super.initState();
    _initController();
  }

  @override
  void didUpdateWidget(covariant YouTubePlayer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.youtubeUrl != widget.youtubeUrl) {
      _controller.dispose();
      _initController();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _openFullScreen() async {
    if (!_controller.value.isReady) return;

    Duration startPosition = Duration.zero;
    bool wasPlaying = false;
    try {
      startPosition = _controller.value.position;
      wasPlaying = _controller.value.isPlaying;
    } on MissingPluginException {
      // iOS: канал WebView иногда недоступен при открытии full screen — используем значения по умолчанию.
    }

    final result = await Navigator.of(context, rootNavigator: true)
        .push<Duration>(
          MaterialPageRoute(
            fullscreenDialog: true,
            builder: (context) => YouTubeFullScreenWidget(
              videoUrl: widget.youtubeUrl,
              initialPosition: startPosition,
              wasPlaying: wasPlaying,
            ),
          ),
        );

    if (!mounted) return;
    if (result != null) {
      try {
        _controller.seekTo(result);
        if (wasPlaying) _controller.play();
      } catch (_) {}
    }
  }

  @override
  Widget build(BuildContext context) {
    return NoScreenshotScope(
      child: YoutubePlayer(
        controller: _controller,
        actionsPadding: const EdgeInsets.only(left: 16.0),
        topActions: [VideoSettingsButton(controller: _controller)],
        bottomActions: [
          YoutubeMuteButton(controller: _controller),
          CurrentPosition(),
          const SizedBox(width: 10),
          const ProgressBar(isExpanded: true),
          const SizedBox(width: 10),
          RemainingDuration(),
          CustomFullScreenButton(
            onPressed: _openFullScreen,
            isFullScreen: _controller.value.isFullScreen,
          ),
        ],
      ),
    );
  }
}
