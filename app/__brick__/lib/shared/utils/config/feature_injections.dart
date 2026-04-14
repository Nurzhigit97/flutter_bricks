import 'package:{{packageName}}/shared/app_features/app_features_injection.dart';

/// Список функций регистрации зависимостей фич.
/// Порядок вызова важен при наличии зависимостей между фичами.
final List<Future<void> Function()> featureInjections = [
  appFeaturesInjection,
  // authInjection,
  // homeInjection,
  // profileInjection,
];
