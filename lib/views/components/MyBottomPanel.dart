import 'package:flutter/material.dart';
import 'package:numerizer/controllers/FileManager.dart';
import 'package:numerizer/controllers/ScreenController.dart';
import 'package:numerizer/controllers/UserController.dart';
import 'package:numerizer/functions.dart';
import 'package:numerizer/views/ScanView.dart';
import 'package:numerizer/views/components/MyAvatar.dart';
import 'package:numerizer/views/components/MyCircularButton.dart';
import 'package:numerizer/views/components/MyText.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class MyBottomPanel extends StatefulWidget {
  final Widget body;

  const MyBottomPanel({
    Key? key,
    required this.body,
  }) : super(key: key);

  @override
  MyBottomPanelState createState() => MyBottomPanelState();
}

class MyBottomPanelState extends State<MyBottomPanel> {
  // sliding up panel controller
  PanelController panelController = PanelController();
  @override
  Widget build(BuildContext context) {
    List<double> screenSize = ScreenController.getScreenSize(context);
    return SlidingUpPanel(
      boxShadow: const <BoxShadow>[
        BoxShadow(
          blurRadius: 8.0,
          color: Color.fromRGBO(0, 0, 0, 0.2),
        ),
      ],
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
              tooltip: "Nouveau scan",
              icon: Icon(
                Icons.add_rounded,
                color: Theme.of(context)
                    .backgroundColor
                    .withOpacity(0.7), //Colors.white,
                size: 35,
              ),
              onPressed: () async {
                print('Nouveau scan');
                //openPage(context, ScanView());
                final path = await FileManager.localPath;
                //FileManager.mkdir();
                UserController.hasAcceptedPermissions();
              },
              padding: 15,
              borderColor: Theme.of(context).primaryColor,
              backgroundColor: Theme.of(context).primaryColor,
            ),
            //? Button to see recent activities
            MyCircularButton(
              tooltip: "Scans récents",
              icon: Icon(
                Icons.history_rounded,
                color: Theme.of(context)
                    .backgroundColor
                    .withOpacity(0.7), //Colors.white,
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
              tooltip: "Corbeille",
              icon: Icon(
                Icons.delete_outline_rounded,
                color: Theme.of(context)
                    .backgroundColor
                    .withOpacity(0.7), //Colors.white,
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
            color: Theme.of(context).hintColor,
          ),
        ),
      ),
      body: widget.body,
    );
  }
}
