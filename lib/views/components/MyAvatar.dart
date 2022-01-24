import 'package:flutter/material.dart';

class MyAvatar extends StatefulWidget {
  final double radius;

  const MyAvatar({
    Key? key,
    this.radius = 30,
  }) : super(key: key);

  @override
  MyAvatarState createState() => MyAvatarState();
}

class MyAvatarState extends State<MyAvatar> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: CircleAvatar(
        radius: widget.radius,
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        child: ClipOval(
          child: Image.asset(
            'assets/img/avatar/alex.jpg',
            width: widget.radius * 2,
            height: widget.radius * 2,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
