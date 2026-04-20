import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

/// Доступные значения скорости для слайдера (0.5 — 2.0).
final List<double> _speedValues = [0.5, 0.75, 1.0, 1.25, 1.5, 1.75, 2.0];

/// Пресеты: значение и подпись под кнопкой (только у 1.0 — "Normal").
final List<({double value, String? sublabel})> _presets = [
  (value: 1.0, sublabel: null),
  (value: 1.25, sublabel: null),
  (value: 1.5, sublabel: null),
  (value: 2.0, sublabel: null),
  (value: 3.0, sublabel: null),
];

class PlaybackSpeedOverlayButton extends StatelessWidget {
  final YoutubePlayerController controller;

  const PlaybackSpeedOverlayButton({super.key, required this.controller});

  int _valueToIndex(double value) {
    if (value >= 2.0) return _speedValues.length - 1;
    final nearest = _speedValues.reduce(
      (a, b) => (a - value).abs() < (b - value).abs() ? a : b,
    );
    final idx = _speedValues.indexOf(nearest);
    return idx.clamp(0, _speedValues.length - 1);
  }

  void _openOverlay(BuildContext context) {
    final currentRate = controller.value.playbackRate;
    final initialIndex = _valueToIndex(currentRate);
    final is3x = (currentRate - 3.0).abs() < 0.01;

    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (sheetContext) => _PlaybackSpeedOverlay(
        controller: controller,
        initialSliderIndex: initialIndex,
        initialIs3x: is3x,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.speed, color: Colors.white, size: 22),
      tooltip: 'Скорость воспроизведения',
      onPressed: () => _openOverlay(context),
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
    );
  }
}

class _PlaybackSpeedOverlay extends StatefulWidget {
  final YoutubePlayerController controller;
  final int initialSliderIndex;
  final bool initialIs3x;

  const _PlaybackSpeedOverlay({
    required this.controller,
    required this.initialSliderIndex,
    required this.initialIs3x,
  });

  @override
  State<_PlaybackSpeedOverlay> createState() => _PlaybackSpeedOverlayState();
}

class _PlaybackSpeedOverlayState extends State<_PlaybackSpeedOverlay> {
  late int _sliderIndex;
  bool _is3x = false;

  @override
  void initState() {
    super.initState();
    _sliderIndex = widget.initialSliderIndex.clamp(0, _speedValues.length - 1);
    _is3x = widget.initialIs3x;
  }

  double get _currentSpeed => _is3x ? 3.0 : _speedValues[_sliderIndex];

  void _applySpeed(double rate) {
    widget.controller.setPlaybackRate(rate);
    setState(() {
      _is3x = (rate - 3.0).abs() < 0.01;
      if (!_is3x) {
        final idx = _speedValues.indexOf(
          _speedValues.reduce(
            (a, b) => (a - rate).abs() < (b - rate).abs() ? a : b,
          ),
        );
        if (idx >= 0) _sliderIndex = idx;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    const panelRadius = 16.0;
    const handleBarWidth = 40.0;
    const handleBarHeight = 4.0;

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C1E),
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(panelRadius),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 12),
            Center(
              child: Container(
                width: handleBarWidth,
                height: handleBarHeight,
                decoration: BoxDecoration(
                  color: Colors.grey.shade500,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 28),
            Text(
              '${_currentSpeed.toStringAsFixed(2)}x',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 42,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 28),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  _CircleIconButton(
                    icon: Icons.remove,
                    onPressed: _is3x
                        ? () {
                            setState(() {
                              _is3x = false;
                              _sliderIndex = _speedValues.length - 1;
                            });
                            _applySpeed(2.0);
                          }
                        : _sliderIndex > 0
                        ? () {
                            setState(() => _sliderIndex--);
                            _applySpeed(_speedValues[_sliderIndex]);
                          }
                        : null,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Colors.white.withValues(alpha: 0.3),
                        thumbColor: Colors.white,
                        overlayColor: Colors.white.withValues(alpha: 0.2),
                      ),
                      child: Slider(
                        value: _is3x
                            ? (_speedValues.length - 1).toDouble()
                            : _sliderIndex.toDouble(),
                        min: 0,
                        max: (_speedValues.length - 1).toDouble(),
                        divisions: _speedValues.length - 1,
                        onChanged: (v) {
                          final idx = v.round().clamp(
                            0,
                            _speedValues.length - 1,
                          );
                          setState(() {
                            _sliderIndex = idx;
                            _is3x = false;
                          });
                          _applySpeed(_speedValues[idx]);
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  _CircleIconButton(
                    icon: Icons.add,
                    onPressed: _sliderIndex < _speedValues.length - 1
                        ? () {
                            setState(() => _sliderIndex++);
                            _applySpeed(_speedValues[_sliderIndex]);
                          }
                        : null,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: _presets.map((preset) {
                  final isSelected =
                      (_currentSpeed - preset.value).abs() < 0.01;
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Material(
                        color: isSelected
                            ? Colors.white.withValues(alpha: 0.2)
                            : const Color(0xFF2C2C2E),
                        borderRadius: BorderRadius.circular(12),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(12),
                          onTap: () {
                            final idx = _speedValues.indexOf(
                              _speedValues.reduce(
                                (a, b) =>
                                    (a - preset.value).abs() <
                                        (b - preset.value).abs()
                                    ? a
                                    : b,
                              ),
                            );
                            if (idx >= 0) {
                              setState(() {
                                _sliderIndex = idx;
                                _is3x = preset.value == 3.0;
                              });
                              _applySpeed(preset.value);
                            } else {
                              setState(() => _is3x = true);
                              _applySpeed(3.0);
                            }
                          },
                          child: SizedBox(
                            width: 56,
                            height: 44,
                            child: Center(
                              child: Text(
                                preset.value == 1.0
                                    ? '1.0'
                                    : preset.value.toStringAsFixed(1),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      if (preset.sublabel != null) ...[
                        const SizedBox(height: 6),
                        Text(
                          preset.sublabel!,
                          style: TextStyle(
                            color: Colors.grey.shade400,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ],
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class _CircleIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  const _CircleIconButton({required this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFF2C2C2E),
      shape: const CircleBorder(),
      child: IconButton(
        icon: Icon(icon, color: Colors.white, size: 24),
        onPressed: onPressed,
        padding: const EdgeInsets.all(14),
        style: IconButton.styleFrom(minimumSize: const Size(48, 48)),
      ),
    );
  }
}
