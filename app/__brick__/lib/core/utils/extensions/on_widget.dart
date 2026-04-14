// ignore_for_file: avoid-dynamic

import 'package:animations/animations.dart';
import 'package:{{packageName}}/shared/widgets/dialogs/app_overlay.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_json_view/flutter_json_view.dart';

/// Message shown for "in progress" (stub). Used by [OnWidget.inProgress].
const String inProgressMessage = 'Данный функционал в разработке';

extension OnWidget on Widget {
  /// Wraps this widget as a visual stub: semi-transparent (opacity 0.5), non-interactive,
  /// and shows [inProgressMessage] on tap.
  Widget inProgress() {
    return Builder(
      builder: (context) {
        return GestureDetector(
          onTap: () {
            AppOverlay.show(
              context: context,
              message: inProgressMessage,
              duration: const Duration(seconds: 2),
            );
          },
          child: Opacity(opacity: 0.5, child: AbsorbPointer(child: this)),
        );
      },
    );
  }

  /// Wraps this widget with a debug-only JSON viewer button (top-right).
  /// In release or when [json] is null, returns [this] unchanged.
  ///
  /// [modelName] is shown as the app bar title when the JSON view is expanded.
  /// Nested objects (e.g. from [toJson] that put raw model instances in the map)
  /// are normalized so [JsonView] can render them.
  Widget withJsonView(Map<String, dynamic>? json, {String? modelName}) {
    if (!kDebugMode || json == null) return this;

    final normalized = _normalizeMapForJsonView(json);
    final title = modelName ?? 'JSON';

    return Stack(
      clipBehavior: Clip.none,
      children: [
        this,
        Positioned(
          top: 0,
          right: 0,
          child: OpenContainer(
            closedColor: Colors.transparent,
            closedElevation: 0,
            closedBuilder: (context, action) {
              return CupertinoButton(
                padding: EdgeInsets.zero,
                minimumSize: const Size(30, 30),
                onPressed: action,
                child: const Icon(Icons.code),
              );
            },
            openBuilder: (context, action) {
              return CupertinoPageScaffold(
                navigationBar: CupertinoNavigationBar(middle: Text(title)),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 100,
                  ),
                  child: JsonView.map(normalized),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

/// Recursively normalizes a map so all values are JSON-viewable (primitives,
/// [Map<String, dynamic>], [List]). Converts nested model instances that have
/// [toJson] into maps so [JsonView] can render them.
Map<String, dynamic> _normalizeMapForJsonView(Map<String, dynamic> map) {
  final result = <String, dynamic>{};
  for (final entry in map.entries) {
    result[entry.key] = _normalizeValueForJsonView(entry.value);
  }
  return result;
}

Object? _normalizeValueForJsonView(Object? value) {
  if (value == null) return null;
  if (value is num || value is bool || value is String) return value;
  if (value is Map) {
    return _normalizeMapForJsonView(Map<String, dynamic>.from(value));
  }
  if (value is List) {
    return value.map(_normalizeValueForJsonView).toList();
  }
  if (value is DateTime) return value.toIso8601String();
  // Nested model instances (e.g. CargoDetail, TruckDetail) from toJson()
  // that weren't serialized by json_serializable.
  try {
    final json = _invokeToJson(value);
    if (json is Map) {
      return _normalizeMapForJsonView(Map<String, dynamic>.from(json));
    }
    if (json is List) {
      return json.map(_normalizeValueForJsonView).toList();
    }
    return json;
  } on Object {
    return value.toString();
  }
}

/// Calls [toJson] on model-like objects; used so JsonView can render nested objects.
Object? _invokeToJson(Object value) {
  // ignore: avoid_dynamic - required to call toJson() on arbitrary model types
  return (value as dynamic).toJson();
}
