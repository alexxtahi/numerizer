import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'components/MyCategories.dart';
import 'components/MyHistoric.dart';
import 'components/MyFavs.dart';
import 'components/MySearchBar.dart';
import 'components/MyOutlinedButton.dart';
import '../controllers/ThemeController.dart';

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
        //statusBarBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
        //statusBarIconBrightness: Brightness.light,
        //systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
    // Return building scaffold
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          String theme = ThemeController.switchTheme(context);
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('appTheme', theme);
          print("Theme has been changed to $theme");
        },
        tooltip: 'Change theme',
        child: Icon(Icons.change_circle),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Column(
          children: <Widget>[
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
                            backgroundColor: Theme.of(context).accentColor,
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
                        borderColor: Theme.of(context).accentColor,
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 20)),
                  //todo: Search Bar
                  MySearchBar(
                    icon: 'assets/img/searchIcon.png',
                    iconSize: 30,
                    searchButtonSize: 30,
                    searchButtonColor: Theme.of(context).primaryColor,
                    width: 200,
                    height: 50,
                    borderRadius: 20,
                    backgroundColor: Theme.of(context).accentColor,
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 20)),
                  //todo: Favorites Box
                  MyFavs(
                    favlist: [
                      'fav1',
                      'fav2',
                      'fav3',
                      'fav4',
                      'fav5',
                      'fav6'
                    ], // ! debug
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 20)),
                  //todo: Categories Box
                  MyCategories(),
                  Padding(padding: EdgeInsets.only(bottom: 20)),
                  //todo: Historic Box
                  MyHistoric(
                    historiclist: [
                      'file1',
                      'file2',
                      'file3',
                      'file4'
                    ], // ! debug
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
