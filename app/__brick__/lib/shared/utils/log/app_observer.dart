import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  AppBlocObserver({this.onLog});

  final void Function(String log)? onLog;

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    onLog?.call('Event: $event');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    onLog?.call('Error: $error');
  }
}
