import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:numerizer/controllers/ScreenController.dart';
import 'package:numerizer/views/components/MyElevatedButton.dart';
import 'package:numerizer/views/components/MyOutlinedButton.dart';
import 'package:numerizer/views/components/MyText.dart';
import 'package:numerizer/views/layouts/ThemeGridViewLayout.dart';

class SettingsView extends StatefulWidget {
  SettingsView({Key? key}) : super(key: key);
  @override
  SettingsViewState createState() => SettingsViewState();
}

class SettingsViewState extends State<SettingsView> {
  // scrolling view controller
  ScrollController scrollController = ScrollController();
  ScrollController gridViewScrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    ScreenController.actualView = "SettingsView";
    final screenSize = [MediaQuery.of(context).size.width, MediaQuery.of(context).size.height
    ];
    //final double screenHeight = MediaQuery.of(context).size.height;
    // Change system UI properties
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        //statusBarBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.white,
        //statusBarIconBrightness: Brightness.dark,
        //systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
    // Return building scaffold
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //todo: Header
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //todo: Back button
                  MyOutlinedButton(
                    title: 'Settings',
                    size: 60,
                    borderRadius: 20,
                    borderColor: Theme.of(context).accentColor,
                    iconColor: Theme.of(context).hintColor,
                    icon: Icon(
                      Icons.keyboard_arrow_left_rounded,
                      color: Theme.of(context).hintColor,
                      size: 60,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(width: 15),
                  //todo: Title
                  MyText(
                    text: 'Paramètres',
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Theme.of(context).hintColor,
                  ),
                ],
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
                        //todo: Theme text
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MyText(
                              text: 'Thème',
                              fontWeight: FontWeight.bold,
                              textAlign: TextAlign.center,
                              color: Theme.of(context).hintColor,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        //todo: Theme Grid
                        ThemeGridViewLayout(
                          gridViewScrollController:
                              this.gridViewScrollController,
                          elementsPerLine: 2,
                          childAspectRatio: 1.25,
                          crossAxisSpacing: 10,
                        ),
                        SizedBox(height: 25),
                        //todo: Divider
                        Container(
                          width: 100,
                          height: 10,
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).shadowColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        SizedBox(height: 25),
                        //todo: Doc button
                        MyElevatedButton(
                          width: screenSize[0],
                          onPressed: () {},
                          child: MyText(
                            text: 'Documents',
                          ),
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
    );
  }
}
