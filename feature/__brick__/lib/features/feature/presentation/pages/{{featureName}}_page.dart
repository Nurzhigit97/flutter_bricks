import 'package:auto_route/auto_route.dart';
import 'package:{{package}}/features/{{featureName.snakeCase()}}/presentation/cubits/{{listName}}/{{featureName.snakeCase()}}_cubit.dart';
import 'package:{{package}}/features/{{featureName.snakeCase()}}/presentation/cubits/{{listName}}/{{featureName.snakeCase()}}_state.dart';
import 'package:{{package}}/features/{{featureName.snakeCase()}}/presentation/widgets/{{featureName.snakeCase()}}_widget.dart';
import 'package:{{package}}/shared/widgets/app_empty_widget.dart';
import 'package:{{package}}/shared/widgets/app_error_widget.dart';
import 'package:{{package}}/shared/widgets/app_loader_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class {{featureName.pascalCase()}}Page extends void StatelessWidget {
  const {{featureName.pascalCase()}}Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('{{featureName.pascalCase()}}')),
      body: BlocBuilder<{{featureName.pascalCase()}}Cubit, {{featureName.pascalCase()}}State>(
        builder: (context, state) {
          return state.when(
            loading: () => const AppLoaderWidget(),
            error: (error) => AppErrorWidget(error: error),
            loaded: (data) {
              if (data.isEmpty) return AppEmptyWidget();
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final item = data[index];
                  return {{featureName.pascalCase()}}Widget({{featureName.camelCase()}}: item);
                },
              );
            },
          );
        },
      ),
    );
  }
}
