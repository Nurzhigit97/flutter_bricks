import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

/// Кнопка вкл/выкл звука в YouTube-плеере.
/// Состояние храним локально: контроллер пакета не обновляет value.volume при mute/unMute.
class YoutubeMuteButton extends StatefulWidget {
  final YoutubePlayerController controller;

  const YoutubeMuteButton({super.key, required this.controller});

  @override
  State<YoutubeMuteButton> createState() => _YoutubeMuteButtonState();
}

class _YoutubeMuteButtonState extends State<YoutubeMuteButton> {
  bool _isMuted = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        _isMuted ? Icons.volume_off : Icons.volume_up,
        color: Colors.white,
        size: 22,
      ),
      tooltip: _isMuted ? 'Включить звук' : 'Выключить звук',
      onPressed: () {
        setState(() => _isMuted = !_isMuted);
        if (_isMuted) {
          widget.controller.mute();
        } else {
          // Сначала задаём громкость, затем unMute (с задержкой для iframe)
          widget.controller.setVolume(100);
          Future.delayed(const Duration(milliseconds: 100), () {
            if (mounted && !_isMuted) widget.controller.unMute();
          });
        }
      },
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
    );
  }
}
