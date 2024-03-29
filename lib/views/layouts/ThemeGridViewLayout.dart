import 'package:flutter/material.dart';
import 'package:numerizer/controllers/ScreenController.dart';
import 'package:numerizer/controllers/ThemeController.dart';
import 'package:numerizer/views/components/MyOutlinedButton.dart';
import 'package:stacked_themes/stacked_themes.dart';

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
    this.childAspectRatio = 1,
    this.crossAxisSpacing = 2,
    this.mainAxisSpacing = 2,
    this.scrollDirection = Axis.vertical,
    this.padding = const EdgeInsets.all(0),
  }) : super(key: key);

  @override
  ThemeGridViewLayoutState createState() => ThemeGridViewLayoutState();
}

class ThemeGridViewLayoutState extends State<ThemeGridViewLayout> {
  bool isDarkMode = false;
  @override
  void initState() {
    super.initState();
    isDarkMode = (getThemeManager(context).selectedThemeMode == ThemeMode.dark)
      ? true : false ;
  }

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
            icon: isDarkMode
                ? 'assets/img/moonIcon.png'
                : 'assets/img/outlinedMoonIcon.png',
            size: 60,
            borderRadius: 20,
            borderColor: Theme.of(context).hintColor.withOpacity(0.15),
            hasIconColor: !isDarkMode,
            iconColor: Theme.of(context).hintColor,
            onPressed: () {
              // Set Dark theme
              ThemeController.changeTheme(context, ThemeMode.dark);
              setState(() => isDarkMode = true);
            },
          ),
          //todo: Light theme button
          MyOutlinedButton(
            icon: isDarkMode
                ? 'assets/img/outlinedSunIcon.png'
                : 'assets/img/sunIcon.png',
            size: 60,
            borderRadius: 20,
            borderColor: Theme.of(context).hintColor.withOpacity(0.15),
            hasIconColor: isDarkMode,
            iconColor: Theme.of(context).hintColor,
            onPressed: () {
              // Set Light theme
              ThemeController.changeTheme(context, ThemeMode.light);
              setState(() => isDarkMode = false);
            },
          ),
          /*
          //todo: Names
          Column(
            children: [
              MyText(
                text: 'Sombre',
                color: Theme.of(context).hintColor,
              ),
            ],
          ),
          Column(
            children: [
              MyText(
                text: 'Clair',
                color: Theme.of(context).hintColor,
              ),
            ],
          )
          */
        ],
      ),
    );
  }
}
