import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class Camera extends StatefulWidget {
  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  List<CameraDescription> cameras;

  // Select the front camera
  CameraController controller = CameraController(
    cameras.firstWhere((camera) => camera.lensDirection == CameraLensDirection.front),
    ResolutionPreset.high,
  );


  @override
  void initState() {
    super.initState();

    // Retrieve the available cameras
    availableCameras().then((value) => setState(() {
      cameras = value;
    }));

    // Initialize the camera controller
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});

      // Start the camera preview
      controller.startImageStream((image) {
        // process the camera image here
      });
    });
  }

  @override
  void dispose() {
    // Stop the camera preview and release resources
    controller?.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}