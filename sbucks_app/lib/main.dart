import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as orientaion;
import 'package:sbucks/routes.dart';
import 'package:device_preview/device_preview.dart';
import 'package:sbucks/src/utils/size_config.dart';
import 'package:sbucks/src/utils/style.dart';
import 'package:provider/provider.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:sbucks/src/blocs/account_bloc.dart';
import 'package:sbucks/src/blocs/content_bloc.dart';

void main() {
  return runApp(
    DevicePreview(
      enabled: false, //!kReleaseMode,
      builder: (context) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    orientaion.SystemChrome.setPreferredOrientations(
        [orientaion.DeviceOrientation.portraitUp]);

    return FutureBuilder(
      future: initializeDateFormatting('id_ID', null),
      builder: (context, snapshot) {
        return MultiProvider(
          providers: [
            Provider<AccountBloc>(create: (_) => AccountBloc()),
            Provider<ContentBloc>(create: (_) => ContentBloc()),
          ],
          child: MaterialApp(
            title: 'Star Bucks App',
            theme: ThemeData(
              fontFamily: 'Nunito Sans',
              primaryColor: Colors.white, //AppColor.kPrimaryColor,
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
                textTheme: ButtonTextTheme.primary,
                // splashColor: AppColor.kPrimaryColor,
              ),
              // visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            locale: DevicePreview.of(context).locale,
            // localizationsDelegates: context.localizationDelegates,
            // supportedLocales: context.supportedLocales,
            builder: (BuildContext context, Widget widget) {
              final screenWidth = !kReleaseMode
                  ? DevicePreview.mediaQuery(context).size.width
                  : null;
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
            // home: await setScreen,
            onGenerateRoute: generateRoutes,
          ),
        );
      },
    );
  }
}
