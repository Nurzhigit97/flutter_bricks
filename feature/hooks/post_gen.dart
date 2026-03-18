import 'dart:io';

import 'package:mason/mason.dart';
import 'package:yaml/yaml.dart';

/// Зависимости, необходимые сгенерированному коду фичи.
/// Добавляются в проект при генерации, если их ещё нет (без копипаста в новом проекте).
const _requiredDependencies = <String, String>{
  'flutter': 'sdk: flutter',
  'flutter_bloc': '^9.1.1',
  'bloc': '^9.1.0',
  'freezed_annotation': '^3.0.0',
  'auto_route': '^10.2.0',
  'dartz': '^0.10.1',
  'dio': '^5.7.0',
  'get_it': '^8.0.0',
};

const _requiredDevDependencies = <String, String>{
  'build_runner': '^2.4.13',
  'freezed': '^3.0.0',
  'json_serializable': '^6.13.0',
};

Future<void> run(HookContext context) async {
  await _ensureDependencies(context);
  await _renameFeatureDir(context);
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
