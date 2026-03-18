import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDialogWidget extends StatelessWidget {
  final Widget content;
  final VoidCallback onOk;
  final VoidCallback onCancel;
  final Widget onCancelText;
  final Widget onOkText;
  final Widget? title;

  const CustomDialogWidget({
    super.key,
    required this.content,
    required this.onOk,
    required this.onCancel,
    required this.onCancelText,
    required this.onOkText,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoAlertDialog(
            content: content,
            actions: [
              CupertinoDialogAction(onPressed: onOk, child: onOkText),
              CupertinoDialogAction(onPressed: onCancel, child: onCancelText),
            ],
          )
        : AlertDialog(
            title: title,
            content: content,
            backgroundColor: Colors.white,
            actionsPadding: const EdgeInsets.fromLTRB(12, 0, 12, 6),
            contentPadding: const EdgeInsets.fromLTRB(24, 20, 24, 10),
            actions: [
              TextButton(onPressed: onOk, child: onOkText),
              TextButton(onPressed: onCancel, child: onCancelText),
            ],
          );
  }
}
