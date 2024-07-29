import 'package:salefny/app/core/data/locale/pref.dart';

bool get isUserLoggedIn => SharedPrefs.instance.getString('token') != null;

class UserPrefs {
  static final prefs = SharedPrefs.instance;

  static Future<void> setUserToken(String token) =>
      prefs.setString('token', token);

  static String getUserToken() => prefs.getString('token') ?? '';

  static bool get isUserLoggedIn => prefs.getString('token') != null;

  static Future<void> setUserName(String name) => prefs.setString('name', name);

  static String getUserName() => prefs.getString('name') ?? '';

  static Future<void> setServerUrl(String url) =>
      prefs.setString('serverUrl', url);

  static String getServerUrl() =>
      '${prefs.getString('serverUrl') ?? ''}/api/employee-app';

  static Future<void> deleteUser() async {
    await prefs.remove('token');
    await prefs.remove('name');
    await prefs.remove('serverUrl');
  }
}
