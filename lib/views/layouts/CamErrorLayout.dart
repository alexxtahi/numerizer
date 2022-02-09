import 'package:flutter/material.dart';
import 'package:numerizer/controllers/ScreenController.dart';
import 'package:numerizer/views/components/MyText.dart';

class CamErrorLayout extends StatefulWidget {
  const CamErrorLayout({Key? key}) : super(key: key);

  @override
  _CamErrorLayoutState createState() => _CamErrorLayoutState();
}

class _CamErrorLayoutState extends State<CamErrorLayout> {
  @override
  Widget build(BuildContext context) {
    List<double> screenSize = ScreenController.getScreenSize(context);
    return Container(
      width: screenSize[0],
      height: screenSize[1],
      decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            width: screenSize[0],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.donut_large_rounded,
                  size: 150,
                ),
                MyText(
                  text:
                      "La caméra n'a pas pu être initialisée. Touchez l'écran pour l'actualiser.",
                  color: Theme.of(context).hintColor,
                  fontSize: 18,
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: MyText(
                text: "Revenir",
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
