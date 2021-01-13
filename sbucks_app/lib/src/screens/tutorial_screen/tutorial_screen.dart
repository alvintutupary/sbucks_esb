import 'package:flutter/material.dart';
import 'package:sbucks/src/utils/style.dart';
import 'package:sbucks/src/utils/size_config.dart';
import 'package:sbucks/src/widgets/common/wide_button.dart';
import 'package:sbucks/src/widgets/common/app_spacer.dart';

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

class TutorialScreen extends StatefulWidget {
  static const kRouteName = '/tutorial';

  @override
  _TutorialScreenState createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
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
            padding: EdgeInsets.only(
              left: 10.sch,
              right: 10.sch,
              bottom: 5,
              top: 52,
            ),
            child: Image.asset(
              item.imageUri,
              fit: BoxFit.cover,
              scale: 1.scs,
            ),
          ),
          Column(
            children: [
              Text(
                item.title,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 50.scs),
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
              ),
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
          width: _current == index ? 8.0 : 8.0,
          height: 8.0,
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.0),
            color: _current == index ? Color(0xff006442) : Color(0xFFC4C4C4),
          ),
          curve: Curves.fastOutSlowIn,
        );
      }).toList(),
    );
  }

  Widget _buildButtons() {
    final isLastIndex =
        _introItems[_current] == _introItems[_introItems.length - 1];

    return AnimatedCrossFade(
      duration: Duration(milliseconds: 100),
      firstChild: Container(),
      secondChild: Column(
        children: [
          WideButton(
            color: Color(0xff006442),
            flatButton: true,
            child: Text(
              'Finish',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            circularRadius: 0,
            onPressed: () => Navigator.pop(context),
          ),
          AppSpacer.vSpacing(5),
        ],
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
                  top: 20.sch,
                  child: _buildIndicator(),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: EdgeInsets.all(16),
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
