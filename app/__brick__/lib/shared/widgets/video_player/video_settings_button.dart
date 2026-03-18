import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

const List<({String id, String label, String sublabel})> _qualityOptions = [
  (
    id: 'auto',
    label: 'Авто (рекомендуется)',
    sublabel: 'Учитывать условия воспроизведения',
  ),
  (
    id: '1080p',
    label: 'Высокое качество изображения',
    sublabel: 'Использовать больше трафика',
  ),
  (id: '720p', label: '720p', sublabel: 'HD'),
  (
    id: '480p',
    label: 'Экономия трафика',
    sublabel: 'Понизить качество изображения',
  ),
  (id: '240p', label: '240p', sublabel: 'Низкое качество'),
  (id: '144p', label: '144p', sublabel: 'Минимальное качество'),
];

// --- Скорость ---
const List<double> _speedValues = [0.25, 0.5, 0.75, 1.0, 1.25, 1.5, 1.75, 2.0];
const List<({double value, String label})> _speedPresets = [
  (value: 0.25, label: '0,25'),
  (value: 1.0, label: '1,0'),
  (value: 1.25, label: '1,25'),
  (value: 1.5, label: '1,5'),
  (value: 2.0, label: '2,0'),
];

/// Кнопка «Настройки»: открывает bottom sheet с пунктами Качество и Скорость;
/// по нажатию открываются свои bottom sheet'ы.
class VideoSettingsButton extends StatefulWidget {
  final YoutubePlayerController controller;

  const VideoSettingsButton({super.key, required this.controller});

  @override
  State<VideoSettingsButton> createState() => _VideoSettingsButtonState();
}

class _VideoSettingsButtonState extends State<VideoSettingsButton> {
  YoutubePlayerController get controller => widget.controller;

  void _openMainSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (sheetContext) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 12),
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 8),
            // ListTile(
            //   leading: Icon(Icons.tune, color: Colors.grey.shade700),
            //   title: const Text(
            //     'Качество',
            //     style: TextStyle(fontWeight: FontWeight.w500),
            //   ),
            //   trailing: Row(
            //     mainAxisSize: MainAxisSize.min,
            //     children: [
            //       Text(
            //         _qualityIdToDisplay(
            //           _lastSelectedQualityId ?? _currentQualityId(),
            //         ),
            //         style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
            //       ),
            //       const SizedBox(width: 4),
            //       Icon(
            //         Icons.chevron_right,
            //         color: Colors.grey.shade600,
            //         size: 20,
            //       ),
            //     ],
            //   ),
            //   onTap: () {
            //     Navigator.of(sheetContext).pop();
            //     WidgetsBinding.instance.addPostFrameCallback((_) {
            //       if (context.mounted) _openQualitySheet(context);
            //     });
            //   },
            // ),
            ListTile(
              leading: Icon(Icons.speed, color: Colors.grey.shade700),
              title: Text(
                'Скорость Воспроизведения',
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${controller.value.playbackRate}x',
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
                  ),
                  const SizedBox(width: 4),
                  Icon(
                    Icons.chevron_right,
                    color: Colors.grey.shade600,
                    size: 20,
                  ),
                ],
              ),
              onTap: () {
                Navigator.of(sheetContext).pop();
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (context.mounted) _openSpeedSheet(context);
                });
              },
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  void _openSpeedSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (ctx) => _SpeedBottomSheet(controller: controller),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.settings, color: Colors.white, size: 22),
      tooltip: 'Настройки',
      onPressed: () => _openMainSheet(context),
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
    );
  }
}

// --- Quality sub-sheet (light, as in image) ---
class _QualityBottomSheet extends StatefulWidget {
  final String initialSelectedId;
  final String currentDisplay;
  final ValueChanged<String> onSelect;

  const _QualityBottomSheet({
    required this.initialSelectedId,
    required this.currentDisplay,
    required this.onSelect,
  });

  @override
  State<_QualityBottomSheet> createState() => _QualityBottomSheetState();
}

class _QualityBottomSheetState extends State<_QualityBottomSheet> {
  late String _selectedId;

  @override
  void initState() {
    super.initState();
    _selectedId = widget.initialSelectedId;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Expanded(
                  child: Text(
                    'Качество этого видео',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ),
                Text(
                  widget.currentDisplay,
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ..._qualityOptions.map((opt) {
              final isSelected = _selectedId == opt.id;
              return Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () {
                      setState(() => _selectedId = opt.id);
                      widget.onSelect(opt.id);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 12,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            isSelected
                                ? Icons.check_circle
                                : Icons.radio_button_unchecked,
                            color: isSelected
                                ? Theme.of(context).primaryColor
                                : Colors.grey.shade400,
                            size: 24,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  opt.label,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: isSelected
                                        ? FontWeight.w600
                                        : FontWeight.w500,
                                    color: Colors.black87,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  opt.sublabel,
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
            const SizedBox(height: 16),
            Text(
              'Качество будет изменено только для этого видео. Чтобы задать параметры для всего контента, выберите Настройки > Качество видео.',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade600,
                height: 1.3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// --- Speed sub-sheet (light, slider + chips as in image) ---
class _SpeedBottomSheet extends StatefulWidget {
  final YoutubePlayerController controller;

  const _SpeedBottomSheet({required this.controller});

  @override
  State<_SpeedBottomSheet> createState() => _SpeedBottomSheetState();
}

class _SpeedBottomSheetState extends State<_SpeedBottomSheet> {
  late int _sliderIndex;

  @override
  void initState() {
    super.initState();
    final rate = widget.controller.value.playbackRate;
    final idx = _speedValues.indexOf(
      _speedValues.reduce(
        (a, b) => (a - rate).abs() < (b - rate).abs() ? a : b,
      ),
    );
    _sliderIndex = idx.clamp(0, _speedValues.length - 1);
  }

  double get _currentSpeed => _speedValues[_sliderIndex];

  void _apply(double rate) {
    widget.controller.setPlaybackRate(rate);
    final idx = _speedValues.indexOf(
      _speedValues.reduce(
        (a, b) => (a - rate).abs() < (b - rate).abs() ? a : b,
      ),
    );
    if (idx >= 0) setState(() => _sliderIndex = idx);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              '${_currentSpeed.toStringAsFixed(2)}x',
              style: const TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                _CircleBtn(
                  icon: Icons.remove,
                  onPressed: _sliderIndex > 0
                      ? () {
                          setState(() => _sliderIndex--);
                          _apply(_speedValues[_sliderIndex]);
                        }
                      : null,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.black54,
                      inactiveTrackColor: Colors.grey.shade300,
                      thumbColor: Colors.black87,
                    ),
                    child: Slider(
                      value: _sliderIndex.toDouble(),
                      min: 0,
                      max: (_speedValues.length - 1).toDouble(),
                      divisions: _speedValues.length - 1,
                      onChanged: (v) {
                        final idx = v.round().clamp(0, _speedValues.length - 1);
                        setState(() => _sliderIndex = idx);
                        _apply(_speedValues[idx]);
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                _CircleBtn(
                  icon: Icons.add,
                  onPressed: _sliderIndex < _speedValues.length - 1
                      ? () {
                          setState(() => _sliderIndex++);
                          _apply(_speedValues[_sliderIndex]);
                        }
                      : null,
                ),
              ],
            ),
            const SizedBox(height: 24),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _speedPresets.map((p) {
                  final isSelected = (_currentSpeed - p.value).abs() < 0.01;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Material(
                          color: isSelected
                              ? Colors.grey.shade300
                              : Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(12),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(12),
                            onTap: () => _apply(p.value),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                              child: Text(
                                p.label,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: isSelected
                                      ? FontWeight.w600
                                      : FontWeight.w500,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CircleBtn extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  const _CircleBtn({required this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.grey.shade200,
      shape: const CircleBorder(),
      child: IconButton(
        icon: Icon(icon, color: Colors.black87),
        onPressed: onPressed,
        padding: const EdgeInsets.all(12),
      ),
    );
  }
}
