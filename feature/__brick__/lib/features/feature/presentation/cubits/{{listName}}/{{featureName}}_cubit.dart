import 'package:{{package}}/features/{{featureName.snakeCase()}}/data/repositories/{{featureName.snakeCase()}}_repository.dart';
import 'package:{{package}}/features/{{featureName.snakeCase()}}/presentation/cubits/{{listName}}/{{featureName.snakeCase()}}_state.dart';
import 'package:{{package}}/shared/utils/extensions/on_future_either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class {{featureName.pascalCase()}}Cubit extends Cubit<{{featureName.pascalCase()}}State> {
  final {{featureName.pascalCase()}}Repository _repository;
  {{featureName.pascalCase()}}Cubit(this._repository)
    : super(const {{featureName.pascalCase()}}State.loading());

  Future<void> load{{featureName.pascalCase()}}() async {
    emit(const {{featureName.pascalCase()}}State.loading());
    await _repository.get{{featureName.pascalCase()}}().foldVoid(
      (err) => emit({{featureName.pascalCase()}}State.error(error: err)),
      (items) => emit({{featureName.pascalCase()}}State.loaded(items)),
    );
  }
}
