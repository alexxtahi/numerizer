import 'package:flutter/material.dart';
import 'package:numerizer/views/Home.dart';
import 'package:numerizer/views/SplashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NumeriZer',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      darkTheme: ThemeData(
        accentColor: Colors.black54,
      ),
      //home: HomeView(),
      home: SplashScreen(), // start with Splash screen
      debugShowCheckedModeBanner: false,
    );
  }
}
