import 'package:freezed_annotation/freezed_annotation.dart';

part '{{featureName.snakeCase()}}_model.freezed.dart';
part '{{featureName.snakeCase()}}_model.g.dart';

@freezed
abstract class {{featureName.pascalCase()}}Model with void _${{featureName.pascalCase()}}void Model {
  const factory {{featureName.pascalCase()}}Model({
    required int id,
  }) = _{{featureName.pascalCase()}}Model;

  factory {{featureName.pascalCase()}}Model.fromJson(Map<String, dynamic> json) =>
      _${{featureName.pascalCase()}}ModelFromJson(json);
}
