import 'dart:async';
import 'package:app_links/app_links.dart';
import 'package:{{packageName}}/shared/routes/app_routes.gr.dart';
import 'package:flutter/material.dart';
import 'package:{{packageName}}/shared/routes/app_routes.dart';

class DeepLinkService {
  static final DeepLinkService _instance = DeepLinkService._internal();
  factory DeepLinkService() => _instance;
  DeepLinkService._internal();

  final AppLinks _appLinks = AppLinks();
  StreamSubscription<Uri>? _linkSubscription;
  AppRouter? _router;

  void initialize(AppRouter router) {
    _router = router;
    _handleInitialLink();
    _handleIncomingLinks();
  }

  Future<void> _handleInitialLink() async {
    try {
      final uri = await _appLinks.getInitialLink();
      if (uri != null) _handleDeepLink(uri);
    } catch (e) {
      debugPrint('DeepLink initial error: $e');
    }
  }

  void _handleIncomingLinks() {
    _linkSubscription = _appLinks.uriLinkStream.listen(
      (uri) => _handleDeepLink(uri),
      onError: (err) {
        debugPrint('DeepLink stream error: $err');
      },
    );
  }

  void _handleDeepLink(Uri uri) {
    // Нормализуем URL: заменяем лишние ? на &
    String url = uri.toString();
    final firstQuestion = url.indexOf('?');
    if (firstQuestion != -1) {
      final before = url.substring(0, firstQuestion + 1);
      final after = url.substring(firstQuestion + 1).replaceAll('?', '&');
      url = before + after;
    }

    final normalized = Uri.parse(url);
    final path = normalized.path;
    final host = normalized.host;
    final scheme = normalized.scheme;

    // Проверяем, что это payment URL
    if ((host != 'paymentbaseApp.kg' && scheme != 'baseApp') ||
        !path.contains('/pay')) {
      return;
    }

    // Получаем статус
    String? status = normalized.queryParameters['status'];
    status ??= path.contains('/success') ? 'succeeded' : null;
    status ??= path.contains('/failure') ? 'failed' : null;

    if (status == null) return;

    // Переходим на экран результата
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_router != null) {
        _router!.pushAndPopUntil(
          const MainRoute(),
          predicate: (route) => false,
        );
      }
    });
  }

  void dispose() {
    _linkSubscription?.cancel();
    _router = null;
  }
}
