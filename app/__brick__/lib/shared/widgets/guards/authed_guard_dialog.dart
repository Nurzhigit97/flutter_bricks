import 'package:{{packageName}}/core/utils/extensions/context_extensions.dart';
import 'package:{{packageName}}/shared/widgets/app_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:{{packageName}}/core/translation/generated/l10n.dart';

class AuthedGuardDialog extends StatelessWidget {
  final VoidCallback? onTap;
  final String buttonText;

  const AuthedGuardDialog({super.key, this.onTap, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.person, size: 80),
            const SizedBox(height: 16),
            Text(
              S.of(context).toContinueNeedSignIn,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              S.of(context).cantGetInfoOnyForAuthedusers,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: context.colorScheme.onSurface,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: AppButtonWidget(
                    onTap: () => Navigator.of(context).pop(),
                    bgColor: context.colorScheme.surface,
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: context.colorScheme.onSurface,
                    ),
                    title: S.of(context).close,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: AppButtonWidget(
                    bgColor: context.colorScheme.primary,
                    onTap: onTap ?? () {},
                    title: buttonText,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
