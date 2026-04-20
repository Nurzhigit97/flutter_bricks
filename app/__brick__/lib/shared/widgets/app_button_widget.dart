import 'package:{{packageName}}/core/utils/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class AppButtonWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final String title;
  final Color? bgColor;
  final TextStyle? textStyle;
  final bool? isLoading;
  final double? height;
  final double? width;
  final Color? borderColor;
  final EdgeInsets? padding;
  final double? borderRadius;

  const AppButtonWidget({
    super.key,
    this.onTap,
    required this.title,
    this.bgColor,
    this.textStyle,
    this.isLoading = false,
    this.height,
    this.width,
    this.borderColor,
    this.padding,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading == true ? null : onTap,
      style: ElevatedButton.styleFrom(
        foregroundColor: borderColor != null
            ? borderColor!.withAlpha(1)
            : context.colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 12),
          side: borderColor != null
              ? BorderSide(color: borderColor!)
              : BorderSide.none,
        ),
        backgroundColor: bgColor ?? context.colorScheme.primary,
        shadowColor: Colors.transparent,
        padding:
            padding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      child: Text(
        textAlign: TextAlign.center,
        title,
        style:
            textStyle ??
            TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: context.colorScheme.onSurface,
            ),
      ),
    );
  }
}
