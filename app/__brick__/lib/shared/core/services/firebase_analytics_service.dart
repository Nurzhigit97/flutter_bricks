import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:{{packageName}}/shared/utils/injections.dart';
import 'package:{{packageName}}/shared/core/services/firebase_crashlytics_service.dart';

class AnalyticsService {
  static final AnalyticsService instance = AnalyticsService._();

  AnalyticsService._();

  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  /// Проверяем, включен ли сбор аналитики
  Future<bool> isAnalyticsEnabled() async {
    try {
      // В Firebase Analytics нет прямого метода для проверки статуса
      // Но мы можем попробовать отправить тестовое событие
      await _analytics.logEvent(name: 'analytics_test');
      return true;
    } catch (e) {
      debugPrint("❌ Firebase Analytics Error: $e");
      return false;
    }
  }

  /// Устанавливаем свойства пользователя
  Future<void> setUserProperties({
    String? gradeLevel,
    String? preferredSubject,
    String? subscriptionType,
    String? language,
  }) async {
    if (gradeLevel != null) {
      await _analytics.setUserProperty(name: 'grade_level', value: gradeLevel);
    }
    if (preferredSubject != null) {
      await _analytics.setUserProperty(
        name: 'preferred_subject',
        value: preferredSubject,
      );
    }
    if (subscriptionType != null) {
      await _analytics.setUserProperty(
        name: 'subscription_type',
        value: subscriptionType,
      );
    }
    if (language != null) {
      await _analytics.setUserProperty(name: 'language', value: language);
    }
  }

  /// Экран
  Future<void> logScreenView({required String screenName}) async {
    try {
      await _analytics.logScreenView(screenName: screenName);
      debugPrint("✅ Firebase Analytics: Screen view logged - $screenName");
    } catch (e) {
      debugPrint("❌ Firebase Analytics Error: Failed to log screen view - $e");
    }
  }

  /// Общее событие
  Future<void> logEvent({
    required String name,
    Map<String, Object>? parameters,
  }) async {
    try {
      await _analytics.logEvent(name: name, parameters: parameters);
      debugPrint("✅ Firebase Analytics: Event logged - $name");
    } catch (e) {
      debugPrint("❌ Firebase Analytics Error: Failed to log event - $e");
    }
  }

  /// Выбор теста
  Future<void> logSelectTest({
    required String subject,
    required String testId,
    String? difficultyLevel,
  }) async {
    await _analytics.logEvent(
      name: 'select_test',
      parameters: {
        'subject': subject,
        'test_id': testId,
        'difficulty_level': ?difficultyLevel,
      },
    );
  }

  /// Начало теста
  Future<void> logStartTest({
    required String subject,
    required String testId,
  }) async {
    await _analytics.logEvent(
      name: 'start_test',
      parameters: {'subject': subject, 'test_id': testId},
    );
  }

  /// Ответ на вопрос
  Future<void> logAnswerQuestion({
    required String subject,
    required String testId,
    required String questionId,
    required bool isCorrect,
    required int timeSpent,
  }) async {
    await _analytics.logEvent(
      name: 'answer_question',
      parameters: {
        'subject': subject,
        'test_id': testId,
        'question_id': questionId,
        'is_correct': isCorrect,
        'time_spent': timeSpent,
      },
    );
  }

  /// Прогресс
  Future<void> logTestProgress({
    required String subject,
    required String testId,
    required int completedPercent,
  }) async {
    await _analytics.logEvent(
      name: 'test_progress',
      parameters: {
        'subject': subject,
        'test_id': testId,
        'completed_percent': completedPercent,
      },
    );
  }

  /// Результат теста
  Future<void> logTestResult({
    required String subject,
    required String testId,
    required double scorePercent,
    required bool passed,
  }) async {
    await _analytics.logEvent(
      name: 'test_result',
      parameters: {
        'subject': subject,
        'test_id': testId,
        'score_percent': scorePercent,
        'passed': passed,
      },
    );
  }

  /// Выход без завершения
  Future<void> logExitTest({required int currentQuestionIndex}) async {
    debugPrint(
      "✅ Firebase Analytics: Exit test logged - ${currentQuestionIndex + 1}",
    );

    await _analytics.logEvent(
      name: 'exit_test',
      parameters: {'current_question_index': currentQuestionIndex + 1},
    );
  }

  /// Ошибка
  Future<void> logAppError({
    required String message,
    String? stacktrace,
  }) async {
    // Отправляем в Analytics
    await _analytics.logEvent(
      name: 'app_error',
      parameters: {'message': message, 'stacktrace': ?stacktrace},
    );

    // Отправляем в Crashlytics
    try {
      await sl<CrashlyticsService>().recordError(
        Exception(message),
        stacktrace != null ? StackTrace.fromString(stacktrace) : null,
        reason: 'App Error',
        fatal: false,
      );
    } catch (e) {
      debugPrint("❌ Crashlytics Error: Failed to log error - $e");
    }
  }

  /// Просмотр новости из уведомления
  Future<void> logNewsViewFromNotification({required String newsId}) async {
    await _analytics.logEvent(
      name: 'news_view_from_notification',
      parameters: {'news_id': newsId},
    );
  }
}
