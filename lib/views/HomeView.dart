import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:numerizer/controllers/ScreenController.dart';
import 'package:numerizer/functions.dart';
import 'package:numerizer/views/SettingsView.dart';
import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:numerizer/views/components/MyAvatar.dart';
import 'package:numerizer/views/components/MyCategories.dart';
import 'package:numerizer/views/components/MyCircularButton.dart';
import 'package:numerizer/views/components/MyHistoric.dart';
import 'package:numerizer/views/components/MyFavs.dart';
import 'package:numerizer/views/components/MyText.dart';
import 'package:numerizer/views/components/MySearchBar.dart';
import 'package:numerizer/views/components/MyOutlinedButton.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);
  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  // scrolling view controller
  ScrollController scrollController = ScrollController();
  // sliding up panel controller
  PanelController panelController = PanelController();
  @override
  Widget build(BuildContext context) {
    ScreenController.actualView = "HomeView";
    List<double> screenSize = ScreenController.getScreenSize(context);
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
      /*floatingActionButton: FloatingActionButton(
        onPressed: () async {
          /*//! Change theme method
          String theme = ThemeController.switchTheme(context);
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('appTheme', theme);
          print("Theme has been changed to $theme");
          */
        },
        tooltip: 'Scanner un document',
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.add_rounded, size: 35),
      ),*/
      backgroundColor: Theme.of(context).backgroundColor,
      body: SlidingUpPanel(
        controller: panelController,
        borderRadius: BorderRadius.circular(25),
        collapsed: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          width: screenSize[0],
          decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              //? Button to add a new document
              MyCircularButton(
                icon: Icon(
                  Icons.add_rounded,
                  color: Theme.of(context).backgroundColor.withOpacity(0.7), //Colors.white,
                  size: 35,
                ),
                onPressed: () {
                  print('Nouveau scan');
                },
                padding: 15,
                borderColor: Theme.of(context).primaryColor,
                backgroundColor: Theme.of(context).primaryColor,
              ),
              //? Button to see recent activities
              MyCircularButton(
                icon: Icon(
                  Icons.history_rounded,
                  color: Theme.of(context).backgroundColor.withOpacity(0.7), //Colors.white,
                  size: 35,
                ),
                onPressed: () {
                  print('Nouveau scan');
                },
                padding: 15,
                borderColor: Theme.of(context).indicatorColor,
                backgroundColor: Theme.of(context).indicatorColor,
                splashColor: Theme.of(context).indicatorColor,
              ),
              //? Button to open the trash
              MyCircularButton(
                icon: Icon(
                  Icons.delete_outline_rounded,
                  color: Theme.of(context).backgroundColor.withOpacity(0.7), //Colors.white,
                  size: 35,
                ),
                onPressed: () {
                  print('Nouveau scan');
                },
                padding: 15,
                borderColor: Theme.of(context).errorColor,
                backgroundColor: Theme.of(context).errorColor,
                splashColor: Theme.of(context).errorColor,
              ),
              //? Account profile button
              MyAvatar(),
            ],
          ),
        ),
        panel: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Center(
            child: MyText(
              text: 'Ceci est un widget',
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
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
                        //? Account profile button
                        MyAvatar(),
                        SizedBox(width: 10),
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
                      borderColor: Theme.of(context).secondaryHeaderColor,
                      hasIconColor: true,
                      iconColor: Theme.of(context).hintColor,
                      onPressed: () {
                        // ? Open the Settings view
                        openPage(context, SettingsView());
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20),
                //todo: Search Bar
                MySearchBar(
                  icon: 'assets/img/searchIcon.png',
                  iconSize: 30,
                  searchButtonSize: 30,
                  searchButtonColor: Theme.of(context).primaryColor,
                  width: 200,
                  height: 50,
                  borderRadius: 20,
                  backgroundColor: Theme.of(context).secondaryHeaderColor,
                ),
                SizedBox(height: 20),
                //todo: Scrolling View
                Expanded(
                  child: FadingEdgeScrollView.fromSingleChildScrollView(
                    gradientFractionOnStart: 0.05,
                    gradientFractionOnEnd: 0.05,
                    child: SingleChildScrollView(
                      controller: this.scrollController,
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
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
                          SizedBox(height: 20),
                          //todo: Categories Box
                          MyCategories(),
                          SizedBox(height: 20),
                          //todo: Historic Box
                          MyHistoric(
                            historiclist: [
                              'file1',
                              'file2',
                              'file3',
                              'file4',
                              'file5',
                              'file6',
                              'file7',
                              'file8',
                            ], // ! debug
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
