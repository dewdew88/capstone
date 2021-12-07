import 'package:shared_preferences/shared_preferences.dart';

class PreferencesHelper {
  final Future<SharedPreferences> sharedPreferences;

  PreferencesHelper({required this.sharedPreferences});

  static const DARK_THEME = 'DARK_THEME';
  static const LIGHT_THEME = 'LIGHT_THEME';

  Future<bool> get isDarkTheme async{
    final prefs = await sharedPreferences;
    return prefs.getBool(DARK_THEME) ?? false;
  }

  void setDarkTheme(bool value) async {
    final prefs = await sharedPreferences;
    prefs.setBool(DARK_THEME, value);
  }

  Future<bool> get isLightTheme async{
    final prefs = await sharedPreferences;
    return prefs.getBool(LIGHT_THEME) ?? false;
  }

  void setLightTheme(bool value) async {
    final prefs = await sharedPreferences;
    prefs.setBool(LIGHT_THEME, value);
  }
}