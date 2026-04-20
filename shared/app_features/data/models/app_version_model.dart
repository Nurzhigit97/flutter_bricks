import 'package:equatable/equatable.dart';

class AppVersionModel extends Equatable {
  final String platform;
  final String currentVersion;
  final String minVersion;
  final bool outdated;
  final bool mustUpdate;

  const AppVersionModel({
    required this.platform,
    required this.currentVersion,
    required this.minVersion,
    required this.outdated,
    required this.mustUpdate,
  });

  factory AppVersionModel.fromJson(Map<String, dynamic> json) {
    return AppVersionModel(
      platform: json['platform'],
      currentVersion: json['current_version'],
      minVersion: json['min_version'],
      outdated: json['outdated'],
      mustUpdate: json['must_update'],
    );
  }

  @override
  List<Object?> get props => [
    platform,
    currentVersion,
    minVersion,
    outdated,
    mustUpdate,
  ];
}
