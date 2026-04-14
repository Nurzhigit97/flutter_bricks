import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:{{packageName}}/core/theme/styles/app_colors.dart';
import 'package:{{packageName}}/core/theme/styles/app_text_style.dart';
import 'package:{{packageName}}/core/theme/styles/input_decoration.dart';

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.scaffoldColor,

  primaryColor: AppColors.mainLight,
  splashColor: Colors.transparent,
  highlightColor: Colors.transparent,

  fontFamily: GoogleFonts.inter().fontFamily,

  inputDecorationTheme: AppInputDecoration.inputDecorationTheme,

  textTheme: AppTextStyles.textTheme,

  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(foregroundColor: AppColors.primary),
  ),
  tabBarTheme: const TabBarThemeData(
    indicatorSize: TabBarIndicatorSize.label,
    dividerColor: Colors.transparent,
  ),
  appBarTheme: const AppBarTheme(
    elevation: 0,
    scrolledUnderElevation: 0,
    backgroundColor: AppColors.white,
  ),

  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: AppColors.transparent,
    elevation: 0,
    selectedItemColor: AppColors.focusLight,
    unselectedItemColor: AppColors.textSecondaryLight,
    selectedLabelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
    unselectedLabelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
  ),
);
