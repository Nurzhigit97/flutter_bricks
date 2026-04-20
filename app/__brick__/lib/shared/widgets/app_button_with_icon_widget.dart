import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:{{packageName}}/core/utils/extensions/context_extensions.dart';

class AppButtonWithIconWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final String title;
  final Color? bgColor;
  final TextStyle? textStyle;
  final bool? isLoading;
  final double? height;
  final double? width;
  final Color? borderColor;
  final double? borderRadius;
  final IconData? icon;
  final Color? iconColor;
  final String? image;
  final String? imageType;
  final IconAlignment? iconAlignment;
  final EdgeInsets? padding;
  final Gradient? backgroundGradient;

  const AppButtonWithIconWidget({
    super.key,
    this.onTap,
    required this.title,
    this.bgColor,
    this.textStyle,
    this.isLoading = false,
    this.height,
    this.width,
    this.borderColor,
    this.borderRadius,
    this.icon,
    this.iconAlignment,
    this.image,
    this.iconColor,
    this.imageType,
    this.padding,
    this.backgroundGradient,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;
    final onPrimary = scheme.onPrimary;
    final primary = scheme.primary;

    final effectiveBorderRadius = borderRadius ?? 12;
    final effectiveIconColor = iconColor ?? onPrimary;

    final button = ElevatedButton.icon(
      icon: _buildLeading(effectiveIconColor),
      onPressed: isLoading == true ? null : onTap,
      style: ElevatedButton.styleFrom(
        foregroundColor: borderColor != null
            ? borderColor!.withAlpha(1)
            : primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(effectiveBorderRadius),
          side: backgroundGradient == null && borderColor != null
              ? BorderSide(color: borderColor!)
              : BorderSide.none,
        ),
        padding: padding ?? EdgeInsets.zero,
        backgroundColor: backgroundGradient != null
            ? Colors.transparent
            : bgColor ?? primary,
        minimumSize: Size(width ?? double.infinity, height ?? 50),
        maximumSize: Size(width ?? double.infinity, height ?? 50),
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
      ),
      label: isLoading == true
          ? SizedBox(
              width: 25,
              height: 25,
              child: CircularProgressIndicator(color: onPrimary),
            )
          : Text(
              title,
              style:
                  textStyle ??
                  TextStyle(
                    color: onPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
            ),
    );

    if (backgroundGradient == null) {
      return button;
    }

    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: backgroundGradient,
        borderRadius: BorderRadius.circular(effectiveBorderRadius),
        border: borderColor != null ? Border.all(color: borderColor!) : null,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(effectiveBorderRadius),
        child: button,
      ),
    );
  }

  Widget _buildLeading(Color color) {
    if (icon != null) {
      return Icon(icon, color: color, size: 20);
    }
    if (image == null) {
      return const SizedBox.shrink();
    }
    if (imageType == 'svg') {
      return SvgPicture.asset(
        image!,
        colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
      );
    }
    return Image.asset(
      image!,
      width: 24,
      height: 24,
      color: color,
      fit: BoxFit.contain,
    );
  }
}
