import 'package:equatable/equatable.dart';

/// Тип ошибки для левой части [Either]. Используется по проекту как Left.
class AppFailure extends Equatable {
  const AppFailure({required this.message, this.details, this.statusCode});

  final String message;
  final String? details;
  final int? statusCode;

  /// Сообщение для пользователя (в UI, снэкбары).
  String get displayMessage => message;

  @override
  List<Object?> get props => [message, details, statusCode];

  @override
  String toString() =>
      'AppFailure(message: $message, statusCode: $statusCode, details: $details)';

  AppFailure copyWith({String? message, String? details, int? statusCode}) {
    return AppFailure(
      message: message ?? this.message,
      details: details ?? this.details,
      statusCode: statusCode ?? this.statusCode,
    );
  }
}
