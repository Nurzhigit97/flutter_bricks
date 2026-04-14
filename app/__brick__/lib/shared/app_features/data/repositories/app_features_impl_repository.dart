import 'package:{{packageName}}/shared/app_features/data/datasource/app_features_remote_datasource.dart';
import 'package:{{packageName}}/shared/app_features/data/models/app_version_model.dart';
import 'package:{{packageName}}/shared/app_features/data/repositories/app_features_repository.dart';
import 'package:{{packageName}}/core/api_client/app_failure.dart';
import 'package:dartz/dartz.dart';

class AppFeaturesImplRepository implements AppFeaturesRepository {
  AppFeaturesImplRepository(this._remoteDataSource);

  final AppFeaturesRemoteDatasource _remoteDataSource;

  @override
  Future<Either<AppFailure, AppVersionModel>> getAppVersion() async {
    final result = await _remoteDataSource.getAppVersion();
    return result.fold((err) => left(err), (model) {
      return right(model);
    });
  }
}
