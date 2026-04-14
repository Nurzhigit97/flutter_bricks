import 'package:dio/dio.dart';
import 'package:{{packageName}}/core/api_client/app_failure.dart';

AppFailure mapDioError(DioException e) {
  final code = e.response?.statusCode ?? 0;

  switch (e.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
      return AppFailure(
        message: "Время ожидания истекло. Проверьте интернет.",
        details: e.message,
        statusCode: code,
      );

    case DioExceptionType.connectionError:
      return AppFailure(
        message: "Не удалось подключиться к серверу. Проверьте интернет.",
        details: e.message,
        statusCode: code,
      );

    case DioExceptionType.badResponse:
      if (code >= 500) {
        return AppFailure(
          message: "Проблемы на сервере. Попробуйте позже.",
          details: e.message,
          statusCode: code,
        );
      } else if (code == 404) {
        const message = "Ресурс не найден.";
        return AppFailure(
          message: message,
          details: e.message,
          statusCode: code,
        );
      } else if (code == 401) {
        return AppFailure(
          message: "Нет доступа. Авторизуйтесь заново.",
          details: e.message,
          statusCode: code,
        );
      } else if (code == 403) {
        return AppFailure(
          message: "У вас нет доступа к этой странице.",
          details: e.message,
          statusCode: code,
        );
      } else {
        return AppFailure(
          message: "Ошибка запроса ($code). Попробуйте снова.",
          details: e.message,
          statusCode: code,
        );
      }

    default:
      return AppFailure(
        message: "Произошла непредвиденная ошибка. Попробуйте позже.",
        details: e.message,
        statusCode: code,
      );
  }
}
