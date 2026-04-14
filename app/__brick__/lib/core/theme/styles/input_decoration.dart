// lib/core/theme/styles/text_styles.dart
import 'package:flutter/material.dart';
import 'package:{{packageName}}/core/theme/styles/app_colors.dart';
import 'package:{{packageName}}/core/theme/styles/app_text_style.dart';

class AppInputDecoration {
  static InputDecorationTheme get inputDecorationTheme => InputDecorationTheme(
    hintStyle: AppTextStyles.header18Medium.copyWith(
      color: AppColors.hintColor,
    ),
  );
}
