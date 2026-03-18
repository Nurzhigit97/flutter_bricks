import 'package:auto_route/auto_route.dart';
import 'package:{{package}}/features/{{featureName.snakeCase()}}/presentation/cubits/{{listName}}/{{featureName.snakeCase()}}_cubit.dart';
import 'package:{{package}}/shared/utils/injections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class {{featureName.pascalCase()}}Navigator extends StatelessWidget implements AutoRouteWrapper {
  const {{featureName.pascalCase()}}Navigator({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final cubit = sl<{{featureName.pascalCase()}}Cubit>();
        return cubit..load{{featureName.pascalCase()}}();
      },
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }
}
