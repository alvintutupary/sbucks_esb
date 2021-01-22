import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sbucks/src/screens/premium_screen/premium_screen_widgets/premium_photo_id_camera.dart';
import 'package:sbucks/src/utils/size_config.dart';
import 'package:sbucks/src/widgets/common/app_spacer.dart';

class PremiumPhotoId extends StatefulWidget {
  final TabController tabController;
  PremiumPhotoId({this.tabController});

  @override
  _PremiumPhotoIdState createState() => _PremiumPhotoIdState();
}

class _PremiumPhotoIdState extends State<PremiumPhotoId> {
  String imagePath;

  _callCamera() async {
    String resultPath = '';
    resultPath = await Navigator.push(
        context, MaterialPageRoute(builder: (_) => PremiumPhotoIdCamera()));
    if (resultPath.isNotEmpty) {
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
                    widget.tabController.animateTo(1);
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
                          AssetImage('assets/img/premium-icon-large-2.jpg'))),
              height: 200.sch,
            ),
            Row(
              // mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 150.scw,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.contain,
                                image: AssetImage(
                                    'assets/img/premium-icon2.jpg'))),
                        height: 100.sch,
                        width: 100.scw,
                      ),
                      Container(
                        child: Text('1. Prepare your identification (ID) Card'),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 150.scw,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.contain,
                                image: AssetImage(
                                    'assets/img/premium-icon3.jpg'))),
                        height: 100.sch,
                        width: 100.scw,
                      ),
                      Container(
                        child: Text(
                            '''2. Take a picture of your ID card - make sure its within the frame'''),
                        width: 150.scw,
                      )
                    ],
                  ),
                ),
              ],
            ),
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
