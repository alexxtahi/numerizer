import 'dart:io';

import 'package:path_provider/path_provider.dart';

class FileManager {
  // Create workspace DIR
  static void mkdir() async {
    final path = await localPath;
    new Directory('/storage/emulated/0/NumeriZer').create()
        // The created directory is returned as a Future.
        .then((Directory directory) {
      print('workspace DIR -> ${directory.path}');
    }).catchError((error) {
      print('failed to make workspade DIR -> $error');
    });
    // // check if directory exists
    // bool isDirExsits = await Directory(path + '/docs').exists();
    // if (isDirExsits) {
    //   print("The workspace directory already exists !");
    // } else {
    //   print("Workspace directory doesn't exists. Launch creation process");
    // new Directory('/storage/emulated/0/NumeriZer').create()
    //     // The created directory is returned as a Future.
    //     .then((Directory directory) {
    //   print('workspace DIR -> ${directory.path}');
    // }).catchError((error) {
    //   print('failed to make workspade DIR');
    // });
    // }
  }

  // Get document DIR
  static Future<String> get localPath async {
    final directory = await getApplicationDocumentsDirectory();

    print('Document DIR -> ${directory.path}');
    return directory.path;
  }

  // Create a file in the app dir
  static Future<File> get localFile async {
    final path = await localPath;
    return File('$path/counter.txt');
  }
}
