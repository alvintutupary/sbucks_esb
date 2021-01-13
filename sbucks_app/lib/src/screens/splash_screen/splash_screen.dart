// import 'dart:async';
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// // import 'package:package_info/package_info.dart';
// // import 'package:provider/provider.dart';
// // import 'package:sbucks/src/blocs/account_bloc.dart';
// // import 'package:sbucks/src/blocs/app_bloc.dart';
// // import 'package:sbucks/src/blocs/home_bloc.dart';
// // import 'package:sbucks/src/blocs/order_bloc.dart';
// // import 'package:sbucks/src/models/api_response_model.dart';
// import 'package:sbucks/src/screens/home_screen/home_screen.dart';
// import 'package:sbucks/src/screens/intro_screen/intro_screen.dart';
// import 'package:sbucks/src/screens/main_screen/main_screen.dart';
// import 'package:sbucks/src/utils/constant.dart';
// import 'package:sbucks/src/utils/dialog.dart';
// import 'package:sbucks/src/utils/size_config.dart';
// import 'package:sbucks/src/utils/style.dart';
// import 'package:url_launcher/url_launcher.dart';

// class SplashScreen extends StatefulWidget {
//   static const kRouteName = '/';

//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   static void _showNewVersionPopUp(BuildContext context) async {
//     await showAlertDialog(
//       barrierDismissible: false,
//       context: context,
//       title: 'QoQi punya versi terbaru!',
//       subtitle: 'Segera lakukan pembaharuan supaya aplikasi bisa digunakan',
//       actionLabel: 'Perbaharui',
//       onActionLabelPressed: () async {
//         final package = await PackageInfo.fromPlatform();
//         if (Platform.isAndroid) {
//           await launch(
//             'https://play.google.com/store/apps/details?id=${package.packageName}',
//           );
//         } else {
//           await launch(
//             'itms-apps://itunes.apple.com/app/id${AppConstant.kAppStoreId}',
//           );
//         }
//       },
//     );
//     SystemChannels.platform.invokeMethod('SystemNavigator.pop');
//   }

//   Future<void> _loadData() async {
//     final accountBloc = Provider.of<AccountBloc>(context, listen: false);
//     final isFirstRun = await appBloc.isFirstRun();
//     final userToken = await appBloc.getUserToken();

//     final homeBloc = Provider.of<HomeBloc>(context, listen: false);
//     if (await homeBloc.isNewVersionAvailable()) {
//       _showNewVersionPopUp(context);
//       return;
//     }

//     if (userToken != null) {
//       final userResponse = await accountBloc.fetchUserProfile();
//       if (userResponse.status == Status.COMPLETE) {
//         appBloc.changeUser(userResponse.body);
//       } else {
//         if (userResponse.message.contains('Unauthorised')) {
//           final orderBloc = Provider.of<OrderBloc>(context, listen: false);
//           orderBloc.initOrderData();
//           accountBloc.logout();
//         } else {
//           showErrorDialog(
//             context,
//             userResponse.message,
//             onRetry: () => _loadData(),
//           );
//           return;
//         }
//       }
//     }

//     if (isFirstRun) {
//       // appBloc.eventLogViewContent(
//       //   contentId: IntroScreen.kRouteName,
//       // );
//       Navigator.pushReplacementNamed(context, IntroScreen.kRouteName);
//     } else {
//       // appBloc.eventLogViewContent(
//       //   contentId: HomeScreen.kRouteName,
//       // );
//       Navigator.pushReplacementNamed(context, MainScreen.kRouteName);
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(Duration(seconds: 2), () {
//       _loadData();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColor.kPrimaryBackground,
//       body: SafeArea(
//         child: Center(
//           child: Image.asset(
//             'assets/images/qoqi_color.png',
//             width: 120.scw,
//           ),
//         ),
//       ),
//     );
//   }
// }
