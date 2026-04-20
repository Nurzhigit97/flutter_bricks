import 'package:flutter/material.dart';
import 'package:{{packageName}}/core/helper/extensions.dart';
import 'package:{{packageName}}/core/translation/generated/l10n.dart';

class SignInButtonWidget extends StatelessWidget {
  const SignInButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // TODO: Implement navigate to the screen
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 100,
              height: 32,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: context.colorScheme.primary,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    S.of(context).signIn2,
                    style: context.theme.textTheme.labelLarge?.copyWith(
                      color: context.colorScheme.onPrimary,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
