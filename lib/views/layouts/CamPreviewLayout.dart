import 'package:camera/camera.dart';
//import 'package:custom_image_picker/custom_image_picker.dart';
import 'package:flutter/material.dart';
import 'package:numerizer/controllers/ScreenController.dart';
//import 'package:numerizer/models/PhoneAlbum.dart';
import 'package:numerizer/scanner_utils.dart';
import 'package:numerizer/views/components/MyCamButton.dart';
import 'package:numerizer/views/components/MyCircularButton.dart';
import 'package:numerizer/views/components/MyPhotos.dart';

class CamPreviewLayout extends StatefulWidget {
  final CameraController camController;
  final String detectedText;
  CamPreviewLayout(
      {Key? key, required this.camController, this.detectedText = ''})
      : super(key: key);

  @override
  _CamPreviewLayoutState createState() => _CamPreviewLayoutState();
}

class _CamPreviewLayoutState extends State<CamPreviewLayout> {
  String detectedText = '';
  /*
  final customImagePicker = CustomImagePicker();
  List<PhoneAlbum> albums = [];
  List<PhonePhoto> imagesOfAlbum = [];

  void getAlbums() async {
    await customImagePicker.getAllImages(callback: (retrievedAlbums) {
      albums = retrievedAlbums;
    });
    print('albums:');
    print(albums);
  }

  void getPhotos(String albumID) async {
    await customImagePicker.getPhotosOfAlbum(
      albumID, // The id of the album you want to retrieve the images for
      callback: (images) {
        imagesOfAlbum.addAll(images);
      },
    );
  }
  */

  @override
  void initState() {
    super.initState();
    this.detectedText = widget.detectedText;
  }

  @override
  Widget build(BuildContext context) {
    List<double> screenSize = ScreenController.getScreenSize(context);
    return SafeArea(
      child: Column(
        children: [
          Flexible(
            flex: 5,
            child: Stack(
              fit: StackFit.expand,
              alignment: AlignmentDirectional.bottomCenter,
              children: <Widget>[
                //! Camera previewer
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: CameraPreview(widget.camController),
                  ),
                ),
                //! Recents photos
                Positioned(
                  bottom: 0,
                  child: MyPhotos(
                    photos: [for (int i = 0; i < 10; i++) 'zaza'],
                  ),
                ),
                // Show detected text
                if (widget.detectedText != '')
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.black.withAlpha(100),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Hemos encontrado este texto:',
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.w600)),
                        Text(widget.detectedText,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ))
                      ],
                    ),
                  ),
              ],
            ),
          ),
          // Bottom box
          Flexible(
            flex: 1,
            child: Container(
              width: ScreenController.getScreenSize(context)[0],
              decoration: BoxDecoration(
                color: Colors.white, // Theme.of(context).backgroundColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // Back button
                      MyCircularButton(
                        icon: Icon(
                          Icons.keyboard_arrow_left_rounded,
                          //color: Theme.of(context).errorColor,
                          color: Colors.black,
                        ),
                        padding: 10,
                        backgroundColor: Colors.blueGrey.withOpacity(0.1),
                        splashColor: Colors.blueGrey.withOpacity(0.5),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      // Take picture button
                      MyCamButton(
                        onPressed: () {

                          //getAlbums();
                        },
                      ),
                      // Flash button
                      MyCircularButton(
                        icon: Icon(
                          (ScannerUtils.isFlashOn == true)
                              ? Icons.flash_off_rounded
                              : Icons.flash_on_rounded,
                          //color: Theme.of(context).indicatorColor,
                          color: Colors.black,
                        ),
                        padding: 10,
                        backgroundColor: Colors.blueGrey.withOpacity(0.1),
                        splashColor: Colors.blueGrey.withOpacity(0.5),
                        onPressed: () {
                          setState(() {
                            ScannerUtils.flash();
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
