import 'package:flutter/material.dart';
import 'package:{{packageName}}/shared/theme/styles/app_colors.dart';

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
      color: AppColors.focusLight,
      backgroundColor: AppColors.white,
      onRefresh: () async => onRefresh(),
      child: child,
    );
  }
}
