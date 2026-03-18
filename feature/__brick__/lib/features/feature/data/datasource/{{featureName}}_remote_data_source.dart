import 'package:{{package}}/features/{{featureName.snakeCase()}}/data/models/{{featureName.snakeCase()}}/{{featureName.snakeCase()}}_model.dart';
import 'package:{{package}}/shared/core/api_client/easy_api_client.dart';
import 'package:dartz/dartz.dart';

class {{featureName.pascalCase()}}RemoteDataSource {
  {{featureName.pascalCase()}}RemoteDataSource(this._apiClient);

  final EasyApiClient _apiClient;

  Future<Either<String, List<{{featureName.pascalCase()}}Model>>> get{{featureName.pascalCase()}}() async {
    final result = await _apiClient.get<List<{{featureName.pascalCase()}}Model>>(
      '{{featureName.snakeCase()}}/',
      fromJson: (data) {
        final list = data as List<dynamic>? ?? [];
        return list
            .map(
              (e) => {{featureName.pascalCase()}}Model.fromJson(
                Map<String, dynamic>.from(e as Map),
              ),
            )
            .toList();
      },
    );
    return result.fold(
      onSuccess: (s) => right(s.data),
      onFailure: (f) => left(f.message),
    );
  }

}
