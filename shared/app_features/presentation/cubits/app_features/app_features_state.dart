part of 'app_features_cubit.dart';

abstract class AppFeaturesState extends Equatable {
  const AppFeaturesState();

  @override
  List<Object?> get props => [];
}

class AppFeaturesInitial extends AppFeaturesState {}

class GetAppVersionLoading extends AppFeaturesState {}

class GetAppVersionSuccess extends AppFeaturesState {
  final AppVersionModel appVersion;
  const GetAppVersionSuccess({required this.appVersion});

  @override
  List<Object?> get props => [appVersion];
}

class GetAppVersionError extends AppFeaturesState {
  final String error;
  const GetAppVersionError({required this.error});

  @override
  List<Object?> get props => [error];
}
