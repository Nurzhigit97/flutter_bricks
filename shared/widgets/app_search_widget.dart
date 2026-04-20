// AppSearchBarWidget - исправленная версия
import 'package:flutter/material.dart';
import 'package:work_up/core/helper/extensions.dart';
import 'package:work_up/core/translation/generated/l10n.dart';
import 'dart:async';

class AppSearchWidget extends StatefulWidget {
  final String? hintText;
  final String? title;

  final ValueChanged<String>? onChanged;
  final VoidCallback? onClear;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final VoidCallback? onTapOutside;
  final bool autofocus;

  const AppSearchWidget({
    super.key,
    this.hintText,
    this.title,
    this.onChanged,
    this.onClear,
    this.margin,
    this.padding,
    this.autofocus = false,
    this.onTapOutside,
  });

  @override
  State<AppSearchWidget> createState() => _AppSearchWidgetState();
}

class _AppSearchWidgetState extends State<AppSearchWidget> {
  Timer? _debounceTimer;
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      _onChanged(_controller.text);
    });
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _onChanged(String value) {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 300), () {
      widget.onChanged?.call(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (widget.title != null) ...[
          const SizedBox(height: 8),
          Text(
            widget.title!,
            style: context.theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w500,
              color: scheme.onSurfaceVariant,
              fontSize: 14,
            ),
          ),
        ],
        TextField(
          controller: _controller,
          autofocus: widget.autofocus,
          onTapOutside: (event) {
            widget.onTapOutside?.call();
            FocusScope.of(context).unfocus();
          },
          onChanged: (value) {
            setState(() {
              _controller.text = value;
            });
          },
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.search,

          decoration: InputDecoration(
            filled: true,
            fillColor: scheme.surfaceContainerHighest,
            errorBorder: InputBorder.none,
            constraints: const BoxConstraints(minHeight: 32, maxHeight: 40),

            isDense: true,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 8, right: 4),
              child: Icon(
                Icons.search,
                color: scheme.onSurfaceVariant,
                size: 18,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: scheme.surfaceContainerHighest),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: scheme.surfaceContainerHighest),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: scheme.primary),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: scheme.error),
            ),

            suffixIcon: _controller.text.isNotEmpty
                ? IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(
                      minWidth: 30,
                      minHeight: 30,
                    ),
                    icon: Icon(
                      Icons.clear,
                      color: scheme.onSurfaceVariant,
                      size: 16,
                    ),
                    onPressed: () {
                      _controller.clear();
                      _debounceTimer?.cancel();
                      widget.onClear?.call();
                      widget.onChanged?.call('');
                    },
                  )
                : null,
            hintText: widget.hintText ?? S.of(context).search,
            hintStyle: TextStyle(color: scheme.onSurfaceVariant, fontSize: 14),
          ),
          style: const TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}
