import 'package:flutter/material.dart';

class MyCircularButton extends StatefulWidget {
  //todo: Properties
  final Icon icon;
  final double padding;
  final Color iconColor;
  final Color borderColor;
  final Color backgroundColor;
  final Color splashColor;
  final Color shadowColor;
  final void Function()? onPressed;
  //todo: Constructor
  MyCircularButton({
    required this.icon,
    this.padding = 20,
    this.iconColor = Colors.white,
    this.borderColor = Colors.transparent,
    this.backgroundColor = Colors.blue,
    this.splashColor = Colors.lightBlueAccent,
    this.shadowColor = Colors.transparent,
    this.onPressed,
  });
  //todo: State
  @override
  MyCircularButtonState createState() => MyCircularButtonState();
}

class MyCircularButtonState extends State<MyCircularButton> {
  @override
  Widget build(BuildContext context) {
    // Return building Elevated button
    return ElevatedButton(
      onPressed: widget.onPressed,
      child: widget.icon, // ? Insert the button icon
      style: ButtonStyle(
        shadowColor: MaterialStateProperty.all(widget.shadowColor),
        shape: MaterialStateProperty.all(CircleBorder()),
        side: MaterialStateProperty.all<BorderSide>(
            BorderSide(color: widget.borderColor)),
        padding: MaterialStateProperty.all(EdgeInsets.all(widget.padding)),
        backgroundColor:
            MaterialStateProperty.all(widget.backgroundColor), // <-- Button color
        overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
          if (states.contains(MaterialState.pressed))
            return widget.splashColor; // <-- Splash color
        }),
      ),
    );
  }
}
