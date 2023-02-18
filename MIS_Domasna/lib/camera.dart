import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class Camera extends StatefulWidget {
  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  List<CameraDescription>? cameras; //list out the camera available
  CameraController? controller; //controller for camera
  XFile? image; //for caputred image

  @override
  void initState() {
    loadCamera();
    super.initState();
  }

  loadCamera() async {
    cameras = await availableCameras();
    if (cameras != null) {
      controller = CameraController(cameras![0], ResolutionPreset.max);

      controller!.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      });
    } else {
      print("No camera found");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Live Camera Preview"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
          child: Column(children: [
        Container(
            height: 300,
            width: 400,
            child: controller == null
                ? Center(child: Text("Loading Camera..."))
                : !controller!.value.isInitialized
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : CameraPreview(controller!)),
        Container(
          //show captured image
          padding: EdgeInsets.all(30),
          child: image == null
              ? Text("This is a funny guy")
              : Image.file(
                  File(image!.path),
                  height: 300,
                ),
        )
      ])),
    );
  }
}
