import 'package:flutter/material.dart';

class MyOutlinedButton extends StatefulWidget {
  //todo: Properties
  final String title;
  final double size;
  final icon;
  final double iconSize;
  final Color iconColor;
  final double borderRadius;
  final Color borderColor;
  final Color backgroundColor;
  final void Function()? onPressed;
  //todo: Constructor
  MyOutlinedButton({
    this.title = 'button',
    required this.icon,
    this.iconSize = 45,
    required this.size,
    required this.borderRadius,
    required this.borderColor,
    required this.iconColor,
    this.backgroundColor = Colors.transparent,
    this.onPressed,
  });
  //todo: State
  @override
  MyOutlinedButtonState createState() => MyOutlinedButtonState();
}

class MyOutlinedButtonState extends State<MyOutlinedButton> {
  @override
  Widget build(BuildContext context) {
    // Return building outlined button
    return OutlinedButton(
      onPressed: widget.onPressed,
      child: (widget.icon is String)
          ? Image.asset(
              widget.icon, // ? Insert image path
              width: widget.iconSize,
              height: widget.iconSize,
              color: widget.iconColor,
            )
          : widget.icon, // ? Insert the Icon widget
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            EdgeInsets.symmetric(horizontal: 0, vertical: 0)),
        minimumSize: MaterialStateProperty.all<Size>(Size(20, 20)),
        backgroundColor:
            MaterialStateProperty.all<Color>(widget.backgroundColor),
        fixedSize:
            MaterialStateProperty.all<Size>(Size(widget.size, widget.size)),
        side: MaterialStateProperty.all<BorderSide>(
            BorderSide(color: widget.borderColor)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
        ),
      ),
    );
  }
}
