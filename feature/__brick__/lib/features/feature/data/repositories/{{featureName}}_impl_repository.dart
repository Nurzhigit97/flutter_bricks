import 'package:{{package}}/features/{{featureName.snakeCase()}}/data/datasource/{{featureName.snakeCase()}}_remote_data_source.dart';
import 'package:{{package}}/features/{{featureName.snakeCase()}}/data/models/{{featureName.snakeCase()}}/{{featureName.snakeCase()}}_model.dart';
import 'package:{{package}}/features/{{featureName.snakeCase()}}/data/repositories/{{featureName.snakeCase()}}_repository.dart';
import 'package:dartz/dartz.dart';

class {{featureName.pascalCase()}}ImplRepository implements {{featureName.pascalCase()}}Repository {
  {{featureName.pascalCase()}}ImplRepository(this._remoteDataSource);

  final {{featureName.pascalCase()}}RemoteDataSource _remoteDataSource;

  @override
  Future<Either<String, List<{{featureName.pascalCase()}}Model>>> get{{featureName.pascalCase()}}() async {
    final result = await _remoteDataSource.get{{featureName.pascalCase()}}();
    return result.fold(
      (err) => left(err),
      (list) {
        // При необходимости добавить логику: маппинг, фильтрация, кэш и т.д.
        return right(list);
      },
    );
  }
}
