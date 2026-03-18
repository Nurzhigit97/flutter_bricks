# Firebase Crashlytics Integration

## Обзор

Firebase Crashlytics теперь полностью интегрирован в приложение и автоматически собирает:
- **Автоматические ошибки Flutter** (FlutterError.onError)
- **Ошибки платформы** (PlatformDispatcher.onError)
- **Ошибки BLoC** (через AppBlocObserver)
- **Сетевые ошибки** (через DioNetwork)
- **Пользовательские ошибки** (через AnalyticsService)

## Автоматический сбор

### 1. Flutter ошибки
Все необработанные ошибки Flutter автоматически отправляются в Crashlytics.

### 2. Ошибки платформы
Ошибки на уровне платформы (iOS/Android) автоматически отправляются в Crashlytics.

### 3. BLoC ошибки
Ошибки в BLoC автоматически отправляются в Crashlytics через `AppBlocObserver`.

### 4. Сетевые ошибки
Ошибки в сетевых запросах автоматически отправляются в Crashlytics через `DioNetwork`.

## Ручное использование

### Получение сервиса
```dart
final crashlytics = sl<CrashlyticsService>();
```

### Запись ошибки
```dart
await crashlytics.recordError(
  exception,
  stackTrace,
  reason: 'Custom error description',
  fatal: false,
);
```

### Запись лога
```dart
await crashlytics.log('User performed important action');
```

### Установка пользователя
```dart
await crashlytics.setUserId('user123');
```

### Установка пользовательских ключей
```dart
await crashlytics.setCustomKey('subscription_type', 'premium');
await crashlytics.setCustomKey('user_level', 5);
```

## Примеры использования

### В BLoC
```dart
try {
  // Ваш код
} catch (error, stackTrace) {
  sl<CrashlyticsService>().recordError(
    error,
    stackTrace,
    reason: 'BLoC operation failed',
    fatal: false,
  );
  // Обработка ошибки
}
```

### В сервисе
```dart
try {
  // Ваш код
} catch (error, stackTrace) {
  await sl<CrashlyticsService>().recordError(
    error,
    stackTrace,
    reason: 'Service operation failed',
    fatal: false,
  );
  rethrow;
}
```

### Логирование пользовательских действий
```dart
// При входе пользователя
await sl<CrashlyticsService>().setUserId(user.id);
await sl<CrashlyticsService>().setCustomKey('subscription_type', user.subscriptionType);
await sl<CrashlyticsService>().log('User logged in');

// При важных действиях
await sl<CrashlyticsService>().log('User completed test with score: $score');
```

## Настройка

Crashlytics автоматически инициализируется в `initFirebaseInjections()` в файле `injections.dart`.

## Проверка работы

1. **В Firebase Console** перейдите в раздел Crashlytics
2. **Запустите приложение** и выполните действия, которые могут вызвать ошибки
3. **Проверьте отчеты** в Firebase Console (может потребоваться время для появления данных)

## Отладка

Для проверки работы Crashlytics в debug режиме:
```dart
// Принудительная ошибка для тестирования
throw Exception('Test crash for Crashlytics');
```

## Важные замечания

- **Не отправляйте чувствительные данные** в Crashlytics
- **Используйте осмысленные описания** для ошибок
- **Проверяйте работу** в production сборке
- **Мониторьте отчеты** регулярно в Firebase Console
