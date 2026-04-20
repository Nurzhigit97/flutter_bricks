import 'package:flutter/material.dart';
import 'package:work_up/core/translation/generated/l10n.dart';
import 'package:work_up/core/utils/extensions/context_extensions.dart';

class LabelValueWidget extends StatelessWidget {
  const LabelValueWidget({
    super.key,
    required this.context,
    required this.label,
    required this.value,
    this.isTime = false,
  });

  final BuildContext context;
  final String label;
  final String value;
  final bool isTime;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: context.theme.textTheme.titleSmall?.copyWith(
          color: context.colorScheme.onSurfaceVariant,
        ),
        children: [
          TextSpan(text: '$label '),
          TextSpan(
            text: '$value ${isTime ? S.of(context).minute : ''}',
            style: context.theme.textTheme.titleSmall,
          ),
        ],
      ),
    );
  }
}
