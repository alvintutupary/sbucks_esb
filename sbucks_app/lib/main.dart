import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as orientaion;
import 'package:sbucks/src/screens/intro_screen/intro_screen.dart';
import 'package:sbucks/src/screens/main_screen/main_screen.dart';
import 'package:sbucks/src/screens/payment_screen/payment_screen_widgets/payment_chose_bank.dart';
import 'package:sbucks/routes.dart';
import 'package:device_preview/device_preview.dart';
import 'package:sbucks/src/utils/size_config.dart';
import 'package:sbucks/src/utils/style.dart';

void main() => runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => MyApp(), // Wrap your app
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    orientaion.SystemChrome.setPreferredOrientations(
        [orientaion.DeviceOrientation.portraitUp]);
    return MaterialApp(
      title: 'Star Bucks App',
      theme: ThemeData(
        fontFamily: 'Nunito Sans',
        // primaryColor: AppColor.kPrimaryColor,
        // accentColor: AppColor.kBrandColor,
        // canvasColor: Colors.transparent,
        // splashColor: AppColor.kPrimaryColor,
        appBarTheme: AppBarTheme(
          brightness: Brightness.light,
          // color: Colors.black,
          // iconTheme: IconThemeData(color: Colors.black),
        ),
        buttonTheme: ButtonThemeData(
          disabledColor: AppColor.kButtonDisabledBackground,
          // buttonColor: AppColor.kPrimaryColor,
          // textTheme: ButtonTextTheme.primary,
          // splashColor: AppColor.kPrimaryColor,
        ),
        // visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      locale: DevicePreview.of(context).locale,
      // builder: DevicePreview.appBuilder,
      builder: (BuildContext context, Widget widget) {
        final screenWidth =
            !kReleaseMode ? DevicePreview.mediaQuery(context).size.width : null;
        final screenHeight = !kReleaseMode
            ? DevicePreview.mediaQuery(context).size.height
            : null;

        AppTextStyle(context,
            designWidth: 360,
            designHeight: 592,
            screenWidth: screenWidth,
            screenHeight: screenHeight);
        if (!kReleaseMode) {
          SizeConfig.info();
        }
        return DevicePreview.appBuilder(context, widget);
      },
      home: IntroScreen(),
      onGenerateRoute: generateRoutes,
    );
  }
}
