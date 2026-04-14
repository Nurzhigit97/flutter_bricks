import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:{{packageName}}/core/helper/extensions.dart';
import 'package:{{packageName}}/core/translation/generated/l10n.dart';
import 'package:{{packageName}}/core/theme/styles/app_colors.dart';

void onDevState(BuildContext context) {
  if (Theme.of(context).platform == TargetPlatform.iOS) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(S.of(context).inDevelopment),
          content: Text(
            S.of(context).thisFunctionInDelevelopmentState,
            style: const TextStyle(fontSize: 16),
          ),
          actions: [
            CupertinoDialogAction(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                context.tr.close,
                style: const TextStyle(color: AppColors.black),
              ),
            ),
          ],
        );
      },
    );
  } else {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(context.tr.inDevelopment),
          content: Text(
            context.tr.thisFunctionInDelevelopmentState,
            style: const TextStyle(fontSize: 16),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                context.tr.close,
                style: const TextStyle(color: AppColors.black),
              ),
            ),
          ],
        );
      },
    );
  }
}
