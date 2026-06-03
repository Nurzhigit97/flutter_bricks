import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart' show kDebugMode, kIsWeb;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:{{packageName}}/firebase_options.dart';
import 'package:{{packageName}}/core/services/storage/local_storage.dart';
import 'package:{{packageName}}/core/utils/constants/app_const/app_const.dart';

/// Сервис для работы с Firebase Cloud Messaging (FCM)
class FCMService {
  static final FCMService _instance = FCMService._internal();
  factory FCMService() => _instance;
  FCMService._internal();

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();

  LocalStorage? _prefsService;
  Function(String)? _onTokenRefresh;
  Function(RemoteMessage)? _onMessageReceived;
  Function(RemoteMessage)? _onNavigate;

  /// Инициализация FCM сервиса
  Future<void> initialize({
    required LocalStorage prefsService,
    Function(String)? onTokenRefresh,
    Function(RemoteMessage)? onMessageReceived,
    Function(RemoteMessage)? onNavigate,
  }) async {
    _prefsService = prefsService;
    _onTokenRefresh = onTokenRefresh;
    _onMessageReceived = onMessageReceived;
    _onNavigate = onNavigate;

    // Запрос разрешений на уведомления
    await _requestPermissions();

    // Инициализация локальных уведомлений для foreground
    await _initializeLocalNotifications();

    // Получение FCM токена
    await _getFCMToken();

    // Настройка обработчиков сообщений
    _setupMessageHandlers();

    // Подписка на обновления токена
    _firebaseMessaging.onTokenRefresh.listen(_handleTokenRefresh);

    log('FCM Service initialized');
  }

  /// Запрос разрешений на уведомления
  Future<void> _requestPermissions() async {
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (!kDebugMode) {
      log('User granted permission: ${settings.authorizationStatus}');
    }
  }

  /// Инициализация локальных уведомлений для отображения в foreground
  Future<void> _initializeLocalNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
          requestAlertPermission: true,
          requestBadgePermission: true,
          requestSoundPermission: true,
        );

    const InitializationSettings initializationSettings =
        InitializationSettings(
          android: initializationSettingsAndroid,
          iOS: initializationSettingsIOS,
        );

    await _localNotifications.initialize(
      settings: initializationSettings,
      onDidReceiveNotificationResponse: _onNotificationTapped,
    );

    // Создание канала для Android
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      description: 'This channel is used for important notifications.',
      importance: Importance.high,
    );

    await _localNotifications
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(channel);
  }

  /// Обработка нажатия на уведомление
  void _onNotificationTapped(NotificationResponse response) {
    log('Notification tapped: ${response.payload}');

    // Создаем RemoteMessage из payload для обработки навигации
    if (response.payload != null && response.payload!.isNotEmpty) {
      try {
        // Пытаемся распарсить payload как JSON
        Map<String, dynamic> payloadData;
        try {
          payloadData = jsonDecode(response.payload!) as Map<String, dynamic>;
        } catch (e) {
          // Если не JSON, создаем пустой Map
          log('Payload is not JSON, using empty data: $e');
          payloadData = {};
        }

        // Создаем RemoteMessage с распарсенными данными
        final message = RemoteMessage(
          messageId: response.id?.toString(),
          data: payloadData,
        );

        log('Parsed notification data: ${message.data}');

        // Вызываем callback для навигации
        _onNavigate?.call(message);

        // Также вызываем общий callback
        _onMessageReceived?.call(message);
      } catch (e) {
        log('Error handling notification tap: $e');
      }
    }
  }

  /// Получение FCM токена
  Future<String?> _getFCMToken() async {
    try {
      // На iOS нужно сначала получить APNS токен
      if (!kIsWeb && Platform.isIOS) {
        String? apnsToken = await _firebaseMessaging.getAPNSToken();
        if (apnsToken == null && !kDebugMode) {
          log('APNS token not available yet, waiting...');
          // Ждем до 30 секунд с проверкой каждые 500мс
          for (int i = 0; i < 60; i++) {
            await Future.delayed(const Duration(milliseconds: 500));
            apnsToken = await _firebaseMessaging.getAPNSToken();
            if (apnsToken != null) {
              log('APNS token received: $apnsToken');
              break;
            }
          }
          if (apnsToken == null) {
            log('APNS token still not available after waiting');
            return null;
          }
        }
      }

      String? token = await _firebaseMessaging.getToken();
      if (kDebugMode) {
        log('FCM Token: $token');
      }
      await _prefsService?.setString(AppConst.fcmToken, token ?? "");
      _onTokenRefresh?.call(token ?? '');
      return token;
    } catch (e) {
      log('Error getting FCM token: $e');
    }
    return null;
  }

  /// Обработка обновления токена
  void _handleTokenRefresh(String newToken) {
    log('FCM Token refreshed: $newToken');
    _prefsService?.setString(AppConst.fcmToken, newToken);
    _onTokenRefresh?.call(newToken);
  }

  /// Настройка обработчиков сообщений
  void _setupMessageHandlers() {
    // Обработка сообщений когда приложение в foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      log('Got a message whilst in the foreground!');
      log('Message data: ${message.data}');

      if (message.notification != null) {
        log('Message also contained a notification: ${message.notification}');
        _showLocalNotification(message);
      }

      _onMessageReceived?.call(message);
    });

    // Обработка сообщений когда приложение открыто из уведомления
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      log('A new onMessageOpenedApp event was published!');
      log('Message data: ${message.data}');
      _onNavigate?.call(message);
      _onMessageReceived?.call(message);
    });

    // Обработка сообщений когда приложение было закрыто и открыто из уведомления
    _firebaseMessaging.getInitialMessage().then((RemoteMessage? message) {
      if (message != null) {
        log('App opened from notification: ${message.data}');
        // Используем отложенную навигацию для обеспечения готовности роутера
        Future.delayed(const Duration(milliseconds: 500), () {
          _onNavigate?.call(message);
          _onMessageReceived?.call(message);
        });
      }
    });
  }

  /// Показ локального уведомления для foreground
  Future<void> _showLocalNotification(RemoteMessage message) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
          'high_importance_channel',
          'High Importance Notifications',
          channelDescription:
              'This channel is used for important notifications.',
          importance: Importance.high,
          priority: Priority.high,
          showWhen: true,
        );

    const DarwinNotificationDetails iOSPlatformChannelSpecifics =
        DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        );

    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );

    // Сохраняем данные как JSON строку в payload для последующего использования при клике
    final payloadJson = jsonEncode(message.data);

    await _localNotifications.show(
      id: message.hashCode,
      title: message.notification?.title ?? 'Новое уведомление',
      body: message.notification?.body ?? '',
      notificationDetails: platformChannelSpecifics,
      payload: payloadJson,
    );
  }

  /// Получить текущий FCM токен
  Future<String?> getToken() async {
    try {
      // На iOS нужно сначала получить APNS токен
      if (!kIsWeb && Platform.isIOS) {
        String? apnsToken = await _firebaseMessaging.getAPNSToken();
        if (apnsToken == null && !kDebugMode) {
          log('APNS token not available yet, waiting...');
          for (int i = 0; i < 60; i++) {
            await Future.delayed(const Duration(milliseconds: 500));
            apnsToken = await _firebaseMessaging.getAPNSToken();
            if (apnsToken != null) {
              log('APNS token received: $apnsToken');
              break;
            }
          }
          if (apnsToken == null) {
            log('APNS token still not available after waiting');
            return null;
          }
        }
      }
      log('Getting FCM token... ${_firebaseMessaging.getToken()}');

      return await _firebaseMessaging.getToken();
    } catch (e) {
      log('Error getting FCM token: $e');
      return null;
    }
  }

  /// Получить сохраненный FCM токен из локального хранилища
  Future<String?> getSavedToken() async {
    return _prefsService?.getString(AppConst.fcmToken);
  }

  /// Подписаться на топик
  Future<void> subscribeToTopic(String topic) async {
    await _firebaseMessaging.subscribeToTopic(topic);
    log('Subscribed to topic: $topic');
  }

  /// Отписаться от топика
  Future<void> unsubscribeFromTopic(String topic) async {
    await _firebaseMessaging.unsubscribeFromTopic(topic);
    log('Unsubscribed from topic: $topic');
  }

  /// Удалить токен (при выходе из аккаунта)
  Future<void> deleteToken() async {
    try {
      // На iOS нужно проверить наличие APNS токена перед удалением
      if (!kIsWeb && Platform.isIOS) {
        String? apnsToken = await _firebaseMessaging.getAPNSToken();
        if (apnsToken == null) {
          log(
            'APNS token not available, skipping FCM token deletion on server',
          );
          // Удаляем токен из локального хранилища, но не пытаемся удалить на сервере
          await _prefsService?.remove(AppConst.fcmToken);
          log('FCM Token removed from local storage');
          return;
        }
      }

      await _firebaseMessaging.deleteToken();
      await _prefsService?.remove(AppConst.fcmToken);
      log('FCM Token deleted');
    } catch (e) {
      log('Error deleting FCM token: $e');
      // В любом случае удаляем токен из локального хранилища
      await _prefsService?.remove(AppConst.fcmToken);
      log('FCM Token removed from local storage despite error');
    }
  }
}

/// Background message handler (должен быть top-level функцией)
///
/// Важно: FCM автоматически показывает уведомления, если в payload есть поле 'notification'.
/// Поэтому мы НЕ показываем уведомления здесь, чтобы избежать дублирования.
///
/// Если нужно показать уведомление для data-only сообщений (без поля 'notification'),
/// можно раскомментировать код ниже.
@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  log('Handling a background message: ${message.messageId}');
  log('Message data: ${message.data}');
  log('Message notification: ${message.notification}');

  // FCM автоматически показывает уведомления, если в payload есть поле 'notification'
  // Поэтому мы не показываем их здесь, чтобы избежать дублирования

  // Если нужно обработать data-only сообщения (без поля 'notification'),
  // можно добавить логику здесь для показа кастомных уведомлений
}
