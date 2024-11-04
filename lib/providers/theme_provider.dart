import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isLightTheme = true;

  bool get isLightTheme => _isLightTheme;

  ThemeMode get currentTheme =>
      _isLightTheme ? ThemeMode.light : ThemeMode.dark;

  void toggleTheme() {
    _isLightTheme = !_isLightTheme;
    notifyListeners();
  }
}
