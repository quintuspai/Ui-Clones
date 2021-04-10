import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class CameraPage extends StatefulWidget{
  final CameraDescription camera;
  CameraPage(this.camera);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
   return  _CameraPageState();
  }
}

class _CameraPageState extends State<CameraPage> {
  CameraController _cameraController;
  Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _cameraController =
        CameraController(widget.camera, ResolutionPreset.medium);
    _initializeControllerFuture = _cameraController.initialize();
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FutureBuilder(
        future: _initializeControllerFuture,
        builder: (context ,snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(_cameraController);
          }  else {
            return Center(child: CircularProgressIndicator(),);
          }
        }
    );
  }
}