import 'package:flutter/material.dart';

class MyOutlinedButton extends StatefulWidget {
  final String icon;
  final double iconSize;
  final double size;
  final double borderRadius;
  final Color borderColor;
  MyOutlinedButton({
    required this.icon,
    required this.iconSize,
    required this.size,
    required this.borderRadius,
    required this.borderColor,
  });

  @override
  MyOutlinedButtonState createState() => MyOutlinedButtonState();
}

class MyOutlinedButtonState extends State<MyOutlinedButton> {
  @override
  Widget build(BuildContext context) {
    // Return building outlined button
    return OutlinedButton(
      onPressed: () {
        print("Settings button pressed !");
      },
      child: Image.asset(
        widget.icon,
        width: widget.iconSize,
        height: widget.iconSize,
      ),
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            EdgeInsets.symmetric(horizontal: 0, vertical: 0)),
        minimumSize: MaterialStateProperty.all<Size>(Size(20, 20)),
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
