import 'dart:async';
import 'package:{{packageName}}/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:{{packageName}}/shared/utils/injections.dart';
import 'package:{{packageName}}/shared/utils/log/app_observer.dart';

Future<void> _initializeApp() async {
  WidgetsBinding.flutterWidgetsBinding.ensureInitialized();
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
      runApp(const App());
    },
    (error, stackTrace) {
      debugPrint('❌ Uncaught error: $error');
      debugPrint('Stack trace: $stackTrace');
    },
  );
}
