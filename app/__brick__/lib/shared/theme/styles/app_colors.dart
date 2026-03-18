import 'package:flutter/material.dart';

class AppColors {
  // ====================
  // Core Colors
  // ====================
  static const Color black = Colors.black;
  static const Color white = Colors.white;
  static const Color scaffoldColor = Color(0xFFF5F7F9);
  static const Color green = Color(0xFF27AE85);
  static const Color red = Color(0xFFF3514A);
  static const Color transparent = Colors.transparent;
  static const Color bgCard = Color(0xffF8E9AA);
  static const Color bgButton = Color(0xffF3F6FF);
  static const Color progressColor = Color(0xffF4FFF6);
  static const Color progressIcon = Color(0xff27AE85);
  static const Color proSubscribed = Color(0xffF8B144);

  // ====================
  // Grey Colors (Used)
  // ====================
  static const Color grey = Color(0xFF999999);
  static const Color grey0 = Color(0xFF9F9F9F);
  static const Color grey1 = Color(0xFFE8E8E8);
  static const Color grey2 = Color(0xffE0E0E0);
  static const Color grey3 = Color(0xffDBDBDB);
  static const Color grey63 = Color(0xff636363);
  static const Color hintBackColor = Color(0xffF5F7FA);

  // ====================
  // Primary Colors
  // ====================
  static const Color primaryColor = Color(0xFF055BA5);
  static const int _primaryPrimaryValue = 0xFF055BA5;

  static const MaterialColor primary =
      MaterialColor(_primaryPrimaryValue, <int, Color>{
        50: Color(0xFFE3F2FD),
        100: Color(0xFFBBDEFB),
        200: Color(0xFF90CAF9),
        300: Color(0xFF64B5F6),
        400: Color(0xFF42A5F5),
        500: Color(_primaryPrimaryValue),
        600: Color(0xFF1E88E5),
        700: Color(0xFF1976D2),
        800: Color(0xFF1565C0),
        900: Color(0xFF0D47A1),
      });

  static const int _primaryAccentValue = 0xFF66B2FF;

  static const MaterialColor primaryAccent =
      MaterialColor(_primaryAccentValue, <int, Color>{
        100: Color(0xFF99D3FF),
        200: Color(0xFF66B2FF),
        400: Color(0xFF33A5FF),
        700: Color(0xFF008CFF),
      });

  // ====================
  // Hint Colors
  // ====================
  static const Color hintColor = Color(0xFF6E778D);
  static const Color bottomNavActiveColor = Color(0xFF055BA5);

  // ====================
  // Text Colors
  // ====================
  static const Color textMainLight = Color(0xFF171717);
  static const Color textMainDark = Color(0xFFFFFFFF);
  static const Color textSecondaryLight = Color(0xFF6E778D);
  static const Color textSecondaryDark = Color(0xFF87929D);
  static const Color textTertiaryDark = Color(0xFF6C757D);
  static const Color textInverse = Color(0xFFFFFFFF);
  static const Color lightSystemFocus = Color(0xFF055BA5);

  // ====================
  // System Colors
  // ====================
  static const Color errorLight = Color(0xFFF3514A);
  static const Color errorDark = Color(0xFFF3514A);
  static const Color errorBGLight = Color(0xFFFFF4F4);
  static const Color errorBGDark = Color(0xFF510606);

  static const Color warningLight = Color(0xFFFFCD00);
  static const Color warningDark = Color(0xFFFFCD00);
  static const Color warningBGLight = Color(0xFFFFEAF5);
  static const Color warningBGDark = Color(0xFF3A2713);

  static const Color successLight = Color(0xFF27AE85);
  static const Color successDark = Color(0xFF27AE85);
  static const Color successBGLight = Color(0xFFF4FFF6);
  static const Color successBGDark = Color(0xFF24330C);

  static const Color focusLight = Color(0xFF055BA5);
  static const Color focusLight2 = Color(0xFF055BA5);
  static const Color focusLight3 = Color(0xFFD64801);
  static const Color focusDark = Color(0xFF3D77E9);
  static const Color focusBGLight = Color(0xFFF9FCFF);
  static const Color focusBGDark = Color(0xFF0C2E4A);

  // ====================
  // Background Colors
  // ====================
  static const Color mainLight = Color(0xFFF5F7F9);
  static const Color mainDark = Color(0xFF303642);
  static const Color secondaryLight = Color(0xFFFFFFFF);
  static const Color secondaryDark = Color(0xFF1E2028);
  static const Color featureFucntion = Color(0xFFEBE5F8);
  static const Color ortTestBG = Color(0xFFE8EFF7);

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF055BA5), Color(0xFF5E9DD3)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const Color ortMathColumn = Color(0xFFF2F8F2);
  static const Color ortMathClassic = Color(0xFFFFF4EE);
  static const Color ortAnalogy = Color(0xFFF6F3FF);
  static const Color ortReading = Color(0xFFFFF5F2);
  static const Color ortGrammar = Color(0xFFF3F6FF);
}
