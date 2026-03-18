import 'package:{{packageName}}/shared/core/api_client/app_failure.dart';
import 'package:{{packageName}}/shared/core/api_client/success_data.dart';

/// Тип результата операций (альтернатива [Either]).
/// В проекте для ошибок используется [AppFailure]; с [Either] — Left([AppFailure]).
class Result<T> {
  final SuccessData<T>? _data;
  final AppFailure? _failure;

  const Result._(this._data, this._failure);

  factory Result.success(SuccessData<T> data) {
    return Result._(data, null);
  }

  factory Result.failure(AppFailure failure) {
    return Result._(null, failure);
  }

  bool get isSuccess => _data != null;
  bool get isFailure => _failure != null;

  /// Типизированный fold — ключевое улучшение
  R fold<R>({
    required R Function(SuccessData<T> data) onSuccess,
    required R Function(AppFailure failure) onFailure,
  }) {
    if (_data != null) {
      return onSuccess(_data);
    } else {
      return onFailure(_failure!);
    }
  }

  /// Удобный доступ (опционально)
  SuccessData<T>? get data => _data;
  AppFailure? get failure => _failure;
}
