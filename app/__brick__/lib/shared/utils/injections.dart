import 'package:{{packageName}}/shared/core/api_client/easy_api_client.dart';
import 'package:{{packageName}}/shared/utils/config/app_env.dart';
import 'package:{{packageName}}/shared/utils/constants/app_const/app_const.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:{{packageName}}/shared/core/helper/helper.dart';
import 'package:{{packageName}}/shared/core/services/storage/local_storage.dart';
import 'package:{{packageName}}/shared/core/services/storage/local_storage_impl.dart';
import 'package:{{packageName}}/shared/core/services/storage/secure_storage.dart';
import 'package:{{packageName}}/shared/core/services/storage/secure_storage_impl.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:{{packageName}}/shared/app_features/presentation/cubits/app_tab/app_tab_cubit.dart';
import 'package:{{packageName}}/shared/utils/config/feature_injections.dart';
import 'package:{{packageName}}/shared/app_features/presentation/cubits/language_cubit/language_cubit.dart';
import 'package:{{packageName}}/shared/utils/log/app_logger.dart';
import 'package:{{packageName}}/shared/routes/guards/is_first_launch_guard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:{{packageName}}/shared/routes/app_routes.dart';
import 'package:{{packageName}}/shared/routes/guards/auth_guard.dart';

final sl = GetIt.instance;

/// Порядок инициализации: storage → dio → router → common → feature injections
Future<void> initInjections() async {
  Helper.flutterEasyloadingInit();
  await initializeDateFormatting('ru', null);
  await initSharedPrefsInjections();
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
  sl.registerSingleton<FlutterSecureStorage>(const FlutterSecureStorage());
  sl.registerSingleton<LocalStorage>(LocalStorageImpl(sl<SharedPreferences>()));
  sl.registerSingleton<SecureStorage>(
    SecureStorageImpl(localStorage: sl<LocalStorage>()),
  );
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
