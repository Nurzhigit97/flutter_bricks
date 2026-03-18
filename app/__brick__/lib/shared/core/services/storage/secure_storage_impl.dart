import 'dart:convert';

import 'package:{{packageName}}/shared/utils/constants/app_const/app_const.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'local_storage.dart';
import 'secure_storage.dart';

class SecureStorageImpl implements SecureStorage {
  SecureStorageImpl({required this.localStorage});

  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  final LocalStorage localStorage;

  @override
  Future<void> init() async {
    if (localStorage.getBool(AppConst.isFirstLaunch)) {
      await deleteAllValues();
      await localStorage.remove(AppConst.isCompletedNewUser);
      localStorage.setBool(AppConst.isFirstLaunch, false);
    }
  }

  @override
  Future<String?> getValue(String key) async {
    return _storage.read(key: key);
  }

  @override
  Future<void> setValue(String key, String value) async {
    return _storage.write(key: key, value: value);
  }

  @override
  Future<void> deleteValue(String key) async {
    return _storage.delete(key: key);
  }

  @override
  Future<void> deleteAllValues() {
    return _storage.deleteAll();
  }

  @override
  Future<void> saveJson(String key, Object data) async {
    final value = jsonEncode(data);
    setValue(key, value);
  }
}
