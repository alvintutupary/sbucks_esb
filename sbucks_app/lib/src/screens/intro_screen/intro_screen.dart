import 'package:flutter/material.dart';
import 'package:sbucks/src/screens/login_screen/login_screen.dart';
// import 'package:sbucks/src/blocs/app_bloc.dart';
// import 'package:sbucks/src/models/user_model.dart';
// import 'package:sbucks/src/screens/login_screen/login_screen.dart';
// import 'package:sbucks/src/screens/main_screen/main_screen.dart';
import 'package:sbucks/src/utils/size_config.dart';
import 'package:sbucks/src/utils/style.dart';
import 'package:sbucks/src/widgets/common/app_spacer.dart';
import 'package:sbucks/src/widgets/common/wide_button.dart';

class _IntroItem {
  String imageUri;
  String bgImageUri;
  String title;
  String subtitle;

  _IntroItem(
    this.imageUri,
    this.bgImageUri,
    this.title,
    this.subtitle,
  );
}

List items = [
  {
    "header": "Welcome",
    "description": "Thanks for downloading the new starbuck ID App",
    "image": "assets/img/icon-1.PNG",
    "bgimage": "assets/img/bg-1.jpg"
  },
  {
    "header": "Virtual Card",
    "description": "Simply scan to pay and collect stars to earn reward",
    "image": "assets/img/icon-2.PNG",
    "bgimage": "assets/img/bg-2.jpg"
  },
  {
    "header": "Stay Current",
    "description": "Receive news and special offers directly to your app.",
    "image": "assets/img/icon-3.PNG",
    "bgimage": "assets/img/bg-3.jpg"
  },
  {
    "header": "Find a Store",
    "description":
        "Search for a store near you and get turn by turn directions.",
    "image": "assets/img/icon-4.PNG",
    "bgimage": "assets/img/bg-3.jpg"
  }
];

class IntroScreen extends StatefulWidget {
  static const kRouteName = '/';
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  List<Widget> slides = items
      .map((item) => Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(item['bgimage']),
              fit: BoxFit.cover,
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            children: <Widget>[
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Image.asset(
                  item['image'],
                  fit: BoxFit.fitWidth,
                  width: 220.scw,
                  alignment: Alignment.bottomCenter,
                ),
              ),
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    children: <Widget>[
                      Text(item['header'],
                          style: TextStyle(
                              fontSize: 50.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.white, //Color(0XFF3F3D56),
                              height: 5.0)),
                      Text(
                        item['description'],
                        style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 1.2,
                            fontSize: 25.0,
                            height: 1.3),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              )
            ],
          )))
      .toList();

  List<Widget> indicator() => List<Widget>.generate(
      slides.length,
      (index) => Container(
            margin: EdgeInsets.symmetric(horizontal: 3.0),
            height: 10.0,
            width: 10.0,
            decoration: BoxDecoration(
                color: currentPage.round() == index
                    ? Color(0XFF256075)
                    : Colors.white
                        .withOpacity(0.5), //Color(0XFF256075).withOpacity(0.2),
                borderRadius: BorderRadius.circular(10.0)),
          ));

  double currentPage = 0.0;
  final _pageViewController = new PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            PageView.builder(
              controller: _pageViewController,
              itemCount: slides.length,
              itemBuilder: (BuildContext context, int index) {
                _pageViewController.addListener(() {
                  setState(() {
                    currentPage = _pageViewController.page;
                  });
                });
                return slides[index];
              },
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(top: 70.0),
                padding: EdgeInsets.symmetric(vertical: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: indicator(),
                ),
              ),
              //  ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(top: 70.0),
                padding: EdgeInsets.symmetric(vertical: 40.0),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: Text('Masuk'),
                ),
              ),
            ),
            //  ),

            // )
          ],
        ),
      ),
    );
  }
}
