import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/firebase/firebase.dart';
import '../settings.dart';

class ThemeBloc extends ChangeNotifier {
  late ThemeMode mode;
  ThemeBloc({
    required this.mode,
  });

  bool isDark() {
    if (mode == ThemeMode.system) {
      var brightness = SchedulerBinding.instance.window.platformBrightness;
      bool isDarkMode = brightness == Brightness.dark;
      return isDarkMode;
    }
    return mode == ThemeMode.dark;
  }

  bool isLight() {
    if (mode == ThemeMode.system) {
      var brightness = SchedulerBinding.instance.window.platformBrightness;
      bool isLightMode = brightness == Brightness.light;
      return isLightMode;
    }
    return mode == ThemeMode.light;
  }

  void switchThemeMode(String themeMode) {
    mode = themeMode == 'dark'
        ? ThemeMode.dark
        : themeMode == 'light'
            ? ThemeMode.light
            : ThemeMode.system;
    notifyListeners();
  }

  saveThemeMode(String mode) async {
    final prefs = await SharedPreferences.getInstance();
    final value = RemoteConfigCustom().getValueOrDefault(
      key: 'themeLocalName',
      defaultValue: Settings.themeLocalName,
    );
    await prefs.setString(value, mode);
  }
}
