import 'package:flutter/material.dart';
import 'package:sbucks/src/screens/premium_screen/premium_screen_widgets/premium_selfie_id_camera.dart';
import 'package:sbucks/src/utils/size_config.dart';
import 'package:sbucks/src/widgets/common/app_spacer.dart';
import 'dart:io';

class PremiumSelfieId extends StatefulWidget {
  final TabController tabController;
  PremiumSelfieId({this.tabController});

  @override
  _PremiumSelfieIdState createState() => _PremiumSelfieIdState();
}

class _PremiumSelfieIdState extends State<PremiumSelfieId> {
  String imagePath;

  _callCamera() async {
    String resultPath = '';
    resultPath = await Navigator.push(
        context, MaterialPageRoute(builder: (_) => PremiumSelfieIdCamera()));
    if (resultPath != null || resultPath.isNotEmpty) {
      print(resultPath);
      setState(() {
        imagePath = resultPath;
      });
    }
  }

  @override
  void initState() {
    imagePath = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (imagePath != null && imagePath != "") {
      return Container(
        child: Column(
          children: [
            AppSpacer.vSpacing(20),
            Text("You've successfully taken your ID phot"),
            AppSpacer.vSpacing(20),
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover, image: FileImage(File(imagePath)))),
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width,
            ),
            AppSpacer.vSpacing(20),
            Text('Make sure your photo is clear, not blurry or cropped'),
            AppSpacer.vSpacing(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FlatButton(
                  onPressed: () {
                    _callCamera();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Retake',
                      style: TextStyle(color: Colors.white, fontSize: 15.scs),
                    ),
                  ),
                  color: Colors.greenAccent[400],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    // side: BorderSide(color: Colors.red),
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    widget.tabController.animateTo(2);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Use this photo',
                      style: TextStyle(color: Colors.white, fontSize: 15.scs),
                    ),
                  ),
                  color: Colors.greenAccent[400],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    // side: BorderSide(color: Colors.red),
                  ),
                )
              ],
            )
          ],
        ),
      );
    } else {
      return Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.contain,
                      image:
                          AssetImage('assets/img/premium-icon-large-1.jpg'))),
              height: 250.sch,
              // width: 100.sch,
            ),
            Text('Take a selfie while holding your ID card'),
            FlatButton(
              onPressed: () {
                _callCamera();
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Take ID Photo',
                  style: TextStyle(color: Colors.white, fontSize: 15.scs),
                ),
              ),
              color: Colors.greenAccent[400],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
                // side: BorderSide(color: Colors.red),
              ),
            )
          ],
        ),
      );
    }
  }
}
