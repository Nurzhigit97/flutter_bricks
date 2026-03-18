import 'dart:developer';
import 'dart:io';

import 'package:{{packageName}}/shared/core/api_client/app_failure.dart';
import 'package:{{packageName}}/shared/core/api_client/map_dio_errror.dart';
import 'package:{{packageName}}/shared/core/api_client/result.dart';
import 'package:{{packageName}}/shared/core/api_client/success_data.dart';
import 'package:dio/dio.dart';

class EasyApiClient {
  final Dio dio;

  EasyApiClient({required this.dio});

  T _coerceResponse<T>(dynamic data) {
    if (data == null) {
      return null as T;
    }

    // Primitive coercions for inconsistent backend payloads.
    if (T == bool) {
      if (data is bool) return data as T;
      if (data is num) return (data != 0) as T;
      if (data is String) {
        final normalized = data.trim().toLowerCase();
        if (normalized == 'true' || normalized == '1' || normalized == 'yes') {
          return true as T;
        }
        if (normalized == 'false' || normalized == '0' || normalized == 'no') {
          return false as T;
        }
      }
      throw FormatException(
        'Cannot coerce value "$data" (${data.runtimeType}) to bool',
      );
    }

    if (T == int) {
      if (data is int) return data as T;
      if (data is num) return data.toInt() as T;
      if (data is String) {
        final parsed = int.tryParse(data.trim());
        if (parsed != null) return parsed as T;
      }
      throw FormatException(
        'Cannot coerce value "$data" (${data.runtimeType}) to int',
      );
    }

    if (T == double) {
      if (data is double) return data as T;
      if (data is num) return data.toDouble() as T;
      if (data is String) {
        final parsed = double.tryParse(data.trim());
        if (parsed != null) return parsed as T;
      }
      throw FormatException(
        'Cannot coerce value "$data" (${data.runtimeType}) to double',
      );
    }

    if (T == String) {
      return data.toString() as T;
    }

    return data as T;
  }

  /// Универсальный метод запроса
  Future<Result<T>> request<T>(
    String path, {
    String method = 'GET',
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    FormData? formData,
    T Function(dynamic data)? fromJson,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await dio.request(
        path,
        data: formData ?? data,
        queryParameters: queryParameters,
        options: Options(method: method),
        cancelToken: cancelToken,
      );

      _checkStatus(response);

      final result = fromJson != null
          ? fromJson(response.data)
          : _coerceResponse<T>(response.data);
      return Result.success(SuccessData(data: result));
    } on DioException catch (e) {
      // отвечает за ошибки Dio Exception (timeout, connection error, bad response, etc. ) и преобразует их в AppFailure
      log("$method $path DioException: ${e.message}");
      return Result.failure(mapDioError(e));
    } on SocketException catch (e) {
      log("$method $path SocketException: ${e.message}");
      return Result.failure(
        AppFailure(
          message: "Нет подключения к интернету.",
          details: e.toString(),
        ),
      );
    } catch (e) {
      log("$method $path Unexpected error: $e");
      return Result.failure(
        AppFailure(
          message: "Что-то пошло не так. Попробуйте позже.",
          details: e.toString(),
        ),
      );
    }
  }

  void _checkStatus(Response response) {
    final code = response.statusCode ?? 0;
    if (code < 200 || code >= 300) {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        type: DioExceptionType.badResponse,
        error: 'Request failed with status: $code',
      );
    }
  }

  // Удобные методы
  Future<Result<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    T Function(dynamic data)? fromJson,
    CancelToken? cancelToken,
  }) => request(
    path,
    method: 'GET',
    queryParameters: queryParameters,
    fromJson: fromJson,
    cancelToken: cancelToken,
  );

  /// Получает пагинированный ответ API
  /// Безопасно парсит структуру {results: [...], next: "...", count: ...}
  Future<Result<List<T>>> getPaginated<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    required T Function(Map<String, dynamic>) fromJson,
    CancelToken? cancelToken,
  }) async {
    final result = await request<Map<String, dynamic>>(
      path,
      method: 'GET',
      queryParameters: queryParameters,
      fromJson: (data) {
        if (data is! Map<String, dynamic>) {
          throw FormatException(
            'Ожидался объект для пагинированного ответа, получен: ${data.runtimeType}',
          );
        }
        return data;
      },
      cancelToken: cancelToken,
    );

    if (!result.isSuccess) {
      return Result.failure(
        AppFailure(
          message: 'Ошибка при парсинге данных',
          details: result.data?.toString(),
        ),
      );
    }

    final data = result.data?.data;
    final results = data?['results'];

    if (results is! List) {
      return Result.failure(
        AppFailure(
          message: 'Неверный формат ответа сервера',
          details:
              'Поле "results" должно быть списком, получен: ${results.runtimeType}',
        ),
      );
    }

    try {
      final items = results
          .whereType<Map<String, dynamic>>()
          .map((json) => fromJson(json))
          .toList();

      // Безопасное извлечение next и count
      final nextUrl = data?['next'];
      final count = data?['count'];

      return Result.success(
        SuccessData(data: items, nextUrl: nextUrl, count: count),
      );
    } catch (e) {
      return Result.failure(
        AppFailure(
          message: 'Ошибка при парсинге данных',
          details: e.toString(),
        ),
      );
    }
  }

  Future<Result<T>> post<T>(
    String path, {
    Map<String, dynamic>? data,
    FormData? formData,
    T Function(dynamic data)? fromJson,
  }) => request(
    path,
    method: 'POST',
    data: data,
    formData: formData,
    fromJson: fromJson,
  );

  Future<Result<T>> put<T>(
    String path, {
    Map<String, dynamic>? data,
    FormData? formData,
    T Function(dynamic data)? fromJson,
  }) => request(
    path,
    method: 'PUT',
    data: data,
    formData: formData,
    fromJson: fromJson,
  );

  Future<Result<T>> patch<T>(
    String path, {
    Map<String, dynamic>? data,
    FormData? formData,
    T Function(dynamic data)? fromJson,
  }) => request(
    path,
    method: 'PATCH',
    data: data,
    formData: formData,
    fromJson: fromJson,
  );

  Future<Result<T>> delete<T>(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    T Function(dynamic data)? fromJson,
  }) => request(
    path,
    method: 'DELETE',
    data: data,
    queryParameters: queryParameters,
    fromJson: fromJson,
  );
}
