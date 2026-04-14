abstract class LocalStorage {
  bool getBool(String key);

  Future<void> setBool(String key, bool value);

  String? getString(String key);

  Future<void> setString(String key, String value);

  int? getInt(String key);

  Future<void> setInt(String key, int value);

  Future<void> remove(String key);

  Future<void> clear();
}
