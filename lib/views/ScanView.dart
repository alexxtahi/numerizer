import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:numerizer/controllers/ScreenController.dart';
import 'package:numerizer/scanner_utils.dart';
import 'package:numerizer/views/layouts/CamErrorLayout.dart';
import 'package:numerizer/views/layouts/CamPreviewLayout.dart';

class ScanView extends StatefulWidget {
  @override
  _ScanViewState createState() => _ScanViewState();
}

class _ScanViewState extends State<ScanView> {
  String detectedText = '';

  /*
  @override
  void initState() {
    super.initState();
    //this.initCam();
    // Inint camera controller
    availableCameras().then((availableCameras) {
      print('Camerasss -> ready');
      final cameras = availableCameras;
      ScannerUtils.camController = CameraController(
        cameras.first,
        ResolutionPreset.high,
      );
      print('Camerasss -> ${ScannerUtils.camController.cameraId}');
    }).catchError((error) {
      print('Cam Error -> $error');
    });
  }
  */

  @override
  void dispose() {
    super.dispose();
    //ScannerUtils.camController.dispose();
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
        future: ScannerUtils.camController.initialize(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            try {
              print('cameraId -> ${ScannerUtils.camController.cameraId}');
              return CamPreviewLayout(
                camController: ScannerUtils.camController,
                detectedText: this.detectedText,
              );
            } catch (error) {
              return GestureDetector(
                onTap: () => setState(() {
                  print('camera reinit');
                }),
                child: CamErrorLayout(),
              );
            }
          } else if (snapshot.hasError) {
            return GestureDetector(
              onTap: () => setState(() {
                print('camera reinit');
              }),
              child: CamErrorLayout(),
            );
          }
          // Loading widget
          return Center(
            child: LoadingAnimationWidget.beat(
              color: Theme.of(context).hintColor,
              size: 70,
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
