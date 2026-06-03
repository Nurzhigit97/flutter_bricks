import 'dart:developer';
import 'package:dio/dio.dart';

class LoggerInterceptor extends Interceptor {
  static const _reset = '\x1B[0m';
  static const _green = '\x1B[32m';
  static const _red = '\x1B[31m';
  static const _cyan = '\x1B[36m';

  String _colorize(String message, String color) => '$color$message$_reset';

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log(
      _colorize('REQUEST[${options.method}] => PATH: ${options.path}', _cyan),
    );
    log(_colorize('REQUEST QUERY: ${options.queryParameters}', _cyan));
    log(_colorize('REQUEST DATA: ${options.data}', _cyan));
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log(
      _colorize(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
        _green,
      ),
    );
    log(_colorize('RESPONSE DATA: ${response.data}', _green));
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log(
      _colorize(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}',
        _red,
      ),
    );
    log(_colorize('ERROR DATA: ${err.response?.data}', _red));
    super.onError(err, handler);
  }
}
