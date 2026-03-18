/// Тип результата операций. Для ошибок используется [AppFailure].
class Result<T> {
  final T? _data;
  final Object? _failure;

  const Result._(this._data, this._failure);

  factory Result.success(T data) => Result._(data, null);
  factory Result.failure(Object failure) => Result._(null, failure);

  bool get isSuccess => _data != null;
  bool get isFailure => _failure != null;

  R fold<R>({
    required R Function(T data) onSuccess,
    required R Function(Object failure) onFailure,
  }) {
    if (_data != null) {
      return onSuccess(_data as T);
    }
    return onFailure(_failure!);
  }
}
