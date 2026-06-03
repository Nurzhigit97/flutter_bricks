import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:{{packageName}}/core/theme/styles/app_colors.dart';
import 'package:{{packageName}}/core/theme/styles/app_text_style.dart';
import 'package:{{packageName}}/core/theme/styles/input_decoration.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.primaryColor,
    brightness: Brightness.light,
    surface: AppColors.white,
  ).copyWith(surfaceTint: AppColors.white),
  scaffoldBackgroundColor: AppColors.white,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.white,
    elevation: 0,
    titleTextStyle: TextStyle(
      color: AppColors.black,
      fontSize: 28,
      fontWeight: FontWeight.w700,
    ),
    scrolledUnderElevation: 0,
    surfaceTintColor: AppColors.white,
    shadowColor: Colors.transparent,
  ),

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
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: AppColors.transparent,
    surfaceTintColor: AppColors.white,
  ),
  cardTheme: const CardThemeData(
    color: AppColors.white,
    surfaceTintColor: AppColors.white,
    elevation: 0,
  ),
  dialogTheme: const DialogThemeData(
    backgroundColor: AppColors.white,
    surfaceTintColor: AppColors.white,
  ),
  datePickerTheme: const DatePickerThemeData(
    backgroundColor: AppColors.white,
    surfaceTintColor: AppColors.white,
    headerBackgroundColor: AppColors.white,
  ),
  timePickerTheme: const TimePickerThemeData(
    backgroundColor: AppColors.white,
    dialBackgroundColor: AppColors.white,
    hourMinuteColor: AppColors.hintBackColor,
    dayPeriodColor: AppColors.hintBackColor,
    dialHandColor: AppColors.primaryColor,
    dialTextColor: AppColors.textMainLight,
    entryModeIconColor: AppColors.primaryColor,
    hourMinuteTextColor: AppColors.textMainLight,
    dayPeriodTextColor: AppColors.textMainLight,
  ),

  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: AppColors.transparent,
    elevation: 0,
    selectedItemColor: AppColors.white,
    unselectedItemColor: AppColors.hintColor,
    selectedLabelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
    unselectedLabelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
  ),
);
