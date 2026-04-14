import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:{{packageName}}/core/launch/launch.dart';
import 'package:{{packageName}}/core/theme/styles/app_colors.dart';
import 'package:{{packageName}}/core/translation/generated/l10n.dart';

class AgreementCheckbox extends StatelessWidget {
  const AgreementCheckbox({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
          fontSize: 12,
          color: AppColors.textSecondaryLight,
        ),
        children: [
          TextSpan(
            text: S.of(context).movingOnIAgreeWith,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
          ),
          TextSpan(
            text: S.of(context).privacyPolicy,
            style: const TextStyle(
              color: AppColors.focusLight,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                AppLaunch.launchURL(
                  'https://baseapp.kg/politika-konfidenczialnosti-mobilnogo-prilozheniya-baseapp/',
                );
              },
          ),
          TextSpan(
            text: ' ${S.of(context).and} ',
            style: const TextStyle(
              color: AppColors.focusLight,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          TextSpan(
            text: S.of(context).userAgreement,
            style: const TextStyle(
              color: AppColors.focusLight,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
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
