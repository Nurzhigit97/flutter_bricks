import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:{{packageName}}/shared/core/translation/generated/l10n.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> showPermissionDialog(
  BuildContext context,
  String description,
) async {
  if (Platform.isIOS) {
    await showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(S.of(context).requiredPermission),
        content: Text(description),
        actions: [
          CupertinoDialogAction(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(S.of(context).cancel),
          ),
          CupertinoDialogAction(
            onPressed: () {
              Navigator.of(context).pop();
              openAppSettings();
            },
            isDefaultAction: true,
            child: Text(S.of(context).settings),
          ),
        ],
      ),
    );
  } else {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(S.of(context).requiredPermission),
        content: Text(description),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(S.of(context).cancel),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              openAppSettings();
            },
            child: Text(S.of(context).settings),
          ),
        ],
      ),
    );
  }
}
