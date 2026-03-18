import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:{{packageName}}/shared/core/services/firebase_analytics_service.dart';

class AnalyticsRouteObserver extends AutoRouterObserver {
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
      // Убираем лишние символы из имени экрана для лучшей читаемости
      final cleanScreenName = screenName
          .replaceAll('/', '')
          .replaceAll('-', '_');

      AnalyticsService.instance.logScreenView(screenName: cleanScreenName);
      debugPrint("📊 Screen viewed: $cleanScreenName");
    }
  }
}
