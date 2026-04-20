import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:work_up/core/launch/launch.dart';
import 'package:work_up/core/theme/theme_extension.dart';
import 'package:work_up/core/utils/extensions/context_extensions.dart';

class AgreementCheckbox extends StatelessWidget {
  const AgreementCheckbox({super.key});

  @override
  Widget build(BuildContext context) {
    final baseStyle = context.bodySmall?.copyWith(
      fontSize: 12,
      color: context.colors.labelSecondary,
    );
    final linkStyle = TextStyle(
      color: context.colorScheme.primary,
      fontSize: 12,
      fontWeight: FontWeight.w400,
    );

    return RichText(
      text: TextSpan(
        style: baseStyle,
        children: [
          TextSpan(
            text: context.tr.movingOnIAgreeWith,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
          ),
          TextSpan(
            text: context.tr.privacyPolicy,
            style: linkStyle,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                AppLaunch.launchURL(
                  'https://baseapp.kg/politika-konfidenczialnosti-mobilnogo-prilozheniya-baseapp/',
                );
              },
          ),
          TextSpan(text: ' ${context.tr.and} ', style: linkStyle),
          TextSpan(
            text: context.tr.userAgreement,
            style: linkStyle,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                AppLaunch.launchURL(
                  'https://baseapp.kg/politika-konfidenczialnosti-mobilnogo-prilozheniya-baseapp/',
                );
              },
          ),
        ],
      ),
    );
  }
}
