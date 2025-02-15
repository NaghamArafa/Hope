import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  static const String themeKey = "theme";

  ThemeProvider() {
    _loadTheme(); // تحميل السمة عند بدء التطبيق
  }

  ThemeMode get themeMode => _themeMode;

  bool isDark() {
    if (_themeMode == ThemeMode.system) {
      final brightness =
          WidgetsBinding.instance.platformDispatcher.platformBrightness;
      return brightness == Brightness.dark;
    }
    return _themeMode == ThemeMode.dark;
  }

  void changeTheme(ThemeMode newTheme) {
    _themeMode = newTheme;
    _saveTheme(newTheme);
    notifyListeners();
  }

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final savedTheme = prefs.getString(themeKey);

    if (savedTheme == null) {
      _themeMode = ThemeMode.system; // افتراضيًا استخدم سمة النظام
    } else {
      switch (savedTheme) {
        case 'dark':
          _themeMode = ThemeMode.dark;
          break;
        case 'light':
          _themeMode = ThemeMode.light;
          break;
        default:
          _themeMode = ThemeMode.system;
      }
    }
    notifyListeners();
  }

  Future<void> _saveTheme(ThemeMode newTheme) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(themeKey, newTheme.toString().split('.').last);
  }
}
