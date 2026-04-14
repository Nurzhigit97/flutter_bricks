import 'dart:io';

import 'package:mason/mason.dart';
import 'package:yaml/yaml.dart';

/// Зависимости, необходимые сгенерированному коду фичи.
/// Добавляются в проект при генерации, если их ещё нет (без копипаста в новом проекте).
const _requiredDependencies = <String, String>{
  'flutter': 'sdk: flutter',
  'flutter_bloc': '^9.1.1',
  'bloc': '^9.1.0',
  'freezed_annotation': '^3.1.0',
  'json_annotation': '^4.11.0',
  'auto_route': '^11.1.0',
  'dartz': '^0.10.1',
  'dio': '^5.4.0',
  'get_it': '^9.2.1',
};

const _requiredDevDependencies = <String, String>{
  'build_runner': '^2.4.0',
  'auto_route_generator': '^10.5.0',
  'freezed': '^3.2.5',
  'json_serializable': '^6.13.1',
};

Future<void> run(HookContext context) async {
  await _ensureDependencies(context);
  await _renameFeatureDir(context);
  await _registerFeatureInjection(context);
}

Future<void> _ensureDependencies(HookContext context) async {
  final file = File('pubspec.yaml');
  if (!file.existsSync()) {
    return;
  }
  final content = file.readAsStringSync();
  final doc = loadYamlNode(content);
  if (doc is! YamlMap) {
    return;
  }
  final deps = doc['dependencies'] as YamlMap?;
  final devDeps = doc['dev_dependencies'] as YamlMap?;
  final existingDeps = _keys(deps);
  final existingDevDeps = _keys(devDeps);

  final toAdd = _requiredDependencies.entries
      .where((e) => !existingDeps.contains(e.key))
      .toList();
  final toAddDev = _requiredDevDependencies.entries
      .where((e) => !existingDevDeps.contains(e.key))
      .toList();

  if (toAdd.isEmpty && toAddDev.isEmpty) {
    return;
  }

  String newContent = content;

  if (toAdd.isNotEmpty) {
    newContent = _injectDepsSection(
      newContent,
      'dependencies',
      toAdd.map((e) => _depLine(e.key, e.value)).toList(),
    );
  }
  if (toAddDev.isNotEmpty) {
    newContent = _injectDepsSection(
      newContent,
      'dev_dependencies',
      toAddDev.map((e) => _depLine(e.key, e.value)).toList(),
    );
  }

  file.writeAsStringSync(newContent);
  context.logger.info(
    'Added ${toAdd.length + toAddDev.length} missing dependency(ies) to pubspec.yaml',
  );
}

Set<String> _keys(YamlMap? m) {
  if (m == null) return {};
  return m.keys.map((k) => k.toString()).toSet();
}

String _depLine(String name, String value) {
  if (value.startsWith('sdk:')) {
    return '  $name:\n    $value';
  }
  return '  $name: $value';
}

String _injectDepsSection(String content, String sectionName, List<String> lines) {
  final sectionStart = RegExp('^$sectionName:\\s*\$', multiLine: true);
  final match = sectionStart.firstMatch(content);
  if (match == null) {
    return content;
  }
  final insertPos = match.end;
  final rest = content.substring(insertPos);
  final nextSection = RegExp(r'\n(?!\s)[a-z_][a-z0-9_]*:').firstMatch(rest);
  final endOfSection =
      nextSection != null ? insertPos + nextSection.start : content.length;
  final existingBlock = content.substring(insertPos, endOfSection);
  final toAppend = lines.join('\n');
  final newBlock = existingBlock.trim().isEmpty
      ? '\n$toAppend\n'
      : '$existingBlock\n$toAppend\n';
  return content.substring(0, insertPos) +
      newBlock +
      content.substring(endOfSection);
}

Future<void> _renameFeatureDir(HookContext context) async {
  final featureName = context.vars['featureName'] as String? ?? 'feature';
  final dir = Directory('lib/features/feature');
  final target = Directory('lib/features/$featureName');
  if (dir.existsSync()) {
    if (target.existsSync()) {
      target.deleteSync(recursive: true);
    }
    dir.renameSync('lib/features/$featureName');
  }
}

const _featureInjectionsPath = 'lib/shared/utils/config/feature_injections.dart';

/// Добавляет импорт и регистрацию новой фичи в feature_injections.dart.
Future<void> _registerFeatureInjection(HookContext context) async {
  final file = File(_featureInjectionsPath);
  if (!file.existsSync()) {
    context.logger.info(
      '$_featureInjectionsPath not found — add ${context.vars['featureName']}Injection to featureInjections manually',
    );
    return;
  }

  final package = context.vars['package'] as String? ?? 'base_app';
  final featureName = context.vars['featureName'] as String? ?? 'feature';
  final snakeName = _toSnakeCase(featureName);
  final camelName = _toCamelCase(snakeName);
  final injectionName = '${camelName}Injection';
  final importLine =
      "import 'package:$package/features/$snakeName/${snakeName}_injection.dart';";

  String content = file.readAsStringSync();

  if (content.contains(importLine) && content.contains('$injectionName,')) {
    return;
  }

  if (!content.contains(importLine)) {
    final imports = RegExp(r"import '[^']+';", multiLine: true).allMatches(content);
    if (imports.isNotEmpty) {
      final lastImport = imports.last;
      content = content.replaceRange(
        lastImport.end,
        lastImport.end,
        '\n$importLine',
      );
    }
  }

  final listEntry = '$injectionName,';
  if (!content.contains(listEntry)) {
    final appFeaturesEntryMatch = RegExp(
      r'^(\s*)appFeaturesInjection,\s*$',
      multiLine: true,
    ).firstMatch(content);
    if (appFeaturesEntryMatch != null) {
      final indent = appFeaturesEntryMatch.group(1) ?? '  ';
      final insertPos = appFeaturesEntryMatch.end;
      content = content.replaceRange(insertPos, insertPos, '\n$indent$listEntry');
    }
  }

  file.writeAsStringSync(content);
  context.logger.info('Registered $injectionName in $_featureInjectionsPath');
}

String _toSnakeCase(String s) {
  return s
      .replaceAllMapped(
        RegExp(r'[A-Z]'),
        (m) => '_${m.group(0)!.toLowerCase()}',
      )
      .replaceFirst(RegExp(r'^_'), '')
      .toLowerCase();
}

String _toCamelCase(String snake) {
  if (snake.isEmpty) return snake;
  final parts = snake.split('_');
  return parts.first.toLowerCase() +
      parts.skip(1).map((p) {
        if (p.isEmpty) return p;
        return p[0].toUpperCase() + p.substring(1).toLowerCase();
      }).join();
}
