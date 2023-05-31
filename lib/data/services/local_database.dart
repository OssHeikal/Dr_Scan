import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class LocalDatabaseService {
  late SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> saveData<T>(String key, T data) async {
    final jsonData = json.encode(data);
    await _prefs.setString(key, jsonData);
  }

  Future<T?> loadData<T>(String key) async {
    final jsonData = _prefs.getString(key);
    if (jsonData != null) {
      return json.decode(jsonData) as T;
    }
    return null;
  }

  Future<void> deleteData(String key) async {
    await _prefs.remove(key);
  }
}
