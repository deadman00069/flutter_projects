import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:camera_camera/camera_camera.dart';

class CameraScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: <Widget>[
          Camera(
            mode: CameraMode.normal,
            //initialCamera: CameraSide.front,
            //enableCameraChange: false,
            //  orientationEnablePhoto: CameraOrientation.landscape,
//            onChangeCamera: (direction, _) {
//              print('--------------');
//              print('$direction');
//              print('--------------');
//            },

//              imageMask: CameraFocus.square(
//                color: Colors.black.withOpacity(0.5),
//              ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            height: 50,
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.settings,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.flash_off,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 32,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
