import 'package:auto_route/auto_route.dart';
import 'package:{{packageName}}/core/utils/constants/app_const/app_const.dart';
import 'package:{{packageName}}/core/utils/injections.dart';
import 'package:flutter/material.dart';
import 'package:{{packageName}}/shared/widgets/guards/authed_guard_dialog.dart';
import 'package:{{packageName}}/core/translation/generated/l10n.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthGuard extends AutoRouteGuard {
  final bool shouldShowDialog;
  final String? dialogTitle;
  final String? dialogDescription;

  const AuthGuard({
    this.shouldShowDialog = true,
    this.dialogTitle,
    this.dialogDescription,
  });

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final hasAccessToken = await sl<FlutterSecureStorage>().read(
      key: AppConst.accessToken,
    );
    if (hasAccessToken != null && hasAccessToken.isNotEmpty) {
      resolver.next(true);
    } else {
      if (shouldShowDialog) {
        final context = router.navigatorKey.currentContext;
        if (context != null) {
          if (context.mounted) {
            showDialog(
              context: context,
              builder: (context) => AuthedGuardDialog(
                buttonText: S.of(context).signIn,
                onTap: () {
                  // TODO: Implement navigate to the screen
                },
              ),
            );
          }
        }
        resolver.next(false);
      } else {
        // TODO: Implement navigate to the screen
        resolver.next(false);
      }
    }
  }
}
