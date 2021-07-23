import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:numerizer/views/components/MyCategories.dart';
import 'components/MyFavs.dart';
import 'components/MySearchBar.dart';
import 'components/MyOutlinedButton.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);
  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  // textfield controller
  @override
  Widget build(BuildContext context) {
    // Change system UI properties
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //todo: Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //todo: User infos
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
                      title: 'Settings',
                      icon: 'assets/img/settingsIcon.png',
                      iconSize: 45,
                      size: 60,
                      borderRadius: 20,
                      borderColor: Color.fromRGBO(0, 0, 0, 0.5),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 20)),
                //todo: Search Bar
                MySearchBar(
                  icon: 'assets/img/searchIcon.png',
                  iconSize: 30,
                  searchButtonSize: 30,
                  width: 200,
                  height: 50,
                  borderRadius: 20,
                  borderColor: Colors.red,
                  backgroundColor: Color.fromRGBO(0, 0, 0, 1),
                ),
                Padding(padding: EdgeInsets.only(bottom: 20)),
                //todo: Favorites Box
                MyFavs(
                  title: 'Favoris',
                  favlist: ['fav1', 'fav2', 'fav3', 'fav4', 'fav5', 'fav6'],
                ),
                Padding(padding: EdgeInsets.only(bottom: 20)),
                //todo: Categories Box
                MyCategories(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
