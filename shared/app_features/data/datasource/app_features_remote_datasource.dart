import 'dart:io';

import 'package:work_up/shared/app_features/data/models/app_version_model.dart';
import 'package:work_up/core/api_client/app_failure.dart';
import 'package:work_up/core/api_client/easy_api_client.dart';
import 'package:dartz/dartz.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppFeaturesRemoteDatasource {
  AppFeaturesRemoteDatasource(this._apiClient);

  final EasyApiClient _apiClient;

  Future<Either<AppFailure, AppVersionModel>> getAppVersion() async {
    final platform = Platform.isAndroid ? 'android' : 'ios';
    final packageInfo = await PackageInfo.fromPlatform();
    final currentVersion = packageInfo.version;
    final response = await _apiClient.get<AppVersionModel>(
      'common/check-version/',
      queryParameters: {'platform': platform, 'version': currentVersion},
    );
    return response.fold(
      onSuccess: (data) => right(data.data),
      onFailure: (failure) => left(failure),
    );
  }
}
