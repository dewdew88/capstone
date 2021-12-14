import 'package:capstone/common/styles.dart';
import 'package:capstone/data/preferences/preferences_helper.dart';
import 'package:flutter/material.dart';

class PreferencesProvider extends ChangeNotifier {
  PreferencesHelper preferencesHelper;

  PreferencesProvider({required this.preferencesHelper}) {
    _getTheme();
    _getLightThemePreferences();
  }

  bool _isDarkTheme = false;
  bool get isDarkTheme => _isDarkTheme;

  bool _isLightTheme = false;
  bool get isLightTheme => _isLightTheme;

  ThemeData get themeData => _isDarkTheme ? darkTheme : lightTheme;

  void _getTheme() async {
    _isDarkTheme = await preferencesHelper.isDarkTheme;
    notifyListeners();
  }

  void _getLightThemePreferences() async {
    _isLightTheme = await preferencesHelper.isLightTheme;
    notifyListeners();
  }

  void enableDarkTheme(bool value) {
    preferencesHelper.setDarkTheme(value);
    _getTheme();
  }

  void enableLightTheme(bool value) {
    preferencesHelper.setLightTheme(value);
    _getLightThemePreferences();
  }
}
