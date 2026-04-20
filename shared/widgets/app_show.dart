import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_up/core/helper/extensions.dart';

@immutable
final class AppShow {
  static Future<T?> showBottomSheet<T>(
    BuildContext context,
    Widget child, {
    double initialChildSize = 0.6,
    Key? scrollKey,
    bool? isDragHandle = true,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      backgroundColor: context.theme.scaffoldBackgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      builder: (_) {
        return DraggableScrollableSheet(
          initialChildSize: initialChildSize,
          maxChildSize: 0.9,
          minChildSize: 0.4,
          expand: false,
          builder: (c, s) {
            return Column(
              children: [
                const SizedBox(height: 8, width: double.infinity),
                if (isDragHandle == true)
                  const SizedBox(
                    height: 30,
                    child: Icon(
                      Icons.maximize_rounded,
                      size: 50,
                      color: Colors.grey,
                    ),
                  ),
                Expanded(
                  child: SingleChildScrollView(
                    key: scrollKey,
                    physics: const BouncingScrollPhysics(),
                    controller: s,
                    child: child,
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  static Future<T?> showCustomDialog<T>(
    BuildContext context,
    Widget child, {
    bool barrierDismissible = true,
    bool useSafeArea = true,
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (_) {
        return AlertDialog(
          content: child,
          titlePadding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
          backgroundColor: context.theme.scaffoldBackgroundColor,
          contentPadding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        );
      },
    );
  }

  static void showSnackbar(
    BuildContext context,
    String message, {
    bool isError = false,
    Duration duration = const Duration(seconds: 3),
  }) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: isError ? Colors.red : Colors.green,
      duration: duration,
    );

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      snackBar,
      snackBarAnimationStyle: const AnimationStyle(
        curve: Curves.easeInOut,
        duration: Duration(milliseconds: 300),
      ),
    );
  }

  static Future<bool?> showAlertDialog({
    required BuildContext context,
    required String title,
    required String content,
    String? cancelActionText,
    required String defaultActionText,
    bool isDestructive = false,
    String? routeName,
  }) {
    return Platform.isAndroid
        ? showDialog<bool>(
            context: context,
            barrierDismissible: false,
            routeSettings: RouteSettings(name: routeName),
            builder: (context) => AlertDialog(
              title: Text(title),
              content: Text(content),
              actions: [
                if (cancelActionText != null)
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: Text(cancelActionText),
                  ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  style: isDestructive
                      ? TextButton.styleFrom(foregroundColor: Colors.red)
                      : null,
                  child: Text(defaultActionText),
                ),
              ],
            ),
          )
        : showCupertinoDialog(
            context: context,
            routeSettings: RouteSettings(name: routeName),
            builder: (context) => CupertinoAlertDialog(
              title: Text(title),
              content: Text(content),
              actions: [
                if (cancelActionText != null)
                  CupertinoDialogAction(
                    child: Text(cancelActionText),
                    onPressed: () => Navigator.of(context).pop(false),
                  ),
                CupertinoDialogAction(
                  isDestructiveAction: isDestructive,
                  onPressed: () => Navigator.of(context).pop(true),
                  child: Text(defaultActionText),
                ),
              ],
            ),
          );
  }
}
