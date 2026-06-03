import 'package:dio/dio.dart';
import 'package:{{packageName}}/core/services/storage/local_storage.dart';
import 'package:{{packageName}}/core/utils/constants/app_const/app_const.dart';

/// Подставляет актуальный `Authorization` и язык на каждый запрос.
///
/// Токен в [BaseOptions.headers] при старте приложения часто пустой и не
/// обновляется после логина — из‑за этого приходит 401 на MainPage.
class AuthInterceptor extends Interceptor {
  AuthInterceptor(this._localStorage);

  final LocalStorage _localStorage;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final language = _localStorage.getString(AppConst.language);
    if (language != null && language.isNotEmpty) {
      options.headers['Accept-Language'] = language;
    }

    final token = _localStorage.getString(AppConst.accessToken);
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    } else {
      options.headers.remove('Authorization');
    }

    handler.next(options);
  }
}
