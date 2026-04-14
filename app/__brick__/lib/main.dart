import 'dart:async';
import 'package:{{packageName}}/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:{{packageName}}/core/helper/helper.dart';
import 'package:{{packageName}}/core/utils/injections.dart';
import 'package:{{packageName}}/core/utils/log/app_observer.dart';

Future<void> _initializeApp() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await initInjections();

  Bloc.observer = AppBlocObserver(
    onLog: (log) {
      debugPrint('🔍 BLoC Log: $log');
    },
  );
}

Future<void> main() async {
  runZonedGuarded(
    () async {
      await _initializeApp();
      await Helper.clearSecureStorage();
      Future.delayed(const Duration(seconds: 1), () {
        FlutterNativeSplash.remove();
      });

      runApp(const App());
    },
    (error, stackTrace) {
      if (error is MissingPluginException) {
        final msg = error.message ?? '';
        if (msg.contains('evaluateJavascript') &&
            msg.contains('flutter_inappwebview')) {
          return;
        }
      }
      debugPrint('❌ Uncaught async error: $error');
      debugPrint('Stack trace: $stackTrace');
    },
  );
}
