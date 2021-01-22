import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sbucks/src/screens/intro_screen/intro_screen.dart';
import 'package:sbucks/src/screens/login_screen/login_screen_widget/login_pin.dart';
import 'package:sbucks/src/screens/login_screen/login_screen.dart';
import 'package:sbucks/src/utils/size_config.dart';
import 'package:sbucks/src/utils/style.dart';
import 'package:sbucks/src/blocs/app_bloc.dart';

class SplashScreen extends StatefulWidget {
  static const kRouteName = '/';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> _loadData() async {
    final isFirstRun = await appBloc.isFirstRun();
    final userPin = await appBloc.getPin();

    if (isFirstRun) {
      Navigator.pushReplacementNamed(context, IntroScreen.kRouteName);
    } else {
      if (userPin.isEmpty) {
        Navigator.pushReplacementNamed(context, LoginScreen.kRouteName);
      } else {
        Navigator.pushReplacementNamed(context, LoginPin.kRouteName);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      _loadData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kPrimaryBrand,
      body: SafeArea(
        child: Center(
          child: Image.asset(
            'assets/img/icon-1.PNG',
            width: 120.scw,
          ),
        ),
      ),
    );
  }
}
