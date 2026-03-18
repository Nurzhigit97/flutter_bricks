import 'package:equatable/equatable.dart';

/// Тип ошибки для Left в [Either].
class AppFailure extends Equatable {
  const AppFailure({required this.message, this.details, this.statusCode});

  final String message;
  final String? details;
  final int? statusCode;

  @override
  List<Object?> get props => [message, details, statusCode];
}
