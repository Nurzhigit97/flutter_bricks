import 'package:flutter/material.dart';
import 'package:{{packageName}}/shared/theme/styles/app_colors.dart';

class AppLoaderWidget extends StatelessWidget {
  final double? size;
  final Color? color;
  const AppLoaderWidget({super.key, this.size, this.color});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size ?? 40,
        height: size ?? 40,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(size ?? 8),
            boxShadow: [
              BoxShadow(
                color: AppColors.textSecondaryLight.withValues(alpha: 0.2),
                blurRadius: 4,
                offset: const Offset(0, -2),
                spreadRadius: 0,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: CircularProgressIndicator.adaptive(
                valueColor: AlwaysStoppedAnimation(
                  color ?? AppColors.primaryAccent,
                ),

                strokeWidth: size ?? 2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
