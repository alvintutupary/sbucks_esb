import 'package:flutter/material.dart';
import 'package:sbucks/src/screens/login_screen/login_screen.dart';
import 'package:sbucks/src/utils/style.dart';
import 'package:sbucks/src/utils/size_config.dart';
import 'package:sbucks/src/widgets/common/app_spacer.dart';
import 'package:sbucks/src/widgets/label_button.dart';
import 'package:sbucks/src/blocs/app_bloc.dart';

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

class IntroScreen extends StatefulWidget {
  static const kRouteName = '/intro';

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int _current = 0;

  final _introItems = List<_IntroItem>()
    ..add(_IntroItem(
      'assets/img/icon-1.PNG',
      'assets/img/bg-1.jpg',
      'Welcome',
      'Thanks for downloading\nthe new Starbucks\u00a9 ID App',
    ))
    ..add(_IntroItem(
      'assets/img/icon-2.PNG',
      'assets/img/bg-2.jpg',
      'Virtual Card',
      'Simply scan to pay and collect\nStars to earn rewards',
    ))
    ..add(_IntroItem(
      'assets/img/icon-3.PNG',
      'assets/img/bg-3.jpg',
      'Stay Current',
      'Receive news and special offers\ndirectly to your app',
    ))
    ..add(_IntroItem(
      'assets/img/icon-4.PNG',
      'assets/img/bg-4.jpg',
      'Find a Store',
      'Search for a store near you and\nget turn by turn directions',
    ));

  Widget _buildContent(_IntroItem item) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(item.bgImageUri), fit: BoxFit.cover),
      ),
      // color: Colors.transparent,
      padding: EdgeInsets.only(
        left: 8.sch,
        top: 0,
        right: 8.sch,
        bottom: 50.sch,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 150.sch),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage(item.imageUri),
                ),
              ),
              height: 200.sch,
              // width: MediaQuery.of(context).size.width,
            ),
          ),
          Column(
            children: [
              Text(
                item.title,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 50.scs),
              ),
              AppSpacer.hSpacing(100),
              Text(
                item.subtitle,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 20.scs),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _introItems.map((item) {
        int index = _introItems.indexOf(item);
        return AnimatedContainer(
          duration: Duration(milliseconds: 100),
          width: _current == index ? 8.scs : 8.scs,
          height: 8.scs,
          margin: EdgeInsets.symmetric(vertical: 10.sch, horizontal: 2.scw),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: _current == index ? Color(0xff006442) : Color(0xFFC4C4C4),
          ),
          curve: Curves.fastOutSlowIn,
        );
      }).toList(),
    );
  }

  void _onFinish() async {
    bool isFirstRun = await appBloc.isFirstRun();
    if (isFirstRun) {
      appBloc.finishFirstRun();
      Navigator.pushNamed(context, LoginScreen.kRouteName);
    } else {
      Navigator.pop(context);
    }
  }

  Widget _buildButtons() {
    final isLastIndex =
        _introItems[_current] == _introItems[_introItems.length - 1];

    return AnimatedCrossFade(
      duration: Duration(milliseconds: 100),
      firstChild: Container(),
      secondChild: Center(
        child: LabelButton(
          text: 'FINISH',
          color: Colors.white,
          onTap: () => _onFinish(),
        ),
      ),
      crossFadeState:
          isLastIndex ? CrossFadeState.showSecond : CrossFadeState.showFirst,
    );
  }

  @override
  Widget build(BuildContext context) {
    final deviceHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: AppColor.kPrimaryBackground,
      body: Container(
        margin: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
        ),
        child: SingleChildScrollView(
          child: SizedBox(
            height: deviceHeight,
            child: Stack(
              children: [
                ScrollConfiguration(
                  behavior: ScrollBehavior()
                    ..buildViewportChrome(context, null, AxisDirection.down),
                  child: SizedBox(
                    height: deviceHeight,
                    child: PageView(
                      children: [
                        for (final item in _introItems) _buildContent(item),
                      ],
                      onPageChanged: (int index) {
                        setState(() {
                          _current = index;
                        });
                      },
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  // top: 5.sch,
                  child: _buildIndicator(),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: EdgeInsets.all(5.scs),
                    child: _buildButtons(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
