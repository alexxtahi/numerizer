import 'package:shared_preferences/shared_preferences.dart';

class PrefsController {
  static SharedPreferences prefs =
      SharedPreferences.getInstance() as SharedPreferences;
  //todo: Methods to init user preferences
  static initPrefs() async {
    PrefsController.prefs = await SharedPreferences.getInstance();
    // await prefs.setInt('counter', counter);
  }
}
