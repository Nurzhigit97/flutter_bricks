import 'package:flutter/material.dart';
import 'package:{{packageName}}/shared/core/helper/extensions.dart';
import 'package:{{packageName}}/shared/theme/styles/app_colors.dart';

class AppSeeAllWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final double? height;
  final Color? color;
  final EdgeInsets? padding;
  final bool divider;
  const AppSeeAllWidget({
    super.key,
    required this.title,
    required this.onTap,
    this.height,
    this.color,
    this.padding,
    this.divider = true,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Padding(
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: height ?? 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title, style: context.theme.textTheme.headlineLarge),
                  InkWell(
                    onTap: onTap,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: color ?? AppColors.bgButton,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.arrow_forward_rounded, size: 16),
                      ),
                    ),
                  ),
                ],
              ),
              if (divider) const SizedBox(height: 24),
            ],
          ),
        );
      },
    );
  }
}
