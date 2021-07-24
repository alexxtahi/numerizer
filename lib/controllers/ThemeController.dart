import 'package:flutter/material.dart';
import 'package:stacked_themes/stacked_themes.dart';

class ThemeController {
  static Brightness brightness = Brightness.light;
  static ThemeMode systemTheme = ThemeMode.system;

  //todo: Getter for the system theme
  static ThemeMode getSystemTheme() {
    ThemeController.systemTheme = ThemeMode.system;
    return systemTheme;
  }

  //todo: Theme changer
  static void changeTheme(BuildContext context, ThemeMode theme) {
    getThemeManager(context).setThemeMode(theme); // swith to theme selected
  }

  //todo: Theme switcher
  static void switchTheme(BuildContext context) {
    getThemeManager(context).toggleDarkLightTheme(); // switch to inverse theme
  }

  //todo: Getter for the themes
  static List<ThemeData> getThemes() {
    return [
      ThemeData(
        backgroundColor: Colors.blue,
        accentColor: Colors.yellow,
      ),
      ThemeData(
        backgroundColor: Colors.white,
        accentColor: Colors.green,
      ),
      ThemeData(
        backgroundColor: Colors.purple,
        accentColor: Colors.green,
      ),
      ThemeData(
        backgroundColor: Colors.black,
        accentColor: Colors.red,
      ),
      ThemeData(
        backgroundColor: Colors.red,
        accentColor: Colors.blue,
      ),
    ];
  }
}
