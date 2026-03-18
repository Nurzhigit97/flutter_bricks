import 'package:auto_route/auto_route.dart';
import 'package:{{packageName}}/shared/core/services/storage/local_storage.dart';
import 'package:{{packageName}}/shared/utils/constants/app_const/app_const.dart';
import 'package:{{packageName}}/shared/utils/injections.dart';

class IsFirstLaunchGuard extends AutoRouteGuard {
  final bool shouldShowDialog;
  final String? dialogTitle;
  final String? dialogDescription;

  const IsFirstLaunchGuard({
    this.shouldShowDialog = true,
    this.dialogTitle,
    this.dialogDescription,
  });

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final isFirstLaunchValue = sl<LocalStorage>().getBool(
      AppConst.isFirstLaunch,
    );

    if (isFirstLaunchValue) {
      // TODO: Implement navigate to the screen
      // router.pushAndPopUntil(
      //   const SelectLanguageRoute(),
      //   predicate: (route) {
      //     return true;
      //   },
      // );
      resolver.next(false); // Останавливаем навигацию к MainRoute
    } else {
      resolver.next(true); // Разрешаем навигацию к MainRoute
    }
  }
}
