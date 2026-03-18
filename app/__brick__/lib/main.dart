import 'dart:async';
import 'package:{{packageName}}/app.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:{{packageName}}/shared/core/helper/helper.dart';
import 'package:{{packageName}}/shared/core/services/fcm_service.dart';
import 'package:{{packageName}}/shared/core/services/firebase_crashlytics_service.dart';
import 'package:{{packageName}}/shared/utils/injections.dart';
import 'package:{{packageName}}/shared/utils/log/app_observer.dart';
import 'package:{{packageName}}/shared/core/services/firebase_analytics_service.dart';

Future<void> _initializeApp() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Устанавливаем background message handler для FCM
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  await initInjections();

  await AnalyticsService.instance.isAnalyticsEnabled();

  Bloc.observer = AppBlocObserver(
    onLog: (log) {
      debugPrint('🔍 BLoC Log: $log');
    },
  );
}

Future<void> main() async {
  // ensureInitialized и runApp должны вызываться в одной зоне, иначе Zone mismatch.
  // Вся инициализация и runApp выполняются внутри runZonedGuarded.
  // clear all data from local storage
  runZonedGuarded(
    () async {
      await _initializeApp();
      await Helper.clearSecureStorage();
      Future.delayed(const Duration(seconds: 1), () {
        FlutterNativeSplash.remove();
      });

      runApp(
        // DevicePreview(
        //   enabled: !kReleaseMode,
        //   builder: (context) => const App(),
        // ),
        const App(),
      );
    },
    (error, stackTrace) {
      // iOS: youtube_player_flutter (flutter_inappwebview) может вызывать evaluateJavascript
      // после навигации/закрытия WebView — канал уже недоступен. Игнорируем.
      if (error is MissingPluginException) {
        final msg = error.message ?? '';
        if (msg.contains('evaluateJavascript') &&
            msg.contains('flutter_inappwebview')) {
          return;
        }
      }

      if (kReleaseMode) {
        CrashlyticsService.instance.recordError(
          error,
          stackTrace,
          reason: 'Uncaught async error',
          fatal: true,
        );
      } else {
        debugPrint('❌ Uncaught async error: $error');
        debugPrint('Stack trace: $stackTrace');
      }
    },
  );
}
