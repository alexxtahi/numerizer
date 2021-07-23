import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:numerizer/views/Home.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    //todo: implement initState
    Timer(
      Duration(seconds: 5),
      () {
        print('Showing home view !');
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeView()));
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
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
            'assets/img/Backgrounds/Light.png',
            fit: BoxFit.cover,
            width: screenWidth,
            height: screenHeight,
          ),
          //todo: Splash screen icon
          Image.asset(
            'assets/img/Logos/NumeriZerDarkIcon.png',
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
                      color: Color.fromRGBO(0, 0, 0, 0.5),
                    ),
                  ),
                  TextSpan(
                    text: 'Infinite',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w800,
                      fontStyle: FontStyle.normal,
                      color: Color.fromRGBO(0, 51, 102, 0.5),
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
}
