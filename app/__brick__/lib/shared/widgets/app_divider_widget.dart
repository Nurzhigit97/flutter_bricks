import 'package:flutter/material.dart';
import 'package:{{packageName}}/core/theme/styles/app_colors.dart';

class AppDividerWidget extends StatelessWidget {
  const AppDividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 0,
      color: AppColors.hintColor.withValues(alpha: 0.2),
    );
  }
}
