import 'package:dio/dio.dart';
import 'package:{{packageName}}/core/api_client/app_failure.dart';

const _minAmountErrorMarker =
    'Amount, including the fees, must be greater or equal to 20.';
const _userNotExistsErrorMarker = 'User does not exist.';
const _driverNotFoundErrorMarker = 'Driver not found';
const _supplierNotAvailableErrorMarker = 'Supplier not available';
const _unexpectedErrorMarker = 'An unexpected error has occurred.';
const _insufficientFundsErrorMarker = 'Insufficient funds.';
const _duplicateTransactionErrorMarker =
    'Transaction with the same ID already exists.';
const _serviceTemporarilyUnavailableErrorMarker = 'is temporarily unavailable';
const _serviceProviderUnavailableErrorMarker =
    'Service provider is unavailable.';
const _invalidServiceIdErrorMarker = 'Invalid service ID is provided.';
const _transactionIdRequiredErrorMarker = 'Transaction ID is required.';
const _invalidAmountErrorMarker =
    'An invalid amount is provided. Amount must be greater than 0.';

const _serverErrorMessage = 'Проблемы на сервере. Попробуйте позже.';
const _gatewayErrorMessage = 'Сервер временно недоступен. Попробуйте позже.';
const _serviceUnavailableMessage =
    'Сервис перегружен или на техработах. Попробуйте позже.';
const _genericErrorMessage = 'Произошла ошибка. Попробуйте позже.';

AppFailure mapDioError(DioException e) {
  final code = e.response?.statusCode ?? 0;
  final rawBackendMessage = _extractBackendMessage(e.response?.data);
  final backendMessage = _sanitizeUserMessage(rawBackendMessage);
  final details = backendMessage ?? e.message ?? e.error?.toString();
  final normalizedBackendMessage = backendMessage?.toLowerCase().trim();

  if (normalizedBackendMessage != null &&
      normalizedBackendMessage.contains(_minAmountErrorMarker.toLowerCase())) {
    return AppFailure(
      message: 'Минимальная сумма с учетом комиссии: 20 сом.',
      details: details,
      statusCode: code,
    );
  }

  if (normalizedBackendMessage != null &&
      normalizedBackendMessage.contains(
        _userNotExistsErrorMarker.toLowerCase(),
      )) {
    return AppFailure(
      message: 'Пользователь не найден.',
      details: details,
      statusCode: code,
    );
  }

  if (normalizedBackendMessage != null &&
      normalizedBackendMessage.contains(
        _driverNotFoundErrorMarker.toLowerCase(),
      )) {
    return AppFailure(
      message: 'Водитель не найден.',
      details: details,
      statusCode: code,
    );
  }

  if (normalizedBackendMessage != null &&
      normalizedBackendMessage.contains(
        _supplierNotAvailableErrorMarker.toLowerCase(),
      )) {
    return AppFailure(
      message: 'Поставщик не доступен. Попробуйте позже.',
      details: details,
      statusCode: code,
    );
  }

  if (normalizedBackendMessage != null &&
      normalizedBackendMessage.contains(_unexpectedErrorMarker.toLowerCase())) {
    return AppFailure(
      message: 'Произошла непредвиденная ошибка.',
      details: details,
      statusCode: code,
    );
  }

  if (normalizedBackendMessage != null &&
      normalizedBackendMessage.contains(
        _insufficientFundsErrorMarker.toLowerCase(),
      )) {
    return AppFailure(
      message: 'Недостаточно средств для проведения платежа.',
      details: details,
      statusCode: code,
    );
  }

  if (normalizedBackendMessage != null &&
      normalizedBackendMessage.contains(
        _duplicateTransactionErrorMarker.toLowerCase(),
      )) {
    return AppFailure(
      message: 'Платеж с таким ID уже существует.',
      details: details,
      statusCode: code,
    );
  }

  if (normalizedBackendMessage != null &&
      (normalizedBackendMessage.contains(
            _serviceTemporarilyUnavailableErrorMarker.toLowerCase(),
          ) ||
          normalizedBackendMessage.contains(
            _serviceProviderUnavailableErrorMarker.toLowerCase(),
          ))) {
    return AppFailure(
      message: 'Сервис временно недоступен. Попробуйте позже.',
      details: details,
      statusCode: code,
    );
  }

  if (normalizedBackendMessage != null &&
      normalizedBackendMessage.contains(
        _invalidServiceIdErrorMarker.toLowerCase(),
      )) {
    return AppFailure(
      message: 'Указан некорректный сервис оплаты.',
      details: details,
      statusCode: code,
    );
  }

  if (normalizedBackendMessage != null &&
      normalizedBackendMessage.contains(
        _transactionIdRequiredErrorMarker.toLowerCase(),
      )) {
    return AppFailure(
      message: 'Не указан ID транзакции.',
      details: details,
      statusCode: code,
    );
  }

  if (normalizedBackendMessage != null &&
      normalizedBackendMessage.contains(
        _invalidAmountErrorMarker.toLowerCase(),
      )) {
    return AppFailure(
      message: 'Некорректная сумма платежа.',
      details: details,
      statusCode: code,
    );
  }

  switch (e.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
      return AppFailure(
        message: "Время ожидания истекло. Проверьте интернет.",
        details: details,
        statusCode: code,
      );

    case DioExceptionType.connectionError:
      return AppFailure(
        message: "Не удалось подключиться к серверу. Проверьте интернет.",
        details: details,
        statusCode: code,
      );

    case DioExceptionType.badResponse:
      if (code == 502 || code == 504) {
        return AppFailure(
          message: _gatewayErrorMessage,
          details: details,
          statusCode: code,
        );
      }
      if (code == 503) {
        return AppFailure(
          message: _serviceUnavailableMessage,
          details: details,
          statusCode: code,
        );
      }
      if (code >= 500) {
        return AppFailure(
          message: _serverErrorMessage,
          details: details,
          statusCode: code,
        );
      } else if (code == 409) {
        return AppFailure(
          message: backendMessage ?? 'Платеж с таким ID уже существует.',
          details: details,
          statusCode: code,
        );
      } else if (code == 402) {
        return AppFailure(
          message:
              backendMessage ?? 'Недостаточно средств для проведения платежа.',
          details: details,
          statusCode: code,
        );
      } else if (code == 404) {
        return AppFailure(
          message: backendMessage ?? 'Ресурс не найден.',
          details: details,
          statusCode: code,
        );
      } else if (code == 401) {
        return AppFailure(
          message: 'Нет доступа. Авторизуйтесь заново.',
          details: details,
          statusCode: code,
        );
      } else if (code == 403) {
        return AppFailure(
          message: 'У вас нет доступа к этой странице.',
          details: details,
          statusCode: code,
        );
      } else {
        return AppFailure(
          message: backendMessage ?? _genericErrorMessage,
          details: details,
          statusCode: code,
        );
      }

    default:
      return AppFailure(
        message: "Произошла непредвиденная ошибка. Попробуйте позже.",
        details: details,
        statusCode: code,
      );
  }
}

/// Возвращает `null`, если текст нельзя показывать пользователю (HTML, nginx и т.д.).
String? _sanitizeUserMessage(String? message) {
  if (message == null) return null;
  final trimmed = message.trim();
  if (trimmed.isEmpty) return null;

  final lower = trimmed.toLowerCase();
  if (lower.startsWith('<!doctype') ||
      lower.startsWith('<html') ||
      lower.contains('<head>') ||
      lower.contains('<body>')) {
    return null;
  }
  if (lower.contains('bad gateway') ||
      lower.contains('nginx') ||
      lower.contains('dioexception')) {
    return null;
  }
  if (trimmed.length > 280) {
    return null;
  }

  return trimmed;
}

String? _extractBackendMessage(dynamic data) {
  if (data is Map) {
    final detail = data['detail'];
    if (detail is String && detail.trim().isNotEmpty) {
      return _sanitizeUserMessage(detail);
    }
    if (detail is Map) {
      final message = detail['message'];
      if (message is String && message.trim().isNotEmpty) {
        return message;
      }
    }

    final errorMessage = data['errorMessage'];
    if (errorMessage is String && errorMessage.trim().isNotEmpty) {
      return errorMessage;
    }

    final message = data['message'];
    if (message is String && message.trim().isNotEmpty) {
      return message;
    }
  }

  if (data is String && data.trim().isNotEmpty) {
    return _sanitizeUserMessage(data);
  }

  return null;
}
