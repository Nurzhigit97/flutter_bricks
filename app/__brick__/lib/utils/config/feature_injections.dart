import 'package:{{packageName}}/features/news/news_injection.dart';
import 'package:{{packageName}}/features/notification/notification_injection.dart';
import 'package:{{packageName}}/features/profile/profile_injection.dart';
import 'package:{{packageName}}/shared/app_features/app_features_injection.dart';
import 'package:{{packageName}}/features/auth/auth_injection.dart';
import 'package:{{packageName}}/features/withdrawal/withdrawal_injection.dart';
import 'package:{{packageName}}/features/home/home_injection.dart';
import 'package:{{packageName}}/features/finik_pay/finik_pay_injection.dart';

/// Список функций регистрации зависимостей фич.
/// Порядок вызова важен при наличии зависимостей между фичами.
final List<void Function()> featureInjections = [
  appFeaturesInjection,
  finikPayInjection,
  homeInjection,
  withdrawalInjection,
  profileInjection,
  authInjection,
  newsInjection,
  notificationInjection,
];
