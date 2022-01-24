import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
    // ? Change the status bar color and brightness function of the theme selected
    if (theme == ThemeMode.dark) {
      // Change status bar theme to adapt it with the dark theme
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarIconBrightness: Brightness.light,
        ),
      );
    } else {
      // Change status bar theme to adapt it with the dark theme
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
      );
    }
  }

  //todo: Theme switcher
  static String switchTheme(BuildContext context) {
    getThemeManager(context).toggleDarkLightTheme(); // switch to inverse theme
    // ? get the new theme mode selected
    ThemeMode? selectedThemeMode = getThemeManager(context).selectedThemeMode;
    if (selectedThemeMode == ThemeMode.dark) {
      // ? Change status bar theme
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarIconBrightness: Brightness.light,
        ),
      );
      return 'Dark';
    } else {
      // ? Change status bar theme
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
      );
      return 'Light';
    }
  }

  //todo: function to get the recenty app theme set by the user
  static Future<String?> getRecentTheme() async {
    /*
    * This function is used to get and apply the recent app theme
    */
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('appTheme')) {
      String? appTheme = prefs.getString('appTheme');
      return appTheme;
    } else {
      return 'Light';
    }
  }

  //todo: Getter for the themes
  static List<ThemeData> getThemes() {
    return [
      ThemeData(
        backgroundColor: Colors.blue,
        secondaryHeaderColor: Colors.yellow,
      ),
      ThemeData(
        backgroundColor: Colors.white,
        secondaryHeaderColor: Colors.green,
      ),
      ThemeData(
        backgroundColor: Colors.purple,
        secondaryHeaderColor: Colors.green,
      ),
      ThemeData(
        backgroundColor: Colors.black,
        secondaryHeaderColor: Colors.red,
      ),
      ThemeData(
        backgroundColor: Colors.red,
        secondaryHeaderColor: Colors.blue,
      ),
    ];
  }
}
