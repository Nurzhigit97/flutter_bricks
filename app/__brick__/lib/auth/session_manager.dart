import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:{{packageName}}/core/services/storage/local_storage.dart';
import 'package:{{packageName}}/core/services/storage/secure_storage.dart';
import 'package:{{packageName}}/core/utils/config/app_env.dart';
import 'package:{{packageName}}/core/utils/constants/app_const/app_const.dart';
import 'package:{{packageName}}/features/auth/data/models/auth/login_response.dart';
import 'package:{{packageName}}/features/auth/data/models/auth/refresh_token_request.dart';

/// Хранение access/refresh токенов и обновление сессии через API.
class SessionManager {
  SessionManager({
    required LocalStorage localStorage,
    required SecureStorage secureStorage,
  }) : _localStorage = localStorage,
       _secureStorage = secureStorage {
    _refreshDio = Dio(
      BaseOptions(baseUrl: AppEnv.baseUrl, headers: _languageHeaders()),
    );
  }

  final LocalStorage _localStorage;
  final SecureStorage _secureStorage;

  late final Dio _refreshDio;

  /// Вызывается из [App] при истечении refresh token.
  void Function()? onSessionExpired;

  Future<bool>? _refreshInFlight;

  bool get hasAccessToken {
    final token = _localStorage.getString(AppConst.accessToken);
    return token != null && token.isNotEmpty;
  }

  Future<String?> getRefreshToken() =>
      _secureStorage.getValue(AppConst.refreshToken);

  Future<void> saveTokens({
    required String accessToken,
    String? refreshToken,
  }) async {
    await _localStorage.setString(AppConst.accessToken, accessToken);
    if (refreshToken != null && refreshToken.isNotEmpty) {
      await _secureStorage.setValue(AppConst.refreshToken, refreshToken);
    }
    _tokenRefreshLog(
      'tokens saved (access: ${_mask(accessToken)}, '
      'refresh: ${refreshToken != null ? _mask(refreshToken) : 'unchanged'})',
    );
  }

  Future<void> clearSession() async {
    await _localStorage.remove(AppConst.accessToken);
    await _secureStorage.deleteValue(AppConst.refreshToken);
  }

  /// Обновляет пару токенов. Возвращает `true`, если сессия восстановлена.
  Future<bool> tryRefresh() {
    final inFlight = _refreshInFlight;
    if (inFlight != null) {
      _tokenRefreshLog('refresh already in progress, waiting…');
      return inFlight;
    }

    _tokenRefreshLog('starting refresh…');
    final future = _performRefresh();
    _refreshInFlight = future;
    return future.whenComplete(() => _refreshInFlight = null);
  }

  Future<bool> _performRefresh() async {
    final refreshToken = await getRefreshToken();
    if (refreshToken == null || refreshToken.isEmpty) {
      _tokenRefreshLog('aborted: no refresh token in storage');
      return false;
    }

    _tokenRefreshLog('POST users/refresh (refresh: ${_mask(refreshToken)})');

    try {
      final response = await _refreshDio.post<Map<String, dynamic>>(
        'users/refresh',
        data: RefreshTokenRequest(refreshToken: refreshToken).toJson(),
        options: Options(extra: const {kSkipTokenRefresh: true}),
      );

      final data = response.data;
      if (data == null) {
        _tokenRefreshLog('failed: empty response body');
        return false;
      }

      final session = LoginResponse.fromJson(data);
      await saveTokens(
        accessToken: session.accessToken,
        refreshToken: session.refreshToken ?? refreshToken,
      );
      _tokenRefreshLog('success (${response.statusCode})');
      return true;
    } on DioException catch (e) {
      _tokenRefreshLog(
        'failed: HTTP ${e.response?.statusCode} '
        '${e.response?.data ?? e.message}',
      );
      return false;
    } catch (e) {
      _tokenRefreshLog('failed: $e');
      return false;
    }
  }

  Future<void> handleSessionExpired() async {
    _tokenRefreshLog('session expired → clearing tokens');
    await clearSession();
    onSessionExpired?.call();
  }

  static String _mask(String token) {
    if (token.length <= 12) return '***';
    return '${token.substring(0, 6)}…${token.substring(token.length - 4)}';
  }

  Map<String, String> _languageHeaders() {
    final language = _localStorage.getString(AppConst.language);
    if (language != null && language.isNotEmpty) {
      return {'Accept-Language': language};
    }
    return {};
  }
}

/// Помечает запрос, для которого не нужно вызывать refresh при 401.
const String kSkipTokenRefresh = 'skipTokenRefresh';

void _tokenRefreshLog(String message) {
  if (kDebugMode) {
    log(message, name: 'TokenRefresh');
  }
}
