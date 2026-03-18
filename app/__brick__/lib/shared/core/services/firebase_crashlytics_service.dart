import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

class CrashlyticsService {
  static final CrashlyticsService instance = CrashlyticsService._();

  CrashlyticsService._();

  final FirebaseCrashlytics _crashlytics = FirebaseCrashlytics.instance;

  /// Настройка автоматического сбора ошибок
  Future<void> initialize() async {
    // Включаем автоматический сбор ошибок только в release режиме
    await _crashlytics.setCrashlyticsCollectionEnabled(kReleaseMode);

    // Настраиваем обработчики ошибок только в release режиме
    if (kReleaseMode) {
      FlutterError.onError = (FlutterErrorDetails details) {
        _crashlytics.recordFlutterFatalError(details);
      };

      // Настраиваем обработчик ошибок платформы
      PlatformDispatcher.instance.onError = (error, stack) {
        _crashlytics.recordError(error, stack, fatal: true);
        return true;
      };
    }
  }

  /// Записать ошибку в Crashlytics
  Future<void> recordError(
    dynamic exception,
    StackTrace? stackTrace, {
    String? reason,
    bool fatal = false,
  }) async {
    if (kReleaseMode) {
      await _crashlytics.recordError(
        exception,
        stackTrace,
        reason: reason,
        fatal: fatal,
      );
    }
  }

  /// Записать пользовательский лог
  Future<void> log(String message) async {
    if (kReleaseMode) {
      await _crashlytics.log(message);
    }
  }
}
