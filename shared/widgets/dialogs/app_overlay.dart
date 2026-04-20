import 'dart:async';

import 'package:flutter/material.dart';
import 'package:work_up/shared/widgets/top_snack_bar_widget.dart';

class AppOverlay {
  static OverlayEntry? _overlayEntry;
  static OverlayEntry? _loadingOverlayEntry;
  static Timer? _timer;

  static void show({
    required BuildContext context,
    required String message,
    String? actionLabel,
    VoidCallback? onAction,
    Duration duration = const Duration(seconds: 4),
    Color? backgroundColor,
    Color? textColor,
    IconData? icon,
    Color? iconColor,
  }) {
    dismiss();

    final overlay = Navigator.of(context).overlay;
    if (overlay == null) return;

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).padding.top + 16,
        left: 16,
        right: 16,
        child: Material(
          color: Colors.transparent,
          child: TopSnackBarWidget(
            message: message,
            backgroundColor: backgroundColor ?? Colors.black87,
            textColor: textColor ?? Colors.white,
            icon: icon,
            iconColor: iconColor,
            onDismiss: dismiss,
            actionLabel: actionLabel,
            onAction: onAction,
          ),
        ),
      ),
    );

    overlay.insert(_overlayEntry!);

    _timer = Timer(duration, dismiss);
  }

  static void showSuccess({
    required BuildContext context,
    required String message,
    String? actionLabel,
    VoidCallback? onAction,
    Duration duration = const Duration(seconds: 4),
  }) {
    show(
      context: context,
      message: message,
      actionLabel: actionLabel,
      onAction: onAction,
      duration: duration,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      icon: Icons.check_circle_outline,
      iconColor: Colors.white,
    );
  }

  static void showError({
    required BuildContext context,
    required String message,
    String? actionLabel,
    VoidCallback? onAction,
    Duration duration = const Duration(seconds: 5),
  }) {
    show(
      context: context,
      message: message,
      actionLabel: actionLabel,
      onAction: onAction,
      duration: duration,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      icon: Icons.error_outline,
      iconColor: Colors.white,
    );
  }

  static void showWarning({
    required BuildContext context,
    required String message,
    String? actionLabel,
    VoidCallback? onAction,
    Duration duration = const Duration(seconds: 4),
  }) {
    show(
      context: context,
      message: message,
      actionLabel: actionLabel,
      onAction: onAction,
      duration: duration,
      backgroundColor: Colors.orange,
      textColor: Colors.white,
      icon: Icons.warning_amber_rounded,
      iconColor: Colors.white,
    );
  }

  static void showInfo({
    required BuildContext context,
    required String message,
    String? actionLabel,
    VoidCallback? onAction,
    Duration duration = const Duration(seconds: 4),
  }) {
    show(
      context: context,
      message: message,
      actionLabel: actionLabel,
      onAction: onAction,
      duration: duration,
      backgroundColor: Colors.blueAccent,
      textColor: Colors.white,
      icon: Icons.info_outline,
      iconColor: Colors.white,
    );
  }

  /// Dismisses any visible overlay (snackbar or loading) shown by AppOverlay.
  static void dismiss() {
    _timer?.cancel();
    _timer = null;
    _overlayEntry?.remove();
    _overlayEntry = null;
    _loadingOverlayEntry?.remove();
    _loadingOverlayEntry = null;
  }

  /// Full-screen overlay that blocks all touches. Dismiss with [dismiss].
  static void showLoading({
    required BuildContext context,
    String message = 'Загрузка...',
  }) {
    dismiss();

    final overlay = Navigator.of(context).overlay;
    if (overlay == null) return;

    _loadingOverlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        left: 0,
        top: 0,
        right: 0,
        bottom: 0,
        child: Material(
          color: Colors.black38,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              return;
            },
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircularProgressIndicator(color: Colors.white),
                  const SizedBox(height: 16),
                  Text(
                    message,
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
    overlay.insert(_loadingOverlayEntry!);
  }
}
