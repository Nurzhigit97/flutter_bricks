import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:{{packageName}}/shared/utils/injections.dart';
import 'package:{{packageName}}/shared/core/services/firebase_crashlytics_service.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver({this.onLog});

  final void Function(String log)? onLog;

  @override
  void onCreate(BlocBase<dynamic> bloc) {
    super.onCreate(bloc);
    onLog?.call('onCreate(${bloc.state})');
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    onLog?.call('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    onLog?.call('onError(${bloc.runtimeType}, $error, $stackTrace)');

    // Отправляем ошибку в Crashlytics
    try {
      sl<CrashlyticsService>().recordError(
        error,
        stackTrace,
        reason: 'BLoC Error in ${bloc.runtimeType}',
        fatal: false,
      );
    } catch (e) {
      // Игнорируем ошибки при отправке в Crashlytics
    }

    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase<dynamic> bloc) {
    super.onClose(bloc);
    onLog?.call('onClose(${bloc.runtimeType})');
  }
}
