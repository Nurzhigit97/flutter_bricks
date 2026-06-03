import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:{{packageName}}/core/auth/session_manager.dart';

void _tokenRefreshLog(String message) {
  if (kDebugMode) {
    log(message, name: 'TokenRefresh');
  }
}

/// При 401 пытается обновить access token через refresh и повторить запрос.
class TokenRefreshInterceptor extends Interceptor {
  TokenRefreshInterceptor({
    required SessionManager sessionManager,
    required Dio dio,
  })  : _sessionManager = sessionManager,
        _dio = dio;

  final SessionManager _sessionManager;
  final Dio _dio;

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (!_shouldHandle(err)) {
      return handler.next(err);
    }

    final path = err.requestOptions.path;
    _tokenRefreshLog('401 on $path → attempting refresh');

    final refreshToken = await _sessionManager.getRefreshToken();
    if (refreshToken == null || refreshToken.isEmpty) {
      _tokenRefreshLog('401 on $path → skipped (no refresh token)');
      return handler.next(err);
    }

    final refreshed = await _sessionManager.tryRefresh();
    if (!refreshed) {
      _tokenRefreshLog('401 on $path → refresh failed, logging out');
      await _sessionManager.handleSessionExpired();
      return handler.next(err);
    }

    _tokenRefreshLog('401 on $path → retrying original request');
    try {
      final response = await _retry(err.requestOptions);
      _tokenRefreshLog(
        '401 on $path → retry OK (${response.statusCode})',
      );
      return handler.resolve(response);
    } on DioException catch (retryError) {
      if (retryError.response?.statusCode == 401) {
        _tokenRefreshLog('401 on $path → retry still 401, logging out');
        await _sessionManager.handleSessionExpired();
      }
      return handler.next(retryError);
    } catch (retryError) {
      return handler.next(
        DioException(
          requestOptions: err.requestOptions,
          error: retryError,
        ),
      );
    }
  }

  bool _shouldHandle(DioException err) {
    if (err.response?.statusCode != 401) return false;
    if (err.requestOptions.extra[kSkipTokenRefresh] == true) return false;
    return _isProtectedRequest(err.requestOptions);
  }

  bool _isProtectedRequest(RequestOptions options) {
    final path = options.uri.path.toLowerCase();
    const publicPaths = [
      '/users/login',
      '/users/lookup',
      '/users/password',
      '/users/whatsapp/',
      '/users/refresh',
    ];
    for (final segment in publicPaths) {
      if (path.contains(segment)) return false;
    }
    return true;
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) {
    final headers = Map<String, dynamic>.from(requestOptions.headers);
    return _dio.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      cancelToken: requestOptions.cancelToken,
      options: Options(
        method: requestOptions.method,
        headers: headers,
        contentType: requestOptions.contentType,
        responseType: requestOptions.responseType,
        followRedirects: requestOptions.followRedirects,
        validateStatus: requestOptions.validateStatus,
        receiveTimeout: requestOptions.receiveTimeout,
        sendTimeout: requestOptions.sendTimeout,
        extra: requestOptions.extra,
      ),
    );
  }
}
