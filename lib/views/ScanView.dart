import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:numerizer/controllers/ScreenController.dart';
import 'package:numerizer/scanner_utils.dart';
import 'package:numerizer/views/layouts/CamErrorLayout.dart';
import 'package:numerizer/views/layouts/CamPreviewLayout.dart';
import 'package:path_provider/path_provider.dart';

class ScanView extends StatefulWidget {
  @override
  _ScanViewState createState() => _ScanViewState();
}

class _ScanViewState extends State<ScanView> {
  late CameraController camController;
  late Future<void> initializeControllerFuture;
  String detectedText = '';

  Future<void> initCam() async {
    this.camController = CameraController(
      await ScannerUtils.getCamera(),
      ResolutionPreset.high,
    );
    this.initializeControllerFuture = this.camController.initialize();
  }

  @override
  void initState() {
    super.initState();
    this.initCam();
  }

  @override
  void dispose() {
    super.dispose();
    this.camController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenController.actualView = "ScanView";
    // Change system UI properties
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
    return Scaffold(
      body: FutureBuilder<void>(
        future: this.initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            /*return GestureDetector(
              onTap: () => setState(() {
                print('camera reinit');
              }),
              child: CamErrorLayout(),
            );*/
            return CamPreviewLayout(camController: this.camController, detectedText: this.detectedText,);
          } else if (snapshot.hasError) {
            return GestureDetector(
              onTap: () => setState(() {
                print('camera reinit');
              }),
              child: CamErrorLayout()
            );
          }
          // Loading widget
          return Center(
            child: LoadingAnimationWidget.discreteCircle(
              color: Theme.of(context).hintColor,
              size: 150,
            ),
          );
        },
      ),
    );
  }

  /*void takePicture() async {
    Directory tempDir = await getTemporaryDirectory();
    bool dirExists = await tempDir.exists();
    String tempPath =
        tempDir.path + "/" + DateTime.now().millisecond.toString();
    await camController.initialize();
    await camController.takePicture(tempPath);

    setState(() {});

    final TextRecognizer textRecognizer =
        FirebaseVision.instance.textRecognizer();
    FirebaseVisionImage preProcessImage =
        new FirebaseVisionImage.fromFilePath(tempPath);

    VisionText textRecognized =
        await textRecognizer.processImage(preProcessImage);
    String text = textRecognized.text;
    setState(() {
      detectedText = text;
    });

    // Navigator.of(context).pop(print(text));
  }*/

}
