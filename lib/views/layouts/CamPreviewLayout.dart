import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:numerizer/controllers/ScreenController.dart';

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

  @override
  void initState() {
    super.initState();
    this.detectedText = widget.detectedText;
  }

  @override
  Widget build(BuildContext context) {
    List<double> screenSize = ScreenController.getScreenSize(context);
    return Column(
      children: [
        Flexible(
          flex: 5,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              widget.camController == null
                  ? Container(
                      width: screenSize[0],
                      height: screenSize[1],
                      color: Colors.pink,
                    )
                  : Container(
                      padding: EdgeInsets.all(10),
                      height: MediaQuery.of(context).size.height,
                      child: CameraPreview(widget.camController),
                    ),
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
              children: [
                widget.detectedText == ''
                    ? Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          onPressed: () {
                            //takePicture();
                          },
                          icon: Icon(
                            Icons.camera,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                      )
                    : Column(
                        children: <Widget>[
                          FlatButton(
                              color: Colors.white,
                              onPressed: () {
                                setState(() {
                                  this.detectedText = '';
                                });
                              },
                              child: Text('TOMAR OTRA FOTO',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                  ))),
                        ],
                      )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
