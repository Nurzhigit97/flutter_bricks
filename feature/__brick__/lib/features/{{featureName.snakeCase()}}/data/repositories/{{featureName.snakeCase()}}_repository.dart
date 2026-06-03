import 'package:{{package}}/features/{{featureName.snakeCase()}}/data/models/{{featureName.snakeCase()}}/{{featureName.snakeCase()}}_model.dart';
import 'package:dartz/dartz.dart';

abstract class {{featureName.pascalCase()}}Repository {
  Future<Either<String, List<{{featureName.pascalCase()}}Model>>> get{{featureName.pascalCase()}}();
}
