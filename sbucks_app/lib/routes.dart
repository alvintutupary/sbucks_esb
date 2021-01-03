import 'package:flutter/material.dart';
import 'package:sbucks/src/screens/intro_screen/intro_screen.dart';
import 'package:sbucks/src/screens/login_screen/login_screen.dart';
import 'package:sbucks/src/screens/register_screen/register_widgets/agreement.dart';

Route<dynamic> generateRoutes(RouteSettings settings) {
  // AppTextStyle.setStatusBarColor(AppColor.kStatusBarAccentColor, false);
  switch (settings.name) {
    case IntroScreen.kRouteName:
      return _buildMaterialPageRoute(IntroScreen.kRouteName, IntroScreen());
    case LoginScreen.kRouteName:
      return _buildMaterialPageRoute(LoginScreen.kRouteName, LoginScreen());
    case AgreementScreen.kRouteName:
      return _buildMaterialPageRoute(
          AgreementScreen.kRouteName, AgreementScreen());
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
