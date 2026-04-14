import 'package:{{packageName}}/core/utils/constants/app_const/app_const.dart';

/// Конфигурация окружения приложения.
/// Для сложных проектов: переключение по flavor / --dart-define (e.g. dev, stage, prod).
class AppEnv {
  AppEnv._();

  static const bool isProduction = bool.fromEnvironment(
    'dart.vm.product',
    defaultValue: false,
  );

  /// Never hardcode sensitive values in source code.
  /// Pass runtime config via:
  /// flutter run --dart-define=BASE_URL=... --dart-define=DOMAIN_URL=...
  static const String _baseUrlFromDefine = String.fromEnvironment(
    'BASE_URL',
    defaultValue: '',
  );
  static const String _domainUrlFromDefine = String.fromEnvironment(
    'DOMAIN_URL',
    defaultValue: '',
  );

  static String get baseUrl =>
      _baseUrlFromDefine.isNotEmpty ? _baseUrlFromDefine : AppConst.baseUrl;
  static String get domainUrl => _domainUrlFromDefine.isNotEmpty
      ? _domainUrlFromDefine
      : AppConst.domainUrl;

  // Пример для нескольких окружений (раскомментировать при использовании):
  // static const String _env = String.fromEnvironment('APP_ENV', defaultValue: 'prod');
  // static String get baseUrl {
  //   switch (_env) {
  //     case 'dev': return 'https://dev.api.example.com/';
  //     case 'stage': return 'https://stage.api.example.com/';
  //     default: return AppConst.baseUrl;
  //   }
  // }
}
