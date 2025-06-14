import 'package:hive_flutter/hive_flutter.dart';

//thanku helper
class HiveHelper {
  static const String _boxName = 'appBox';
  static const String _usernameKey = 'username';
  static const String _hasLoggedInKey = 'has_logged_in';
  static const String _hasSeenSplashKey = 'has_seen_splash';

  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox(_boxName);
  }

  static Future<void> saveUsername(String username) async {
    final box = Hive.box(_boxName);
    await box.put(_usernameKey, username);
    await setHasLoggedIn(true);
  }

  static String? getUsername() {
    final box = Hive.box(_boxName);
    return box.get(_usernameKey);
  }

  static Future<void> setHasLoggedIn(bool value) async {
    final box = Hive.box(_boxName);
    await box.put(_hasLoggedInKey, value);
  }

  static bool hasLoggedIn() {
    final box = Hive.box(_boxName);
    return box.get(_hasLoggedInKey, defaultValue: false);
  }

  static Future<void> setHasSeenSplash(bool value) async {
    final box = Hive.box(_boxName);
    await box.put(_hasSeenSplashKey, value);
  }

  static bool hasSeenSplash() {
    final box = Hive.box(_boxName);
    return box.get(_hasSeenSplashKey, defaultValue: false);
  }
}
