import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:{{packageName}}/features/payment_history/payment_history_injection.dart';
import 'package:{{packageName}}/firebase_options.dart';
import 'package:{{packageName}}/core/api_client/easy_api_client.dart';
import 'package:{{packageName}}/core/api_client/auth_interceptor.dart';
import 'package:{{packageName}}/core/api_client/logger_interceptor.dart';
import 'package:{{packageName}}/core/api_client/token_refresh_interceptor.dart';
import 'package:{{packageName}}/core/auth/session_manager.dart';
import 'package:{{packageName}}/core/services/fcm_service.dart';
import 'package:{{packageName}}/core/utils/config/app_env.dart';
import 'package:{{packageName}}/core/utils/constants/app_const/app_const.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:{{packageName}}/core/helper/helper.dart';
import 'package:{{packageName}}/core/services/storage/local_storage.dart';
import 'package:{{packageName}}/core/services/storage/local_storage_impl.dart';
import 'package:{{packageName}}/core/services/storage/secure_storage.dart';
import 'package:{{packageName}}/core/services/storage/secure_storage_impl.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:{{packageName}}/shared/app_features/presentation/cubits/app_tab/app_tab_cubit.dart';
import 'package:{{packageName}}/core/utils/config/feature_injections.dart';
import 'package:{{packageName}}/shared/app_features/presentation/cubits/language_cubit/language_cubit.dart';
import 'package:{{packageName}}/core/routes/guards/is_first_launch_guard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:{{packageName}}/core/routes/app_routes.dart';
import 'package:{{packageName}}/core/routes/guards/auth_guard.dart';

final sl = GetIt.instance;

/// Порядок инициализации: storage → dio → router → common → feature injections
Future<void> initInjections() async {
  Helper.flutterEasyloadingInit();
  await initializeDateFormatting('ru', null);
  await initSharedPrefsInjections();
  await initDioInjections();
  await initFirebaseInjections();
  await paymentHistoryInjection();

  // ROUTER (guards + router)
  sl.registerSingleton<AuthGuard>(const AuthGuard(shouldShowDialog: true));
  sl.registerSingleton<IsFirstLaunchGuard>(const IsFirstLaunchGuard());
  sl.registerLazySingleton<AppRouter>(() => AppRouter(sl(), sl()));

  // Common (global cubits)
  sl.registerFactory(() => LanguageCubit(sl()));
  sl.registerFactory(() => CustomTabCubit());

  // Feature injections (order matters if features depend on each other)
  for (final inject in featureInjections) {
    inject();
  }
}

Future<void> initSharedPrefsInjections() async {
  sl.registerSingletonAsync<SharedPreferences>(() async {
    return await SharedPreferences.getInstance();
  });
  await sl.isReady<SharedPreferences>();
  sl.registerSingleton<FlutterSecureStorage>(const FlutterSecureStorage());
  sl.registerSingleton<LocalStorage>(LocalStorageImpl(sl<SharedPreferences>()));
  sl.registerSingleton<SecureStorage>(
    SecureStorageImpl(localStorage: sl<LocalStorage>()),
  );
}

Future<void> initFirebaseInjections() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  // Настройка Firebase Cloud Messaging
  final fcmService = FCMService();
  await fcmService.initialize(
    prefsService: sl<LocalStorage>(),
    onTokenRefresh: (String token) async {
      // Отправляем токен на сервер при обновлении
      // Отложенная отправка, так как notificationInjection вызывается позже
      Future.delayed(const Duration(seconds: 2), () async {
        try {
          // TODO: Отправить токен на сервер при обновлении токена
        } catch (e) {
          log('Error sending FCM token to server: $e');
        }
      });
    },
    onMessageReceived: (RemoteMessage message) {
      // Обработка полученного сообщения
      // Можно обновить список уведомлений, показать диалог и т.д.
      log('FCM message received: ${message.notification?.title}');
      log('FCM message received: ${message.data}');
    },
    onNavigate: (RemoteMessage message) {
      // Навигация при клике на уведомление
      log('FCM navigate: ${message.data}');

      // Извлекаем данные из сообщения
      // Данные могут быть напрямую в message.data или обернуты в payload
      Map<String, dynamic>? notificationData;

      if (message.data.containsKey('payload')) {
        // Если данные обернуты в payload (для сообщений напрямую из FCM)
        final payload = message.data['payload'];
        if (payload is Map) {
          notificationData = Map<String, dynamic>.from(payload);
        }
      } else {
        // Данные напрямую в message.data (для локальных уведомлений, которые мы распарсили)
        notificationData = message.data;
      }

      // Проверяем click_action для определения типа навигации
      final clickAction = notificationData?['click_action'] as String?;
      final link = notificationData?['link'] as String?;

      log('FCM navigate click_action: $clickAction');
      log('FCM navigate link: $link');
    },
  );

  sl.registerSingleton<FCMService>(fcmService);
}

Future<void> initDioInjections() async {
  final localStorage = sl<LocalStorage>();
  final sessionManager = SessionManager(
    localStorage: localStorage,
    secureStorage: sl<SecureStorage>(),
  );
  sl.registerSingleton<SessionManager>(sessionManager);

  final dio = Dio(
    BaseOptions(
      baseUrl: AppEnv.baseUrl,
      headers: {
        if (localStorage.getString(AppConst.language) case final lang?
            when lang.isNotEmpty)
          'Accept-Language': lang,
      },
    ),
  );

  dio.interceptors.addAll([
    AuthInterceptor(localStorage),
    TokenRefreshInterceptor(sessionManager: sessionManager, dio: dio),
    LoggerInterceptor(),
  ]);

  sl.registerSingleton<Dio>(dio);
  sl.registerLazySingleton<EasyApiClient>(() => EasyApiClient(dio: sl<Dio>()));
}
