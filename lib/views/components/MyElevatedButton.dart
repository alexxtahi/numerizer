import 'package:flutter/material.dart';

class MyElevatedButton extends StatefulWidget {
  //todo: Properties
  final String title;
  final Widget child;
  final double? width;
  final double? height;
  final double borderRadius;
  final Color borderColor;
  final Color backgroundColor;
  final void Function()? onPressed;
  //todo: Constructor
  MyElevatedButton({
    this.title = 'button',
    required this.child,
    this.width,
    this.height,
    this.borderRadius = 15,
    this.borderColor = Colors.transparent,
    this.backgroundColor = Colors.transparent,
    this.onPressed,
  });
  //todo: State
  @override
  MyElevatedButtonState createState() => MyElevatedButtonState();
}

class MyElevatedButtonState extends State<MyElevatedButton> {
  @override
  Widget build(BuildContext context) {
    // Return building Elevated button
    return ElevatedButton(
      onPressed: widget.onPressed,
      child: widget.child, // ? Insert the child
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
        minimumSize: MaterialStateProperty.all<Size>(Size(20, 20)),
        backgroundColor:
            MaterialStateProperty.all<Color>(widget.backgroundColor),
        fixedSize: (widget.width != null)
            ? MaterialStateProperty.all<Size>(
                Size(
                  widget.width!.toDouble(),
                  widget.height!.toDouble(),
                ),
              )
            : null,
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
