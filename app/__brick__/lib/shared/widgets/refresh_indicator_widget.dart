import 'package:flutter/material.dart';
import 'package:{{packageName}}/core/helper/extensions.dart';

class RefreshIndicatorWidget extends StatelessWidget {
  final VoidCallback onRefresh;
  final Widget child;
  const RefreshIndicatorWidget({
    super.key,
    required this.onRefresh,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: context.colorScheme.primary,
      backgroundColor: context.colorScheme.surface,
      onRefresh: () async => onRefresh(),
      child: child,
    );
  }
}
