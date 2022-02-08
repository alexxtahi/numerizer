import 'dart:io';
import 'package:permission_handler/permission_handler.dart';

class UserController {
  // Check if the user has acceptd permissions
  static Future<bool> hasAcceptedPermissions() async {
    bool isAccepted = false;
    // Check the platform before anything
    if (Platform.isAndroid) {
      // Request for multiple permissions at once
      Permission.accessMediaLocation.request().then((value) {
        print("Permission -> ${Permission.accessMediaLocation.status}");
        isAccepted = true;
      }).catchError((error) {
        print("Permission -> ${Permission.accessMediaLocation.status}");
        isAccepted = false;
      });
    } else {
      // not android
      isAccepted = false;
    }
    return isAccepted;
  }
}
