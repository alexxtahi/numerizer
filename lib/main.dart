import 'package:flutter/material.dart';
import 'package:numerizer/views/SplashScreen.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'controllers/ThemeController.dart';

Future main() async {
  await ThemeManager.initialise();
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  String recentTheme = 'Light';
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    getRecentTheme(); // get the last theme selected by the user
    return ThemeBuilder(
      defaultThemeMode: (this.recentTheme == 'Dark')
          ? ThemeMode.dark
          : ThemeMode.light, // apply recent theme
      //defaultThemeMode: ThemeMode.dark,
      //todo: Light Theme
      lightTheme: ThemeData(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        primaryColor: Color.fromRGBO(80, 190, 232, 1),
        secondaryHeaderColor: Color.fromRGBO(150, 150, 150, 1),
        shadowColor: Color.fromRGBO(0, 0, 0, 0.5),
        hintColor: Colors.black,
        errorColor: Colors.red[900],
        indicatorColor: Colors.yellow[900],
      ),
      //todo: Dark Theme
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        backgroundColor: Colors.black,
        primaryColor: Color.fromRGBO(10, 110, 142, 1),
        secondaryHeaderColor: Color.fromRGBO(50, 50, 50, 1),
        shadowColor: Color.fromRGBO(255, 255, 255, 0.5),
        hintColor: Colors.white,
        errorColor: Colors.red[900],
        indicatorColor: Colors.yellow[900],
      ),
      //themes: themeChanger.getThemes(),
      //todo: Builder of the theme
      builder: (context, regularTheme, darkTheme, themeMode) => MaterialApp(
        title: 'Numerizer',
        theme: regularTheme,
        darkTheme: darkTheme,
        themeMode: themeMode,
        //home: HomeView(),
        home: SplashScreen(), // start with Splash screen
        debugShowCheckedModeBanner: false,
      ),
    );
  }

  //todo: Getter to the recent theme
  void getRecentTheme() async {
    this.recentTheme = (await ThemeController.getRecentTheme())!;
  }
}
