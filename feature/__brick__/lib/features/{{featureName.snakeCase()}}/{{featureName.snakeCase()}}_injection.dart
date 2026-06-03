import 'package:{{package}}/features/{{featureName.snakeCase()}}/data/datasource/{{featureName.snakeCase()}}_remote_data_source.dart';
import 'package:{{package}}/features/{{featureName.snakeCase()}}/data/repositories/{{featureName.snakeCase()}}_impl_repository.dart';
import 'package:{{package}}/features/{{featureName.snakeCase()}}/data/repositories/{{featureName.snakeCase()}}_repository.dart';
import 'package:{{package}}/features/{{featureName.snakeCase()}}/presentation/cubits/{{listName}}/{{featureName.snakeCase()}}_cubit.dart';
import 'package:{{package}}/core/api_client/easy_api_client.dart';
import 'package:{{package}}/core/utils/injections.dart';

Future<void> {{featureName.camelCase()}}Injection() async {
  sl.registerLazySingleton<{{featureName.pascalCase()}}Repository>(
    () => {{featureName.pascalCase()}}ImplRepository(
      {{featureName.pascalCase()}}RemoteDataSource(sl<EasyApiClient>()),
    ),
  );
  sl.registerFactory(() => {{featureName.pascalCase()}}Cubit(sl<{{featureName.pascalCase()}}Repository>()));
}
