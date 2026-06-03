import 'package:auto_route/auto_route.dart';
import 'package:{{packageName}}/core/routes/guards/auth_guard.dart';
import 'package:{{packageName}}/core/routes/guards/is_first_launch_guard.dart';
import 'package:{{packageName}}/core/routes/app_routes.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  final AuthGuard authGuard;
  final IsFirstLaunchGuard isFirstLaunchGuard;
  AppRouter(this.authGuard, this.isFirstLaunchGuard);

  // newsDetailRoute

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page, initial: true),

    AutoRoute(
      page: AuthNavigator.page,
      children: [
        AutoRoute(page: AuthPartnerWelcomeRoute.page, initial: true),
        AutoRoute(page: AuthPhoneRoute.page),
        AutoRoute(page: AuthFleetSelectRoute.page),
        AutoRoute(page: AuthLoginPasswordRoute.page),
        AutoRoute(page: AuthPasswordRoute.page),
      ],
    ),

    AutoRoute(
      page: MainRoute.page,
      guards: [authGuard],
      children: [
        AutoRoute(
          page: HomeNavigator.page,
          children: [AutoRoute(page: HomeRoute.page, initial: true)],
        ),
        AutoRoute(
          page: NewsNavigator.page,
          children: [AutoRoute(page: NewsRoute.page, initial: true)],
        ),
        AutoRoute(
          page: NotificationNavigator.page,
          children: [AutoRoute(page: NotificationRoute.page, initial: true)],
        ),
        AutoRoute(
          page: ProfileNavigator.page,
          children: [AutoRoute(page: ProfileRoute.page, initial: true)],
        ),
      ],
    ),

    AutoRoute(page: PaymentHistoryDetailRoute.page),

    AutoRoute(page: NewsDetailRoute.page),
    AutoRoute(
      page: WithdrawalNavigator.page,
      children: [
        AutoRoute(page: BanksRoute.page, initial: true),
        AutoRoute(page: CheckNumberRoute.page),
        AutoRoute(page: SubmitPaymentNumberRoute.page),
        AutoRoute(page: PaymentSuccessRoute.page),
      ],
    ),
    AutoRoute(page: ProfileDetailRoute.page),
    AutoRoute(
      page: FinikPayNavigator.page,
      children: [AutoRoute(page: FinikPayRoute.page, initial: true)],
    ),
    AutoRoute(page: CheckNumberRoute.page),
    AutoRoute(
      page: PaymentHistoryNavigator.page,
      children: [AutoRoute(page: PaymentHistoryRoute.page, initial: true)],
    ),
    AutoRoute(page: SubmitPaymentNumberRoute.page),
  ];
}
