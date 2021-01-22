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
import 'package:sbucks/src/screens/payment_screen/payment_screen_widgets/payment_chose_bank.dart';
import 'package:sbucks/src/screens/payment_screen/payment_screen_widgets/payment_bank.dart';
import 'package:sbucks/src/screens/reward_screen/reward_screen.dart';
import 'package:sbucks/src/screens/inbox_screen/inbox_screen.dart';
import 'package:sbucks/src/screens/login_screen/login_screen_widget/login_email_otp.dart';
import 'package:sbucks/src/screens/login_screen/login_screen_widget/login_set_pin.dart';
import 'package:sbucks/src/screens/login_screen/login_screen_widget/login_confirm_pin.dart';
import 'package:sbucks/src/screens/login_screen/login_screen_widget/login_pin.dart';
import 'package:sbucks/src/screens/splash_screen/splash_screen.dart';
import 'package:sbucks/src/screens/transaction_history_screen/transaction_history_screen.dart';
import 'package:sbucks/src/screens/home_screen/home_screen_widgets/home_news.dart';
import 'package:sbucks/src/screens/static_screen/static_screen.dart';

Route<dynamic> generateRoutes(RouteSettings settings) {
  // AppTextStyle.setStatusBarColor(AppColor.kStatusBarAccentColor, false);
  switch (settings.name) {
    case SplashScreen.kRouteName:
      return _buildMaterialPageRoute(SplashScreen.kRouteName, SplashScreen());
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
    case PaymentChoseBank.kRouteName:
      return _buildMaterialPageRoute(
          PaymentChoseBank.kRouteName, PaymentChoseBank());
    case PaymentBank.kRouteName:
      return _buildMaterialPageRoute(
          PaymentBank.kRouteName,
          PaymentBank(
            modelBank: settings.arguments,
          ));
    case RewardScreen.kRouteName:
      return _buildMaterialPageRoute(RewardScreen.kRouteName, RewardScreen());

    case InboxScreen.kRouteName:
      return _buildMaterialPageRoute(InboxScreen.kRouteName, InboxScreen());
    case LoginEmailOTP.kRouteName:
      return _buildMaterialPageRoute(
          LoginEmailOTP.kRouteName, LoginEmailOTP(settings.arguments));
    case LoginSetPin.kRouteName:
      return _buildMaterialPageRoute(LoginSetPin.kRouteName, LoginSetPin());
    case LoginConfirmPin.kRouteName:
      return _buildMaterialPageRoute(
          LoginConfirmPin.kRouteName,
          LoginConfirmPin(
            pin: settings.arguments,
          ));
    case LoginPin.kRouteName:
      return _buildMaterialPageRoute(LoginPin.kRouteName, LoginPin());
    case StaticScreen.kRouteName:
      return _buildMaterialPageRoute(
          StaticScreen.kRouteName, StaticScreen(settings.arguments));
    case HomeNews.kRouteName:
      return _buildMaterialPageRoute(
          HomeNews.kRouteName,
          HomeNews(
            content: settings.arguments,
          ));
    case TransactionHistoryScreen.kRouteName:
      return _buildMaterialPageRoute(
          TransactionHistoryScreen.kRouteName, TransactionHistoryScreen());
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
