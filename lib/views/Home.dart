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
                    Padding(padding: EdgeInsets.only(right: 10)),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Bonjour Alexandre.',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Text(
                          'Ravi de vous revoir !',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            //fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
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
        ],
      ),
    );
  }
}
