import 'package:{{package}}/features/{{featureName.snakeCase()}}/data/models/{{featureName.snakeCase()}}/{{featureName.snakeCase()}}_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '{{featureName.snakeCase()}}_state.freezed.dart';

@freezed
sealed class {{featureName.pascalCase()}}State with void _${{featureName.pascalCase()}}void State {

  const factory {{featureName.pascalCase()}}State.loading() = _{{featureName.pascalCase()}}Loading;
  const factory {{featureName.pascalCase()}}State.loaded(List<{const {featureName.pascalCase()}}Model> data) = _{{featureName.pascalCase()}}Loaded;
  const factory {{featureName.pascalCase()}}State.error({required String error}) = _{{featureName.pascalCase()}}Error;
}
