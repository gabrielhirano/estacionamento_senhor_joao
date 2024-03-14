import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

abstract class IAppPreferences {
  Future get(String? key);
  Future<List<String>> getList(String key);
  Future setList(String key, List<String> list);
  Future post(String key, String value);
  Future put(String key, String value);
  Future delete(String key);
}

class AppPreferences implements IAppPreferences {
  final SharedPreferences preferences;

  AppPreferences(this.preferences);

  @override
  Future<List<String>> getList(String key) async =>
      preferences.getStringList(key) ?? List<String>.empty();

  @override
  Future setList(String key, List<String> list) {
    return preferences.setStringList(key, list);
  }

  @override
  Future get(String? key) async {
    if (key != null) return [jsonDecode(preferences.get(key).toString())];

    var listObjects = preferences.getKeys();
    listObjects.removeWhere((element) => element.contains('KEY'));

    var listJson = [];

    for (var objectName in listObjects) {
      listJson.add(jsonDecode(preferences.getString(objectName)!));
    }

    return listJson;
  }

  @override
  Future post(String key, String value) => preferences.setString(key, value);

  @override
  Future put(String key, String value) => preferences.setString(key, value);

  @override
  Future delete(String key) => preferences.remove(key);
}
