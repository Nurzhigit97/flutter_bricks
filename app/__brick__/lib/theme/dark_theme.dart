// lib/shared/theme/dark_theme.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:{{packageName}}/core/theme/styles/app_colors.dart';
import 'package:{{packageName}}/core/theme/styles/app_text_style.dart';

final ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.white,
  primaryColor: AppColors.mainDark,
  fontFamily: GoogleFonts.inter().fontFamily,
  colorScheme: const ColorScheme.dark(
    surface: AppColors.secondaryDark,
    primary: AppColors.primary,
    primaryContainer: AppColors.focusLight,
  ),
  textTheme: AppTextStyles.textTheme,

  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(foregroundColor: AppColors.primary),
  ),

  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.mainDark,
    surfaceTintColor: Colors.transparent,
    elevation: 0,
    scrolledUnderElevation: 0,
    foregroundColor: AppColors.white, // Делаем текст белым для темной темы
    titleTextStyle: TextStyle(
      color: AppColors.white,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    iconTheme: IconThemeData(
      color: AppColors.white, // Делаем иконки белыми для темной темы
    ),
  ),
);
