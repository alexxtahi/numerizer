import 'package:flutter/material.dart';
import 'MyOutlinedButton.dart';

class MySearchBar extends StatefulWidget {
  //todo: Properties
  final String icon;
  final double iconSize;
  final double searchButtonSize;
  final Color searchButtonColor;
  final double width;
  final double height;
  final double borderRadius;
  final Color borderColor;
  final Color backgroundColor;
  //todo: Constructor
  MySearchBar({
    required this.icon,
    required this.iconSize,
    required this.searchButtonSize,
    this.searchButtonColor = const Color.fromRGBO(80, 190, 232, 1),
    required this.width,
    required this.height,
    required this.borderRadius,
    this.borderColor = Colors.transparent,
    required this.backgroundColor,
  });
  //todo: State
  @override
  MySearchBarState createState() => MySearchBarState();
}

class MySearchBarState extends State<MySearchBar> {
  @override
  Widget build(BuildContext context) {
    // Return building search bar
    return TextField(
      cursorColor: Theme.of(context).primaryColor,
      cursorRadius: Radius.circular(20),
      style: TextStyle(fontFamily: 'Montserrat'),
      decoration: InputDecoration(
        filled: true,
        fillColor: Theme.of(context).accentColor,
        hintText: 'Rechercher un document',
        hintStyle: TextStyle(fontFamily: 'Montserrat'),
        suffixIcon: Padding(
          padding: EdgeInsets.all(4),
          child: MyOutlinedButton(
            title: 'Search',
            icon: widget.icon,
            iconSize: widget.iconSize,
            size: widget.searchButtonSize,
            borderRadius: 10,
            borderColor: Colors.transparent,
            backgroundColor: widget.searchButtonColor,
          ),
        ),
        /*errorText: 'Aucun résultat',
        errorStyle: TextStyle(fontFamily: 'Montserrat'),*/
        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: widget.borderColor),
          borderRadius: BorderRadius.circular(20),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: widget.borderColor),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
