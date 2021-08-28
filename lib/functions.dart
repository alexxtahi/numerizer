import 'package:flutter/material.dart';
import 'package:numerizer/controllers/ScreenController.dart';

void openPage(BuildContext context, Widget view, {String mode = 'push'}) {
  String oldView = ScreenController.actualView;
  switch (mode) {
    case 'pushReplacement':
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (newViewContext) => view),
      );
      break;
    case 'push':
      Navigator.push(
        context,
        MaterialPageRoute(builder: (newViewContext) => view),
      );
      break;
    default:
      String newView = ScreenController.actualView;
      print('Old View: $oldView & NewView: $newView');
      break;
  }
}
