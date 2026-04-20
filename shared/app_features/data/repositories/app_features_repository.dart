import 'package:work_up/shared/app_features/data/models/app_version_model.dart';
import 'package:work_up/core/api_client/app_failure.dart';
import 'package:dartz/dartz.dart';

abstract class AppFeaturesRepository {
  Future<Either<AppFailure, AppVersionModel>> getAppVersion();
}
