import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;

/// Заглушка для сборки до настройки Firebase.
/// Сгенерируй реальные опции: `flutterfire configure`.
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    throw UnsupportedError(
      'DefaultFirebaseOptions have not been configured. '
      'Run `flutterfire configure` or replace lib/firebase_options.dart.',
    );
  }
}
