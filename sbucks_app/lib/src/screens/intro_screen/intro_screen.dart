import 'package:flutter/material.dart';
import 'package:sbucks/src/screens/login_screen/login_screen.dart';
import 'package:sbucks/src/screens/register_screen/register_screen.dart';
import 'package:sbucks/src/utils/style.dart';
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
    ))
    ..add(_IntroItem(
      'assets/img/icon-5.PNG',
      'assets/img/bg-5.jpg',
      '',
      '',
    ));

  Widget _buildContent(_IntroItem item) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(item.bgImageUri),
          fit: BoxFit.cover,
        ),
      ),
      // color: Colors.transparent,
      padding: EdgeInsets.only(
        left: 8,
        top: 0,
        right: 8,
        bottom: 150,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 10,
              right: 10,
              bottom: 5,
              top: 52,
            ),
            child: Image.asset(
              item.imageUri,
              height: 285,
            ),
          ),
          Column(
            children: [
              Text(
                item.title,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 50),
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
              ),
              Text(
                item.subtitle,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 20),
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

  // void _showLoginDialog() async {
  //   final user = await Navigator.pushNamed(
  //       context, RegisterScreen.kRouteName); //as User;
  //   if (user != null) {
  //     // appBloc.finishFirstRun();
  //     // appBloc.changeUser(user);
  //     // Navigator.pushReplacementNamed(context, MainScreen.kRouteName);
  //   }
  // }

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
              'SignIn',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            circularRadius: 0,
            onPressed: () {
              // appBloc.finishFirstRun();
              Navigator.pushReplacementNamed(
                context,
                LoginScreen.kRouteName,
              );
            },
          ),
          // AppSpacer.vSpacing(8),
          WideButton(
            borderSide: BorderSide(
              color: AppColor.kLoginRegisterBorder,
            ),
            circularRadius: 0,
            flatButton: true,
            color: AppColor.kPrimaryBackground,
            child: Text(
              'Join Now',
              style: TextStyle(
                  color: Color(0xff006442), fontWeight: FontWeight.w900),
            ),
            onPressed: () {
              Navigator.pushNamed(
                context,
                RegisterScreen.kRouteName,
              );
            },
          ),
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
                  top: 20,
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
