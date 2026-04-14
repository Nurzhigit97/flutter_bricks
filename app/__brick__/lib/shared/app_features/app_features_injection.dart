import 'package:{{packageName}}/shared/app_features/data/datasource/app_features_remote_datasource.dart';
import 'package:{{packageName}}/shared/app_features/data/repositories/app_features_impl_repository.dart';
import 'package:{{packageName}}/shared/app_features/data/repositories/app_features_repository.dart';
import 'package:{{packageName}}/shared/app_features/presentation/cubits/app_features/app_features_cubit.dart';
import 'package:{{packageName}}/shared/app_features/presentation/cubits/connectivity/connectivity_cubit.dart';
import 'package:{{packageName}}/shared/utils/injections.dart';
import 'package:{{packageName}}/shared/core/api_client/easy_api_client.dart';

Future<void> appFeaturesInjection() async {
  sl.registerLazySingleton<AppFeaturesRepository>(
    () => AppFeaturesImplRepository(
      AppFeaturesRemoteDatasource(sl<EasyApiClient>()),
    ),
  );
  sl.registerFactory(() => AppFeaturesCubit(sl()));
  sl.registerFactory(() => ConnectivityCubit());
}
