import 'package:{{package}}/features/{{featureName.snakeCase()}}/data/models/{{featureName.snakeCase()}}/{{featureName.snakeCase()}}_model.dart';
import 'package:flutter/material.dart';

class {{featureName.pascalCase()}}Widget extends StatelessWidget {
  final {{featureName.pascalCase()}}Model {{featureName.camelCase()}};

  const {{featureName.pascalCase()}}Widget({super.key, required this.{{featureName.camelCase()}}});

  @override
  Widget build(BuildContext context) {
    return SizedBox(child: Text({{featureName.camelCase()}}.id.toString()));
  }
}
