import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:{{packageName}}/core/utils/injections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:{{packageName}}/core/services/storage/local_storage.dart';
import 'package:{{packageName}}/core/services/storage/secure_storage.dart';
import 'package:{{packageName}}/shared/widgets/app_loader_widget.dart';
import 'package:{{packageName}}/core/theme/styles/app_colors.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:{{packageName}}/core/utils/formatters.dart';
import 'package:{{packageName}}/core/utils/string_utils.dart';
import 'package:{{packageName}}/core/utils/constants/app_const/app_const.dart';

/// Legacy helper class for backward compatibility
/// Consider using specialized classes: AssetPaths, Formatters, AuthHelper, ErrorHelper, StringUtils
class Helper {
  static int? doubleToInt(dynamic value) => Formatters.doubleToInt(value);

  static String formattedTimeWithHours(
    Duration duration,
    BuildContext context,
  ) {
    return Formatters.formattedTimeWithHours(duration, context);
  }

  static Uint8List? imageBytes(String? image) {
    if (image == null || image.isEmpty) {
      return null;
    }

    try {
      final base64String = image.contains(',') ? image.split(',').last : image;

      return base64Decode(base64String);
    } catch (_) {
      return null;
    }
  }

  static Future<void> clearSecureStorage() async {
    try {
      final storage = sl<FlutterSecureStorage>();
      final prefs = sl<LocalStorage>();
      final isFirstRun = prefs.getBool(AppConst.isFirstLaunch);

      if (isFirstRun) {
        // Preserve auth and app-critical flags before full cleanup.
        final accessToken = prefs.getString(AppConst.accessToken);
        final refreshToken = await sl<SecureStorage>().getValue(
          AppConst.refreshToken,
        );
        final language = prefs.getString(AppConst.language);
        final isFirstLaunchValue = prefs.getBool(AppConst.isFirstLaunch);

        await storage.deleteAll();
        await prefs.clear();

        if (accessToken != null && accessToken.isNotEmpty) {
          await prefs.setString(AppConst.accessToken, accessToken);
        }
        if (refreshToken != null && refreshToken.isNotEmpty) {
          await sl<SecureStorage>().setValue(
            AppConst.refreshToken,
            refreshToken,
          );
        }
        if (language != null && language.isNotEmpty) {
          await prefs.setString(AppConst.language, language);
        }
        await prefs.setBool(AppConst.isFirstLaunch, isFirstLaunchValue);
      }
    } catch (e) {
      log("Error clearing secure storage: $e");
    }
  }

  static String formattedTimeWithHoursForQuiz(Duration duration) {
    return Formatters.formattedTimeWithHoursForQuiz(duration);
  }

  static String getTimeFormat() => Formatters.getTimeFormat();

  static String getTimeZone() => Formatters.getTimeZone();

  // String utilities - delegated to StringUtils
  static String cleanMessageInAIChat(String raw) {
    return StringUtils.cleanMessageInAIChat(raw);
  }

  static void flutterEasyloadingInit() {
    EasyLoading.instance
      ..maskType = EasyLoadingMaskType.clear
      ..loadingStyle = EasyLoadingStyle.custom
      ..dismissOnTap = false
      ..indicatorType = EasyLoadingIndicatorType.ring
      ..indicatorColor = AppColors.primaryAccent
      ..backgroundColor = Colors.transparent
      ..textColor = Colors.black
      ..boxShadow = []
      ..indicatorWidget = const AppLoaderWidget();
  }

  // Date range helpers - kept in Helper as they're app-specific
  static DateTimeRange currentMoth() {
    final now = DateTime.now();
    return DateTimeRange(
      start: DateTime(now.year, now.month, 1),
      end: DateTime(now.year, now.month + 1, 0),
    );
  }

  static String getLanguage() {
    final language = sl<LocalStorage>().getString(AppConst.language);
    if (language == null || language.isEmpty) {
      return 'ru';
    }
    return language;
  }

  static DateTimeRange startWhenCreatedOrder(DateTime? dateCreateOrder) {
    final now = DateTime.now();
    return DateTimeRange(
      start: dateCreateOrder ?? DateTime(now.year, now.month, 1),
      end: DateTime(now.year, now.month + 1, 0),
    );
  }

  // App info - kept in Helper as it's app-specific
  static Future<String> getVersion() async {
    return await PackageInfo.fromPlatform().then((value) => value.version);
  }

  static String mapLanguageForServer(String language) {
    switch (language) {
      case 'ky':
        return 'ky';
      case 'en':
      case 'en-US':
      case 'en-GB':
        return 'ru';
      case 'ru':
      default:
        return 'ru';
    }
  }

  static String mapSectionTypeForServer(String sectionType) {
    switch (sectionType) {
      case 'math_column':
        return 'math_column';
      case 'math_classic':
        return 'math_classic';
      case 'analogy':
        return 'analogy';
      case 'reading':
        return 'reading';
      case 'grammar':
        return 'grammar';
    }

    return sectionType;
  }

  static int? intFromJson(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is num) return value.toInt();
    if (value is String) return int.tryParse(value);
    return null;
  }
}
