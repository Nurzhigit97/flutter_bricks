import 'package:{{package}}/features/{{featureName.snakeCase()}}/presentation/cubits/{{listName}}/{{featureName.snakeCase()}}_cubit.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class {{featureName.pascalCase()}}Controller {
  bool _initialized = false;

  void dispose() {}

  void loadIfNeeded(BuildContext context) {
    if (_initialized) return;
    context.read<{{featureName.pascalCase()}}Cubit>().load{{featureName.pascalCase()}}();
    _initialized = true;
  }
}
