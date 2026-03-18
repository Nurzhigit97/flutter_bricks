import 'package:flutter_svg/flutter_svg.dart';
import 'package:{{packageName}}/shared/theme/styles/app_colors.dart';
import 'package:flutter/material.dart';

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
    final effectiveBorderRadius = borderRadius ?? 12;

    final button = ElevatedButton.icon(
      icon: icon != null
          ? Icon(icon, color: iconColor ?? AppColors.white, size: 20)
          : (image != null
                ? imageType == 'svg'
                      ? SvgPicture.asset(
                          '$image',
                          colorFilter: ColorFilter.mode(
                            iconColor ?? AppColors.white,
                            BlendMode.srcIn,
                          ),
                        )
                      : Image.asset(
                          '$image',
                          width: 24,
                          height: 24,
                          color: iconColor ?? AppColors.white,
                          fit: BoxFit.contain,
                        )
                : const SizedBox.shrink()),
      onPressed: isLoading == true ? null : onTap,
      style: ElevatedButton.styleFrom(
        foregroundColor: borderColor != null
            ? borderColor!.withAlpha(1)
            : AppColors.primaryAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(effectiveBorderRadius),
          side: backgroundGradient == null && borderColor != null
              ? BorderSide(color: borderColor!)
              : BorderSide.none,
        ),
        padding: padding ?? EdgeInsets.zero,
        backgroundColor: backgroundGradient != null
            ? Colors.transparent
            : bgColor ?? AppColors.primary,
        minimumSize: Size(width ?? double.infinity, height ?? 50),
        maximumSize: Size(width ?? double.infinity, height ?? 50),
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
      ),
      label: isLoading == true
          ? const SizedBox(
              width: 25,
              height: 25,
              child: CircularProgressIndicator(color: Colors.white),
            )
          : Text(
              title,
              style:
                  textStyle ??
                  const TextStyle(
                    color: AppColors.white,
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
}
