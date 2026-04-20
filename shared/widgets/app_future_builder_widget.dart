import 'package:flutter/material.dart';
import 'package:work_up/shared/widgets/app_loader_widget.dart';

/// Универсальный FutureBuilder виджет для переиспользования
///
/// Пример использования:
/// ```dart
/// AppFutureBuilder<String>(
///   future: Helper.getVersion(),
///   onData: (data) => Text('Version $data'),
///   onError: (error) => Text('Error: $error'),
///   onLoading: () => const AppLoaderWidget(),
///   initialData: '1.0.0',
/// )
/// ```
class AppFutureBuilder<T> extends StatelessWidget {
  final Future<T> future;

  final Widget Function(T data) onData;

  final Widget Function(Object error)? onError;

  final Widget Function()? onLoading;

  final T? initialData;

  /// Виджет по умолчанию, если нет данных и нет ошибки (опционально)
  final Widget? fallback;

  const AppFutureBuilder({
    super.key,
    required this.future,
    required this.onData,
    this.onError,
    this.onLoading,
    this.initialData,
    this.fallback,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: future,
      initialData: initialData,
      builder: (context, snapshot) {
        return _buildWidget(snapshot);
      },
    );
  }

  Widget _buildWidget(AsyncSnapshot<T> snapshot) {
    // Используем switch expression для более читаемого кода
    return switch (snapshot.connectionState) {
      ConnectionState.done => _handleDoneState(snapshot),
      ConnectionState.waiting => onLoading?.call() ?? const AppLoaderWidget(),
      _ => fallback ?? const SizedBox.shrink(),
    };
  }

  Widget _handleDoneState(AsyncSnapshot<T> snapshot) {
    if (snapshot.hasError) {
      return onError?.call(snapshot.error!) ?? const SizedBox.shrink();
    }

    if (snapshot.hasData) {
      return onData(snapshot.data as T);
    }

    return fallback ?? const SizedBox.shrink();
  }
}
