import 'package:flutter/material.dart';
import 'package:sbucks/src/screens/intro_screen/intro_screen.dart';
import 'package:sbucks/src/screens/login_screen/login_screen.dart';
import 'package:sbucks/src/screens/main_screen/main_screen.dart';
import 'package:sbucks/src/screens/register_screen/register_screen_widgets/register_agreement.dart';
import 'package:sbucks/src/screens/register_screen/register_screen_widgets/register_otp.dart';
import 'package:sbucks/src/screens/register_screen/register_screen.dart';
import 'package:sbucks/src/screens/home_screen/home_screen.dart';
import 'package:sbucks/src/screens/payment_screen/payment_screen.dart';
import 'package:sbucks/src/screens/payment_screen/payment_screen_widgets/payment_topup.dart';
import 'package:sbucks/src/screens/payment_screen/payment_screen_widgets/payment_topup_confirm.dart';

Route<dynamic> generateRoutes(RouteSettings settings) {
  // AppTextStyle.setStatusBarColor(AppColor.kStatusBarAccentColor, false);
  switch (settings.name) {
    case MainScreen.kRouteName:
      return _buildMaterialPageRoute(MainScreen.kRouteName, MainScreen());
    case HomeScreen.kRouteName:
      return _buildMaterialPageRoute(HomeScreen.kRouteName, HomeScreen());
    case IntroScreen.kRouteName:
      return _buildMaterialPageRoute(IntroScreen.kRouteName, IntroScreen());
    case LoginScreen.kRouteName:
      return _buildMaterialPageRoute(LoginScreen.kRouteName, LoginScreen());
    case RegisterScreen.kRouteName:
      return _buildMaterialPageRoute(
          RegisterScreen.kRouteName, RegisterScreen());
    case RegisterAgreement.kRouteName:
      return _buildMaterialPageRoute(
          RegisterAgreement.kRouteName, RegisterAgreement());
    case RegisterOTP.kRouteName:
      return _buildMaterialPageRoute(
          RegisterOTP.kRouteName, RegisterOTP(settings.arguments));
    case PaymentScreen.kRouteName:
      return _buildMaterialPageRoute(PaymentScreen.kRouteName, PaymentScreen());
    case PaymentTopup.kRouteName:
      return _buildMaterialPageRoute(PaymentTopup.kRouteName, PaymentTopup());
    case PaymentTopupConfirm.kRouteName:
      return _buildMaterialPageRoute(
          PaymentTopupConfirm.kRouteName, PaymentTopupConfirm());

    default:
      return null;
  }
}

MaterialPageRoute _buildMaterialPageRoute(
    String routeName, Widget screenWidget) {
  return MaterialPageRoute(
    settings: RouteSettings(name: routeName),
    builder: (_) => screenWidget,
  );
}
