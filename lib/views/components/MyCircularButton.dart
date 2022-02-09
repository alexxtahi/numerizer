import 'package:flutter/material.dart';

class MyCircularButton extends StatefulWidget {
  //todo: Properties
  final String tooltip;
  final Icon? icon;
  final double padding;
  final Color borderColor;
  final Color backgroundColor;
  final Color splashColor;
  final Color shadowColor;
  final void Function()? onPressed;
  //todo: Constructor
  MyCircularButton({
    this.tooltip = "",
    this.icon,
    this.padding = 20,
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
    return Tooltip(
      message: widget.tooltip,
      margin: EdgeInsets.only(bottom: 20),
      height: 50,
      textStyle: TextStyle(
        fontFamily: 'Montserrat',
        color: Colors.black,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white
      ),
      child: ElevatedButton(
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
      ),
    );
  }
}
