import 'package:auto_route/auto_route.dart';
import 'package:{{packageName}}/core/routes/app_routes.gr.dart';
import 'package:{{packageName}}/core/routes/guards/auth_guard.dart';
import 'package:{{packageName}}/core/routes/guards/is_first_launch_guard.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  final AuthGuard authGuard;
  final IsFirstLaunchGuard isFirstLaunchGuard;
  AppRouter(this.authGuard, this.isFirstLaunchGuard);

  @override
  List<AutoRoute> get routes => [
    // AutoRoute(
    //   page: MainRoute.page,
    //   initial: true,
    //   guards: [isFirstLaunchGuard],
    //   children: [
    // Home Tab
    // AutoRoute(
    //   page: HomeNavigator.page,
    //   children: [AutoRoute(page: HomeRoute.page, initial: true)],
    // ),
    // // Tasks Tab
    // AutoRoute(
    //   page: TaskNavigator.page,
    //   children: [AutoRoute(page: TaskRoute.page, initial: true)],
    // ),

    // // Chat Tab
    // AutoRoute(
    //   page: ChatNavigator.page,
    //   children: [AutoRoute(page: ChatRoute.page, initial: true)],
    // ),

    // // Profile Tab
    // AutoRoute(
    //   page: ProfileNavigator.page,
    //   children: [AutoRoute(page: ProfileRoute.page, initial: true)],
    // ),
    // ],
    // ),
  ];
}
