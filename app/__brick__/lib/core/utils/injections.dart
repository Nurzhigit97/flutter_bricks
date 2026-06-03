import 'package:{{packageName}}/core/api_client/auth_interceptor.dart';
import 'package:{{packageName}}/core/api_client/easy_api_client.dart';
import 'package:{{packageName}}/core/api_client/logger_interceptor.dart';
import 'package:{{packageName}}/core/api_client/token_refresh_interceptor.dart';
import 'package:{{packageName}}/core/auth/session_manager.dart';
import 'package:{{packageName}}/core/helper/helper.dart';
import 'package:{{packageName}}/core/routes/app_routes.dart';
import 'package:{{packageName}}/core/routes/guards/auth_guard.dart';
import 'package:{{packageName}}/core/routes/guards/is_first_launch_guard.dart';
import 'package:{{packageName}}/core/services/storage/local_storage.dart';
import 'package:{{packageName}}/core/services/storage/local_storage_impl.dart';
import 'package:{{packageName}}/core/services/storage/secure_storage.dart';
import 'package:{{packageName}}/core/services/storage/secure_storage_impl.dart';
import 'package:{{packageName}}/core/utils/config/app_env.dart';
import 'package:{{packageName}}/core/utils/config/feature_injections.dart';
import 'package:{{packageName}}/core/utils/constants/app_const/app_const.dart';
import 'package:{{packageName}}/core/utils/log/app_logger.dart';
import 'package:{{packageName}}/shared/app_features/presentation/cubits/app_tab/app_tab_cubit.dart';
import 'package:{{packageName}}/shared/app_features/presentation/cubits/language_cubit/language_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

/// Порядок инициализации: storage → dio → router → common → feature injections
Future<void> initInjections() async {
  Helper.flutterEasyloadingInit();
  await initializeDateFormatting('ru', null);
  await initSharedPrefsInjections();
  await initDioInjections();
  // await initFirebaseInjections(); // после настройки Firebase

  sl.registerSingleton<AuthGuard>(const AuthGuard(shouldShowDialog: true));
  sl.registerSingleton<IsFirstLaunchGuard>(const IsFirstLaunchGuard());
  sl.registerLazySingleton<AppRouter>(() => AppRouter(sl(), sl()));

  sl.registerFactory(() => LanguageCubit(sl()));
  sl.registerFactory(() => CustomTabCubit());

  for (final inject in featureInjections) {
    await inject();
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

Future<void> initDioInjections() async {
  initRootLogger();
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
