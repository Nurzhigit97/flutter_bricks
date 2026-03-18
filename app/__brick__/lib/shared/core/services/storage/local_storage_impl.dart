import 'local_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageImpl implements LocalStorage {
  const LocalStorageImpl(this._preferences);

  final SharedPreferences _preferences;

  @override
  bool getBool(String key) {
    return _preferences.getBool(key) ?? false;
  }

  @override
  Future<void> setBool(String key, bool value) async {
    _preferences.setBool(key, value);
  }

  @override
  String? getString(String key) {
    return _preferences.getString(key);
  }

  @override
  Future<void> setString(String key, String value) async {
    _preferences.setString(key, value);
  }

  @override
  int? getInt(String key) {
    return _preferences.getInt(key);
  }

  @override
  Future<void> setInt(String key, int value) async {
    _preferences.setInt(key, value);
  }

  @override
  Future<void> remove(String key) {
    return _preferences.remove(key);
  }

  @override
  Future<void> clear() async {
    await _preferences.clear();
  }
}
