import 'package:flutter/material.dart';
import 'package:numerizer/views/components/MyCircularButton.dart';

class MyCamButton extends StatefulWidget {
  const MyCamButton({Key? key}) : super(key: key);

  @override
  _MyCamButtonState createState() => _MyCamButtonState();
}

class _MyCamButtonState extends State<MyCamButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //takePicture();
      },
      child: Container(
        padding: EdgeInsets.all(5),
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          border: Border.all(
            width: 5,
          ),
          color: Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: MyCircularButton(
          padding: 10,
          backgroundColor: Colors.blueGrey.withOpacity(0.1),
          splashColor: Theme.of(context).errorColor,
          onPressed: () {
          },
        ),
      ),
    );
  }
}
