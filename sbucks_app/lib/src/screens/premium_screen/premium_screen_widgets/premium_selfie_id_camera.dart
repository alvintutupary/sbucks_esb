import 'package:camera/camera.dart';
// import 'package:sbucks/src/screens/premium_screen/premi';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PremiumSelfieIdCamera extends StatefulWidget {
  @override
  _PremiumSelfieIdCameraState createState() => _PremiumSelfieIdCameraState();
}

class _PremiumSelfieIdCameraState extends State<PremiumSelfieIdCamera> {
  CameraController cameraController;
  List cameras;
  int selectedCameraIndex;
  String imgPath;

  Future initCamera(CameraDescription cameraDescription) async {
    if (cameraController != null) {
      await cameraController.dispose();
    }

    cameraController =
        CameraController(cameraDescription, ResolutionPreset.high);

    cameraController.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });

    if (cameraController.value.hasError) {
      print('Camera Error ${cameraController.value.errorDescription}');
    }

    try {
      await cameraController.initialize();
    } catch (e) {
      showCameraException(e);
    }

    if (mounted) {
      setState(() {});
    }
  }

  /// Display camera preview
  Widget cameraPreview() {
    if (cameraController == null || !cameraController.value.isInitialized) {
      return Text(
        'Loading',
        style: TextStyle(
            color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
      );
    }

    return AspectRatio(
      aspectRatio: cameraController.value.aspectRatio,
      child: CameraPreview(cameraController),
    );
  }

  onCapture(context) async {
    try {
      await cameraController.takePicture().then((value) {
        Navigator.pop(context, value.path);
      });
    } catch (e) {
      showCameraException(e);
    }
  }

  @override
  void initState() {
    availableCameras().then((value) {
      cameras = value;
      if (cameras.length > 0) {
        setState(() {
          selectedCameraIndex = 0;
        });
        initCamera(cameras[selectedCameraIndex]).then((value) {});
      } else {
        print('No camera available');
      }
    }).catchError((e) {
      print('Error : ${e.code}');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: cameraPreview(),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text('Place your ID card within the frame'),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                'assets/img/id-frame.png',
                scale: 0.8,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 120,
                width: double.infinity,
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.only(bottom: 20),
                color: Colors.transparent,
                child: Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      FloatingActionButton(
                        child: Icon(
                          Icons.camera,
                          color: Colors.black,
                        ),
                        backgroundColor: Colors.white,
                        onPressed: () {
                          onCapture(context);
                        },
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  showCameraException(e) {
    String errorText = 'Error ${e.code} \nError message: ${e.description}';
    print(errorText);
  }
}
