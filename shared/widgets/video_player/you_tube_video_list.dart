import 'package:work_up/core/utils/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:work_up/shared/widgets/no_screenshot_scope_widget.dart';
import 'package:work_up/shared/widgets/video_player/custom_full_screen_button.dart';
import 'package:work_up/shared/widgets/video_player/video_settings_button.dart';
import 'package:work_up/shared/widgets/video_player/you_tube_full_screen_widget.dart';
import 'package:work_up/shared/widgets/video_player/youtube_mute_button.dart';
import 'package:work_up/core/translation/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YouTubeVideoList extends StatefulWidget {
  final List<String> videos;
  final String subjectName;
  const YouTubeVideoList({
    super.key,
    required this.videos,
    required this.subjectName,
  });

  @override
  State<YouTubeVideoList> createState() => _YouTubeVideoListState();
}

class _YouTubeVideoListState extends State<YouTubeVideoList> {
  late List<YoutubePlayerController> controllers;

  /// Слушатели для остановки других видео при воспроизведении одного.
  final Map<YoutubePlayerController, VoidCallback> _playSyncListeners = {};

  @override
  void initState() {
    super.initState();
    _initControllers();
    _addPlaySyncListeners();
  }

  void _removePlaySyncListeners() {
    for (final entry in _playSyncListeners.entries) {
      entry.key.removeListener(entry.value);
    }
    _playSyncListeners.clear();
  }

  void _addPlaySyncListeners() {
    for (final c in controllers) {
      void listener() {
        if (!mounted) return;
        if (c.value.isPlaying) {
          for (final other in controllers) {
            if (other != c) other.pause();
          }
        }
      }

      c.addListener(listener);
      _playSyncListeners[c] = listener;
    }
  }

  void _disposeControllers() {
    _removePlaySyncListeners();
    for (var controller in controllers) {
      controller.dispose();
    }
  }

  void _initControllers() {
    controllers = widget.videos
        .map(
          (video) => YoutubePlayerController(
            initialVideoId: YoutubePlayer.convertUrlToId(video) ?? '',
            flags: const YoutubePlayerFlags(autoPlay: false),
          ),
        )
        .toList();
  }

  @override
  void didUpdateWidget(covariant YouTubeVideoList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.videos != widget.videos) {
      _disposeControllers();
      _initControllers();
      _addPlaySyncListeners();
    }
  }

  @override
  void dispose() {
    _disposeControllers();
    super.dispose();
  }

  Future<void> _openFullScreen(int index) async {
    if (index < 0 || index >= controllers.length) return;
    final controller = controllers[index];
    if (!controller.value.isReady) return;

    final result = await Navigator.of(context, rootNavigator: true)
        .push<Duration>(
          MaterialPageRoute(
            fullscreenDialog: true,
            builder: (context) => YouTubeFullScreenWidget(
              videoUrl: widget.videos[index],
              initialPosition: controller.value.position,
              wasPlaying: controller.value.isPlaying,
            ),
          ),
        );

    if (!mounted || index >= controllers.length) return;
    if (result == null) return;
    try {
      controllers[index].seekTo(result);
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    return NoScreenshotScope(
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                '${widget.subjectName}: видеоуроки',
                style: Theme.of(context).textTheme.headlineLarge,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
          widget.videos.isEmpty
              ? SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      S.of(context).noVideos,
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              : SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final controller = controllers[index];
                      final video = widget.videos[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: YoutubePlayerBuilder(
                                key: Key(video),
                                player: YoutubePlayer(
                                  controller: controller,
                                  actionsPadding: const EdgeInsets.only(
                                    left: 16.0,
                                  ),
                                  topActions: [
                                    Spacer(),
                                    VideoSettingsButton(controller: controller),
                                    SizedBox(width: 16),
                                  ],

                                  bottomActions: [
                                    YoutubeMuteButton(controller: controller),
                                    CurrentPosition(),
                                    const SizedBox(width: 10),
                                    const ProgressBar(isExpanded: true),
                                    const SizedBox(width: 10),
                                    RemainingDuration(),
                                    CustomFullScreenButton(
                                      onPressed: () => _openFullScreen(index),
                                      isFullScreen:
                                          controller.value.isFullScreen,
                                    ),
                                  ],
                                ),
                                builder: (context, player) {
                                  return LayoutBuilder(
                                    builder: (context, constraints) {
                                      return AspectRatio(
                                        aspectRatio: 16 / 9,
                                        child: ListenableBuilder(
                                          listenable: controller,
                                          builder: (context, _) {
                                            final showControls = controller
                                                .value
                                                .isControlsVisible;
                                            return Stack(
                                              fit: StackFit.expand,
                                              children: [
                                                player,
                                                // Кнопки -10/+10 сек: показываем после нажатия на видео (когда открыты контролы).
                                                if (showControls) ...[
                                                  Positioned(
                                                    left: 56,
                                                    top: 0,
                                                    bottom: 0,
                                                    child: Center(
                                                      child: Material(
                                                        color: Colors.black
                                                            .withValues(
                                                              alpha: 0.6,
                                                            ),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              40,
                                                            ),
                                                        child: InkWell(
                                                          onTap: () {
                                                            if (!controller
                                                                .value
                                                                .isReady) {
                                                              return;
                                                            }
                                                            final pos =
                                                                controller
                                                                    .value
                                                                    .position;
                                                            final duration =
                                                                controller
                                                                    .metadata
                                                                    .duration;
                                                            final newSec =
                                                                (pos.inSeconds -
                                                                        10)
                                                                    .clamp(
                                                                      0,
                                                                      duration
                                                                          .inSeconds,
                                                                    );
                                                            controller.seekTo(
                                                              Duration(
                                                                seconds: newSec,
                                                              ),
                                                            );
                                                          },
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                40,
                                                              ),
                                                          child: const Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                  8,
                                                                ),
                                                            child: Icon(
                                                              Icons.replay_10,
                                                              color:
                                                                  Colors.white,
                                                              size: 25,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    right: 56,
                                                    top: 0,
                                                    bottom: 0,
                                                    child: Center(
                                                      child: Material(
                                                        color: Colors.black
                                                            .withValues(
                                                              alpha: 0.6,
                                                            ),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              40,
                                                            ),
                                                        child: InkWell(
                                                          onTap: () {
                                                            if (!controller
                                                                .value
                                                                .isReady) {
                                                              return;
                                                            }
                                                            final pos =
                                                                controller
                                                                    .value
                                                                    .position;
                                                            final duration =
                                                                controller
                                                                    .metadata
                                                                    .duration;
                                                            final newSec =
                                                                (pos.inSeconds +
                                                                        10)
                                                                    .clamp(
                                                                      0,
                                                                      duration
                                                                          .inSeconds,
                                                                    );
                                                            controller.seekTo(
                                                              Duration(
                                                                seconds: newSec,
                                                              ),
                                                            );
                                                          },
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                40,
                                                              ),
                                                          child: const Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                  8,
                                                                ),
                                                            child: Icon(
                                                              Icons.forward_10,
                                                              color:
                                                                  Colors.white,
                                                              size: 25,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ],
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                            const SizedBox(height: 10),

                            RichText(
                              text: TextSpan(
                                style: context.theme.textTheme.bodyMedium
                                    ?.copyWith(
                                      color:
                                          context.theme.colorScheme.onSurface,
                                    ),
                                children: [
                                  const TextSpan(text: 'Источник: '),
                                  TextSpan(
                                    onEnter: (event) {
                                      launchUrl(Uri.parse(video));
                                    },
                                    text: '-',
                                    style: context.theme.textTheme.bodyMedium
                                        ?.copyWith(
                                          color:
                                              context.theme.colorScheme.primary,
                                          decoration: video.isNotEmpty
                                              ? TextDecoration.underline
                                              : null,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    childCount: controllers.length,
                    addAutomaticKeepAlives: true,
                    addRepaintBoundaries: true,
                  ),
                ),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
        ],
      ),
    );
  }
}
