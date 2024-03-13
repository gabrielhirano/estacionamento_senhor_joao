import 'package:shared_preferences/shared_preferences.dart';

abstract class IAppPreferences {
  Future get(String key);
  Future post(String key, String value);
  Future put(String key, String value);
  Future delete(String key);
}

class AppPreferences implements IAppPreferences {
  final SharedPreferences preferences;

  AppPreferences(this.preferences);

  @override
  Future get(String key) async => preferences.getKeys().map((objectName) => preferences.getString(objectName)).toList();

  @override
  Future post(String key, String value) => preferences.setString(key, value);

  @override
  Future put(String key, String value) => preferences.setString(key, value);

  @override
  Future delete(String key) => preferences.remove(key);
}
