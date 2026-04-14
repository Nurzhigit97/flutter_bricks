import 'package:flutter/material.dart';

extension LocaleNameExtensions on Locale {
  String get name {
    switch (languageCode) {
      case 'en':
        return 'English';
      case 'ru':
        return 'Русский';
      default:
        return 'Unknown';
    }
  }
}
