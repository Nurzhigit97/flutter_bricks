// lib/core/theme/styles/text_styles.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:{{packageName}}/core/theme/styles/app_colors.dart';

class AppTextStyles {
  // ====================
  // Display Styles (Headers)
  // ====================
  static TextStyle get header32 => TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    color: AppColors.textMainLight,
    fontFamily: GoogleFonts.inter().fontFamily,
    letterSpacing: -1.0,
    height: 36.0 / 32.0,
  );

  static TextStyle get header24 => TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.textMainLight,
    fontFamily: GoogleFonts.inter().fontFamily,
    letterSpacing: 0,
    height: 32.0 / 24.0,
  );

  static TextStyle get header20 => TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.textMainLight,
    fontFamily: GoogleFonts.inter().fontFamily,
    letterSpacing: 0,
    height: 28.0 / 20.0,
  );

  static TextStyle get header18 => TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.textMainLight,
    fontFamily: GoogleFonts.inter().fontFamily,
    letterSpacing: 0,
    height: 28.0 / 18.0,
  );

  static TextStyle get header18Small => TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.textMainLight,
    fontFamily: GoogleFonts.inter().fontFamily,
    letterSpacing: 0,
    height: 24.0 / 16.0,
  );

  static TextStyle get header18Medium => TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.textMainLight,
    fontFamily: GoogleFonts.inter().fontFamily,
    letterSpacing: 0,
    height: 28.0 / 18.0,
  );

  // ====================
  // Body Styles
  // ====================
  static TextStyle get body16 => TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.textMainLight,
    fontFamily: GoogleFonts.inter().fontFamily,
    letterSpacing: 0,
    height: 24.0 / 16.0,
  );

  static TextStyle get body16SemiBold => TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textMainLight,
    fontFamily: GoogleFonts.inter().fontFamily,
    letterSpacing: 0,
    height: 24.0 / 16.0,
  );

  static TextStyle get body16Medium => TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textMainLight,
    fontFamily: GoogleFonts.inter().fontFamily,
    letterSpacing: 0,
    height: 24.0 / 16.0,
  );

  static TextStyle get body16Short => TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textMainLight,
    fontFamily: GoogleFonts.inter().fontFamily,
    letterSpacing: 0,
    height: 19.0 / 16.0,
  );

  static TextStyle get body14 => TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textMainLight,
    fontFamily: GoogleFonts.inter().fontFamily,
    letterSpacing: 0,
    height: 20.0 / 14.0,
  );

  static TextStyle get body14SemiBold => TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.textMainLight,
    fontFamily: GoogleFonts.inter().fontFamily,
    letterSpacing: 0,
    height: 20.0 / 14.0,
  );

  static TextStyle get body14Medium => TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.textMainLight,
    fontFamily: GoogleFonts.inter().fontFamily,
    letterSpacing: 0,
    height: 20.0 / 14.0,
  );

  static TextStyle get body12 => TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.textMainLight,
    fontFamily: GoogleFonts.inter().fontFamily,
    letterSpacing: 0,
    height: 16.0 / 12.0,
  );

  static TextStyle get body12SemiBold => TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppColors.textMainLight,
    fontFamily: GoogleFonts.inter().fontFamily,
    letterSpacing: 0,
    height: 16.0 / 12.0,
  );

  static TextStyle get body12Medium => TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.textMainLight,
    fontFamily: GoogleFonts.inter().fontFamily,
    letterSpacing: 0,
    height: 16.0 / 12.0,
  );

  static TextStyle get body10 => TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    color: AppColors.textMainLight,
    fontFamily: GoogleFonts.inter().fontFamily,
    letterSpacing: 0,
    height: 12.0 / 10.0,
  );

  static TextStyle get body10SemiBold => TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w600,
    color: AppColors.textMainLight,
    fontFamily: GoogleFonts.inter().fontFamily,
    letterSpacing: 0,
    height: 12.0 / 10.0,
  );

  static TextStyle get body10Medium => TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: AppColors.textMainLight,
    fontFamily: GoogleFonts.inter().fontFamily,
    letterSpacing: 0,
    height: 12.0 / 10.0,
  );

  // ====================
  // Special Styles
  // ====================
  static TextStyle get underlined => TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.textMainLight,
    fontFamily: GoogleFonts.dmSans().fontFamily,
    letterSpacing: 0,
    height: 24.0 / 16.0,
    decoration: TextDecoration.underline,
  );

  static TextStyle get crossedOut => TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.textMainLight,
    fontFamily: GoogleFonts.dmSans().fontFamily,
    letterSpacing: 0,
    height: 24.0 / 16.0,
    decoration: TextDecoration.lineThrough,
  );

  // ====================
  // Material Design Text Theme Mappings
  // ====================
  static TextTheme get textTheme => TextTheme(
    // Display styles (Headers)
    displayLarge: header32,
    displayMedium: header24,
    displaySmall: header20,

    // Headline styles
    headlineLarge: header18,
    headlineMedium: header18Medium,
    headlineSmall: header18Small,

    // Title styles
    titleLarge: body16SemiBold,
    titleMedium: body16Medium,
    titleSmall: body14Medium,

    // Body styles
    bodyLarge: body16,
    bodyMedium: body14,
    bodySmall: body12,

    // Label styles
    labelLarge: body14SemiBold,
    labelMedium: body12SemiBold,
    labelSmall: body10,
  );
}
