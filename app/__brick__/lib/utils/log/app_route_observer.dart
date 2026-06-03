import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class AnalyticsRouteObserver extends AutoRouterObserver {
  static const _subtleWhite = '\x1B[2;37m';
  static const _reset = '\x1B[0m';

  @override
  void didPush(Route route, Route? previousRoute) {
    _logScreen(route);
    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    _logScreen(previousRoute);
    super.didPop(route, previousRoute);
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    _logScreen(newRoute);
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  }

  void _logScreen(Route? route) {
    final screenName = route?.settings.name;
    if (screenName != null && screenName.isNotEmpty) {
      debugPrint('$_subtleWhite📊 Screen: $screenName$_reset');
    }
  }
}
