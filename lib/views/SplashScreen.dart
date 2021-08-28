import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:numerizer/views/HomeView.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked_themes/stacked_themes.dart';
import '../controllers/ScreenController.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  String backgroundUri = 'assets/img/Backgrounds/Dark.png';
  String iconUri = 'assets/img/Logos/NumeriZerLightIcon.png';

  @override
  void initState() {
    //todo: Start timer
    Timer(
      Duration(seconds: 5),
      () {
        print('Showing home view !');
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeView()),
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<double> screenSize = ScreenController.getScreenSize(context);
    //todo: Load icon and background function of the recent app theme
    setSplashScreenElements();
    // Change system UI properties
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
    // Return building scaffold
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
        children: [
          //todo: Splash screen background
          Image.asset(
            //'assets/img/Backgrounds/Light.png',
            this.backgroundUri,
            fit: BoxFit.cover,
            width: screenSize[0],
            height: screenSize[1],
          ),
          //todo: Splash screen icon
          Image.asset(
            this.iconUri,
            //'assets/img/Logos/NumeriZerDarkIcon.png',
          ),
          //todo: Signature
          Positioned(
            bottom: 10,
            child: RichText(
              text: TextSpan(
                style: TextStyle(fontSize: 16),
                children: [
                  TextSpan(
                    text: 'Développé par ',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w800,
                      color: Theme.of(context).shadowColor,
                    ),
                  ),
                  TextSpan(
                    text: 'Infinite',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w800,
                      fontStyle: FontStyle.normal,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  //todo: function to get the recenty app theme set by the user
  void setSplashScreenElements() async {
    /*
    * This function set the splash screen background
    * Function of the recent app theme
    */
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      this.backgroundUri = 'assets/img/Backgrounds/Dark.png';
      this.iconUri = 'assets/img/Logos/NumeriZerLightIcon.png';
      // ? apply default theme
      getThemeManager(context).setThemeMode(ThemeMode.dark);
      // ? Key verification
      if (prefs.containsKey('appTheme')) {
        print("Getting recent theme of the app");
        String? appTheme = prefs.getString('appTheme');
        // ? Recent theme verification
        if (appTheme == 'Dark') {
          this.backgroundUri = 'assets/img/Backgrounds/Dark.png';
          this.iconUri = 'assets/img/Logos/NumeriZerLightIcon.png';
          // ? apply the recent theme
          getThemeManager(context).setThemeMode(ThemeMode.dark);
        } else {
          this.backgroundUri = 'assets/img/Backgrounds/Light.png';
          this.iconUri = 'assets/img/Logos/NumeriZerDarkIcon.png';
          // ? apply the recent theme
          getThemeManager(context).setThemeMode(ThemeMode.light);
        }
      } else {
        print(
            'Loading of the default theme because nothing theme has been set by the user');
      }
    });
  }
}
