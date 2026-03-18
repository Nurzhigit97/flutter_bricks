import 'package:{{packageName}}/shared/core/api_client/easy_api_client.dart';
import 'package:{{packageName}}/shared/utils/config/app_env.dart';
import 'package:{{packageName}}/shared/utils/constants/app_const/app_const.dart';
import 'package:dio/dio.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:{{packageName}}/shared/core/helper/helper.dart';
import 'package:{{packageName}}/shared/core/services/storage/local_storage.dart';
import 'package:{{packageName}}/shared/core/services/storage/local_storage_impl.dart';
import 'package:{{packageName}}/shared/core/services/storage/secure_storage.dart';
import 'package:{{packageName}}/shared/core/services/storage/secure_storage_impl.dart';
import 'package:{{packageName}}/shared/core/services/fcm_service.dart';
import 'package:{{packageName}}/shared/core/services/firebase_crashlytics_service.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:{{packageName}}/shared/app_features/presentation/cubits/app_tab/app_tab_cubit.dart';
import 'package:{{packageName}}/shared/utils/config/feature_injections.dart';
import 'package:{{packageName}}/shared/app_features/presentation/cubits/language_cubit/language_cubit.dart';
import 'dart:developer';
import 'package:{{packageName}}/shared/utils/log/app_logger.dart';
import 'package:{{packageName}}/shared/routes/guards/is_first_launch_guard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:{{packageName}}/shared/routes/app_routes.dart';
import 'package:{{packageName}}/shared/routes/guards/auth_guard.dart';

final sl = GetIt.instance;

/// Порядок инициализации: storage → firebase → dio → router → common → feature injections
Future<void> initInjections() async {
  Helper.flutterEasyloadingInit();
  await initializeDateFormatting('ru', null);
  await initSharedPrefsInjections();
  await initFirebaseInjections();
  await initDioInjections();

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
  // Register FlutterSecureStorage as it's used directly by AuthLocalDataSource and DioNetwork
  sl.registerSingleton<FlutterSecureStorage>(const FlutterSecureStorage());
  // Register LocalStorage first as SecureStorage depends on it
  sl.registerSingleton<LocalStorage>(LocalStorageImpl(sl<SharedPreferences>()));
  // Register SecureStorage interface with SecureStorageImpl implementation
  sl.registerSingleton<SecureStorage>(
    SecureStorageImpl(localStorage: sl<LocalStorage>()),
  );
}

Future<void> initFirebaseInjections() async {
  // TODO: Implement firebase initialization
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Настройка Firebase Analytics
  final analytics = FirebaseAnalytics.instance;

  // Включаем автоматический сбор данных о просмотрах экранов
  await analytics.setAnalyticsCollectionEnabled(true);

  // Включаем автоматический сбор данных о событиях
  await analytics.setSessionTimeoutDuration(const Duration(minutes: 30));

  // Настройка Firebase Crashlytics
  await CrashlyticsService.instance.initialize();

  // Настройка Firebase Cloud Messaging
  final fcmService = FCMService();
  await fcmService.initialize(
    prefsService: sl<LocalStorage>(),
    onTokenRefresh: (String token) async {
      // TODO: Implement update fcm token on server
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
      // TODO: Implement navigate to the screen
    },
  );

  sl.registerSingleton<FirebaseAnalytics>(analytics);
  sl.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
  sl.registerSingleton<FirebaseCrashlytics>(FirebaseCrashlytics.instance);
  sl.registerSingleton<CrashlyticsService>(CrashlyticsService.instance);
  sl.registerSingleton<FCMService>(FCMService());
}

Future<void> initDioInjections() async {
  initRootLogger();
  sl.registerSingleton<Dio>(
    Dio(
      BaseOptions(
        baseUrl: AppEnv.baseUrl,
        headers: {
          'Accept-Language': sl<LocalStorage>().getString(AppConst.language),
          'Authorization':
              'Bearer ${sl<LocalStorage>().getString(AppConst.accessToken)}',
        },
      ),
    ),
  );
  sl.registerLazySingleton<EasyApiClient>(() => EasyApiClient(dio: sl<Dio>()));
}
