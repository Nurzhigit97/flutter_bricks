import 'package:{{packageName}}/core/utils/constants/app_const/app_const.dart';

/// Конфигурация окружения приложения.
/// Для сложных проектов: переключение по flavor / --dart-define (e.g. dev, stage, prod).
class AppEnv {
  AppEnv._();

  static const bool isProduction = bool.fromEnvironment(
    'dart.vm.product',
    defaultValue: false,
  );

  static String get baseUrl => AppConst.baseUrl;
  static String get domainUrl => AppConst.domainUrl;

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
