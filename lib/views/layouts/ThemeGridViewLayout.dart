import 'package:flutter/material.dart';
import 'package:numerizer/controllers/ScreenController.dart';
import 'package:numerizer/controllers/ThemeController.dart';
import 'package:numerizer/views/components/MyOutlinedButton.dart';

class ThemeGridViewLayout extends StatefulWidget {
  final ScrollController gridViewScrollController;
  final EdgeInsets padding;
  final int elementsPerLine;
  final double crossAxisSpacing;
  final double mainAxisSpacing;
  final Axis scrollDirection;
  final double childAspectRatio;

  ThemeGridViewLayout({
    Key? key,
    required this.gridViewScrollController,
    required this.elementsPerLine,
    required this.childAspectRatio,
    this.crossAxisSpacing = 2,
    this.mainAxisSpacing = 2,
    this.scrollDirection = Axis.vertical,
    this.padding = const EdgeInsets.all(0),
  }) : super(key: key);

  @override
  ThemeGridViewLayoutState createState() => ThemeGridViewLayoutState();
}

class ThemeGridViewLayoutState extends State<ThemeGridViewLayout> {
  @override
  Widget build(BuildContext context) {
    List<double> screenSize = ScreenController.getScreenSize(context);
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: screenSize[0],
      ),
      child: GridView.count(
        controller: widget.gridViewScrollController,
        crossAxisCount: widget.elementsPerLine,
        crossAxisSpacing: widget.crossAxisSpacing,
        mainAxisSpacing: widget.mainAxisSpacing,
        childAspectRatio: widget.childAspectRatio,
        shrinkWrap: true,
        //physics:BouncingScrollPhysics(),
        padding: widget.padding,
        scrollDirection: widget.scrollDirection,
        children: [
          //todo: Dark theme button
          MyOutlinedButton(
            icon: 'assets/img/outlinedMoonIcon.png',
            size: 60,
            borderRadius: 20,
            borderColor: Theme.of(context).accentColor,
            iconColor: Theme.of(context).hintColor,
            onPressed: () {
              // Set Dark theme
              ThemeController.changeTheme(context, ThemeMode.dark);
            },
          ),
          //todo: Light theme button
          MyOutlinedButton(
            icon: 'assets/img/outlinedSunIcon.png',
            size: 60,
            borderRadius: 20,
            borderColor: Theme.of(context).accentColor,
            iconColor: Theme.of(context).hintColor,
            onPressed: () {
              // Set Light theme
              ThemeController.changeTheme(context, ThemeMode.light);
            },
          ),
        ],
      ),
    );
  }
}
