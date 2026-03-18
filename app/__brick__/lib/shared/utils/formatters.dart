import 'package:flutter/material.dart';
import 'package:{{packageName}}/shared/core/translation/generated/l10n.dart';

/// Utility functions for formatting time, dates, and other values
class Formatters {
  /// Formats duration with hours, minutes, and seconds
  static String formattedTimeWithHours(
    Duration duration,
    BuildContext context,
  ) {
    final elapsedSeconds = duration.inSeconds;
    final hours = (elapsedSeconds ~/ 3600);
    final minutes = (elapsedSeconds ~/ 60) % 60;
    final seconds = elapsedSeconds % 60;

    if (elapsedSeconds < 3600) {
      final mins = elapsedSeconds ~/ 60;
      final secs = elapsedSeconds % 60;
      return '${mins.toString().padLeft(2, '0')} : ${secs.toString().padLeft(2, '0')} ${S.of(context).sec}';
    }

    return '${hours.toString().padLeft(2, '0')} ${S.of(context).h} : ${minutes.toString().padLeft(2, '0')} ${S.of(context).min} : ${seconds.toString().padLeft(2, '0')} ${S.of(context).sec}';
  }

  /// Formats duration for quiz (without localization)
  static String formattedTimeWithHoursForQuiz(Duration duration) {
    final elapsedSeconds = duration.inSeconds;
    final hours = (elapsedSeconds ~/ 3600);
    final minutes = (elapsedSeconds ~/ 60) % 60;
    final seconds = elapsedSeconds % 60;

    if (elapsedSeconds < 3600) {
      final mins = elapsedSeconds ~/ 60;
      final secs = elapsedSeconds % 60;
      return '${mins.toString().padLeft(2, '0')} : ${secs.toString().padLeft(2, '0')}';
    }

    return '${hours.toString().padLeft(2, '0')} : ${minutes.toString().padLeft(2, '0')} : ${seconds.toString().padLeft(2, '0')}';
  }

  /// Gets time format (12H or 24H)
  static String getTimeFormat() {
    return DateTime.now().timeZoneOffset.inHours > 0 ? '12H' : '24H';
  }

  /// Gets timezone name
  static String getTimeZone() {
    return DateTime.now().timeZoneName;
  }

  /// Converts a [double] value to an [int] safely
  static int? doubleToInt(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is double) return value.toInt();
    if (value is String) {
      final parsed = double.tryParse(value);
      return parsed?.toInt();
    }
    return null;
  }

  /// Converts hex color code to Color
  static Color? getColorFromHex(String? colorCode) {
    if (colorCode != null && colorCode.length == 6) {
      return Color(int.parse('0xff$colorCode'));
    }
    return null;
  }
}
