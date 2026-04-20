import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:work_up/shared/app_features/data/models/app_version_model.dart';
import 'package:work_up/shared/app_features/data/repositories/app_features_repository.dart';

part 'app_features_state.dart';

class AppFeaturesCubit extends Cubit<AppFeaturesState> {
  AppFeaturesCubit(this._appFeaturesRepository) : super(AppFeaturesInitial());

  final AppFeaturesRepository _appFeaturesRepository;

  Future<void> getAppVersion() async {
    emit(GetAppVersionLoading());
    EasyLoading.show();
    final result = await _appFeaturesRepository.getAppVersion();
    result.fold(
      (failure) => emit(GetAppVersionError(error: failure.message)),
      (appVersion) => emit(GetAppVersionSuccess(appVersion: appVersion)),
    );
    EasyLoading.dismiss();
  }
}
