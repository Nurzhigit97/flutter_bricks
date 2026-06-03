import 'package:auto_route/auto_route.dart';
import 'package:{{packageName}}/core/services/storage/local_storage.dart';
import 'package:{{packageName}}/core/routes/app_routes.gr.dart';
import 'package:{{packageName}}/core/utils/constants/app_const/app_const.dart';
import 'package:{{packageName}}/core/utils/injections.dart';

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
    final hasAccessToken = sl<LocalStorage>().getString(AppConst.accessToken);
    if (hasAccessToken != null && hasAccessToken.isNotEmpty) {
      resolver.next(true);
    } else {
      router.replace(const AuthNavigator());
      resolver.next(false);
    }
  }
}
