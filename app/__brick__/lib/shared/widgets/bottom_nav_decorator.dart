import 'package:flutter/material.dart';
import 'package:{{packageName}}/shared/theme/styles/app_colors.dart';

class BottomNavDecorator extends StatelessWidget {
  final Widget child;

  const BottomNavDecorator({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.textSecondaryLight.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, -4),
            spreadRadius: 0.5,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 24, top: 5),
          child: child,
        ),
      ),
    );
  }
}
