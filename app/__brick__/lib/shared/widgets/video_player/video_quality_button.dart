import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

/// Опция качества: id, подпись, подпись второго ряда (Super resolution).
const List<({String id, String label, String? sublabel})> _qualityOptions = [
  (id: 'auto', label: 'Auto', sublabel: null),
  (id: '1080p', label: '1080p', sublabel: 'Super resolution'),
  (id: '720p', label: '720p', sublabel: 'Super resolution'),
  (id: '480p', label: '480p', sublabel: 'Super resolution'),
  (id: '240p', label: '240p', sublabel: null),
  (id: '144p', label: '144p', sublabel: null),
];

/// Соответствие значений YouTube API нашим id опций.
const Map<String, String> _youtubeQualityToId = {
  'hd2160': '1080p', // или auto, берём максимальное
  'hd1440': '1080p',
  'hd1080': '1080p',
  'hd720': '720p',
  'hd480': '480p',
  'medium': '480p',
  'small': '240p',
  'tiny': '144p',
};

class VideoQualityButton extends StatefulWidget {
  final YoutubePlayerController controller;

  const VideoQualityButton({super.key, required this.controller});

  @override
  State<VideoQualityButton> createState() => _VideoQualityButtonState();
}

class _VideoQualityButtonState extends State<VideoQualityButton> {
  /// Последний выбор пользователя; при повторном открытии листа показываем его.
  String? _lastSelectedQualityId;

  YoutubePlayerController get controller => widget.controller;

  String _currentQualityId() {
    final q = controller.value.playbackQuality;
    if (q == null || q.isEmpty) return 'auto';
    return _youtubeQualityToId[q] ?? 'auto';
  }

  void _showQualitySheet(BuildContext context) {
    // При открытии показываем последний выбор пользователя, иначе текущее качество плеера
    final selectedId = _lastSelectedQualityId ?? _currentQualityId();
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (sheetContext) => _VideoQualitySheet(
        initialSelectedId: selectedId,
        currentYoutubeQuality: controller.value.playbackQuality,
        onSelect: (id) {
          setState(() => _lastSelectedQualityId = id);
          Navigator.of(sheetContext).pop();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (context, _) {
        final forTooltip =
            _lastSelectedQualityId ??
            controller.value.playbackQuality ??
            'auto';
        return IconButton(
          icon: const Icon(Icons.hd, color: Colors.white, size: 22),
          tooltip: 'Качество: ${_formatQuality(forTooltip)}',
          onPressed: () => _showQualitySheet(context),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        );
      },
    );
  }

  String _formatQuality(String qualityOrId) {
    if (qualityOrId.isEmpty) return _qualityOptions.first.label;
    final id = _youtubeQualityToId[qualityOrId] ?? qualityOrId;
    return _qualityOptions
        .firstWhere((o) => o.id == id, orElse: () => _qualityOptions.first)
        .label;
  }
}

class _VideoQualitySheet extends StatefulWidget {
  final String initialSelectedId;
  final String? currentYoutubeQuality;
  final ValueChanged<String> onSelect;

  const _VideoQualitySheet({
    required this.initialSelectedId,
    required this.currentYoutubeQuality,
    required this.onSelect,
  });

  @override
  State<_VideoQualitySheet> createState() => _VideoQualitySheetState();
}

class _VideoQualitySheetState extends State<_VideoQualitySheet> {
  late String _selectedId;

  @override
  void initState() {
    super.initState();
    _selectedId = widget.initialSelectedId;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF1C1C1E),
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 28),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Качество видео',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 16),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _qualityOptions.length,
                  separatorBuilder: (_, _) => const SizedBox(height: 8),
                  itemBuilder: (context, index) {
                    final option = _qualityOptions[index];
                    final isSelected = _selectedId == option.id;
                    return Material(
                      color: isSelected
                          ? Colors.grey.shade200
                          : const Color(0xFF2C2C2E),
                      borderRadius: BorderRadius.circular(12),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: () {
                          setState(() => _selectedId = option.id);
                          widget.onSelect(option.id);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      option.label,
                                      style: TextStyle(
                                        color: isSelected
                                            ? Colors.black
                                            : Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    if (option.sublabel != null) ...[
                                      const SizedBox(height: 2),
                                      Text(
                                        option.sublabel!,
                                        style: TextStyle(
                                          color: isSelected
                                              ? Colors.black87
                                              : Colors.white70,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ],
                                  ],
                                ),
                              ),
                              if (isSelected)
                                Icon(
                                  Icons.check,
                                  color: Colors.black,
                                  size: 22,
                                ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
