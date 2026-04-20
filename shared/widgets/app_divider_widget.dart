import 'package:flutter/material.dart';
import 'package:work_up/core/utils/extensions/context_extensions.dart';

class AppDividerWidget extends StatelessWidget {
  const AppDividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(height: 0, color: context.theme.dividerColor);
  }
}
