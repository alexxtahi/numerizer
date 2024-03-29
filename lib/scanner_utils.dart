import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ScannerUtils {
  static late CameraDescription firstCam;
  static late List<CameraDescription> cameras;
  static late CameraController camController;
  static bool isFlashOn = false;

  static getCamera() async {
    // Ensure that plugin services are initialized so that `availableCameras()`
    // can be called before `runApp()`
    WidgetsFlutterBinding.ensureInitialized();
    // Obtain a list of the available cameras on the device.
    cameras = await availableCameras();
    // Get a specific camera from the list of available cameras.
    firstCam = cameras.first;
    print('[INFO] available cameras -> $cameras');
    // Initialize the camera controller
    camController = CameraController(
      firstCam,
      ResolutionPreset.high,
    );
    camController.initialize();
  }

  static void flash() {
    if (isFlashOn)
      camController.setFlashMode(FlashMode.off);
    else
      camController.setFlashMode(FlashMode.torch);
    // set new torch state
    isFlashOn = !isFlashOn;
  }

  /*

  static Future<dynamic> detect({
    required CameraImage image,
    required Future<dynamic> Function(FirebaseVisionImage image) detectInImage,
    required int imageRotation,
  }) async {
    return detectInImage(
      FirebaseVisionImage.fromBytes(
        _concatenatePlanes(image.planes),
        _buildMetaData(image, _rotationIntToImageRotation(imageRotation)),
      ),
    );
  }

  static Uint8List _concatenatePlanes(List<Plane> planes) {
    final WriteBuffer allBytes = WriteBuffer();
    for (Plane plane in planes) {
      allBytes.putUint8List(plane.bytes);
    }
    return allBytes.done().buffer.asUint8List();
  }

  static FirebaseVisionImageMetadata _buildMetaData(
    CameraImage image,
    ImageRotation rotation,
  ) {
    return FirebaseVisionImageMetadata(
      rawFormat: image.format.raw,
      size: Size(image.width.toDouble(), image.height.toDouble()),
      rotation: rotation,
      planeData: image.planes.map(
        (Plane plane) {
          return FirebaseVisionImagePlaneMetadata(
            bytesPerRow: plane.bytesPerRow,
            height: plane.height,
            width: plane.width,
          );
        },
      ).toList(),
    );
  }

  static ImageRotation _rotationIntToImageRotation(int rotation) {
    switch (rotation) {
      case 0:
        return ImageRotation.rotation0;
      case 90:
        return ImageRotation.rotation90;
      case 180:
        return ImageRotation.rotation180;
      default:
        assert(rotation == 270);
        return ImageRotation.rotation270;
    }
  }
  */
}
