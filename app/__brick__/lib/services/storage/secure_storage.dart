abstract class SecureStorage {
  Future<void> init();

  Future<String?> getValue(String key);

  Future<void> setValue(String key, String value);

  Future<void> deleteValue(String key);

  Future<void> deleteAllValues();

  Future<void> saveJson(String key, Object data);
}
