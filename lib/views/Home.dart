import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'components/MyOutlinedButton.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Change system UI properties
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarColor: Colors.white,
        systemNavigationBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
    // Return building scaffold
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 50)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Color.fromRGBO(0, 0, 0, 0.5),
                    ),
                  ],
                ),
                //todo: Settings button
                MyOutlinedButton(
                  icon: 'assets/img/settingsIcon.png',
                  iconSize: 45,
                  size: 60,
                  borderRadius: 20,
                  borderColor: Color.fromRGBO(0, 0, 0, 0.5),
                ),
              ],
            ),
          ),
          Text(
            'You have pushed the button this many times:',
          ),
          Text(
            '$_counter',
            style: Theme.of(context).textTheme.headline4,
          ),
        ],
      ),
    );
  }
}
