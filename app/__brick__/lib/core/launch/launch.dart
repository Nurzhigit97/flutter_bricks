import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

@immutable
final class AppLaunch {
  const AppLaunch._();

  static Future<void> sendEmail(
    String email, {
    String? snackBarText,
    BuildContext? context,
  }) async {
    final Uri emailUri = Uri(scheme: 'mailto', path: email);

    try {
      if (await canLaunchUrl(emailUri)) {
        await launchUrl(emailUri);
      } else {
        if (snackBarText != null && context != null && context.mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(snackBarText)));
        }
        log('Cannot launch email client');
      }
    } catch (e, s) {
      log('launch Error: $e, \n launch StackTrace: $s');
    }
  }

  static Future<void> sendTelegram(
    String username, {
    String? snackBarText,
    BuildContext? context,
  }) async {
    try {
      final isSuccess = await launchUrl(
        Uri.parse('https://telegram.me/$username'),
        mode: LaunchMode.externalApplication,
      );
      if (!isSuccess &&
          snackBarText != null &&
          context != null &&
          context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(snackBarText)));
      }
    } catch (e, s) {
      log('launch Error: $e, \n launch StackTrace: $s');
    }
  }

  static Future<void> sendWhatsApp(
    String whatsapp, {
    String? snackBarText,
    BuildContext? context,
  }) async {
    try {
      final isSuccess = await launchUrl(
        Uri.parse('whatsapp://send?phone=$whatsapp'),
        mode: LaunchMode.externalApplication,
      );
      if (!isSuccess &&
          snackBarText != null &&
          context != null &&
          context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(snackBarText)));
      }
    } catch (e, s) {
      log('launch Error: $e, \n launch StackTrace: $s');
    }
  }

  // phone

  static Future<void> callPhone(
    String phone, {
    String? snackBarText,
    BuildContext? context,
  }) async {
    try {
      final isSuccess = await launchUrl(Uri(scheme: 'tel', path: phone));
      if (!isSuccess &&
          snackBarText != null &&
          context != null &&
          context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(snackBarText)));
      }
    } catch (e, s) {
      log('launch Error: $e, \n launch StackTrace: $s');
    }
  }

  static Future<void> launchURL(String url, {BuildContext? context}) async {
    try {
      final uri = Uri.parse(url);
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (e, s) {
      log('launch Error: $e, \n launch StackTrace: $s');
    }
  }

  // instagram
  static Future<void> launchInstagram(
    String username, {
    String? snackBarText,
    BuildContext? context,
  }) async {
    try {
      final isSuccess = await launchUrl(
        Uri.parse('https://www.instagram.com/$username'),
        mode: LaunchMode.externalApplication,
      );
      if (!isSuccess &&
          snackBarText != null &&
          context != null &&
          context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(snackBarText)));
      }
    } catch (e, s) {
      log('launch Error: $e, \n launch StackTrace: $s');
    }
  }
}
