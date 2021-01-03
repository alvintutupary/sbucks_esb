// import 'dart:convert';
// import 'dart:io';

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// // import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// // import 'package:sbucks/src/blocs/app_bloc.dart';
// // import 'package:sbucks/src/models/app_notification_model.dart';
// import 'package:sbucks/src/utils/style.dart';

// Future<dynamic> showLocalNotification(Map<String, dynamic> message) async {
//   AppNotification notificationData;
//   try {
//     if (Platform.isIOS) {
//       notificationData = AppNotification.fromJson(message);
//     } else if (message.containsKey('data')) {
//       notificationData = AppNotification.fromJson(message['data']);
//     }
//   } catch (e) {
//     print('Error: ${e.toString()}');
//     return;
//   }

//   if (notificationData != null) {
//     final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

//     final platformChannelSpecifics = NotificationDetails(
//       android: AndroidNotificationDetails(
//         'QoQi',
//         'QoQi',
//         'QoQi',
//         styleInformation: DefaultStyleInformation(true, true),
//         importance: Importance.max,
//         priority: Priority.high,
//         playSound: true,
//         ticker: 'ticker',
//         color: AppColor.kBrandColor,
//       ),
//       iOS: IOSNotificationDetails(
//         presentAlert: true,
//         presentBadge: true,
//         presentSound: true,
//       ),
//     );

//     await flutterLocalNotificationsPlugin.show(
//       0,
//       notificationData.header,
//       notificationData.subHeader,
//       platformChannelSpecifics,
//       payload: jsonEncode(notificationData.toMap()),
//     );
//   }
// }

// Future<dynamic> backgroundHandle(Map<String, dynamic> message) async {
//   showLocalNotification(message);
// }

// void _handleResumeLaunch(
//   Map<String, dynamic> message,
//   Future<void> onSelect(String payload),
// ) {
//   if (Platform.isAndroid) {
//     if (message.containsKey('data')) {
//       onSelect(jsonEncode(message['data']));
//     }
//   }
//   if (Platform.isIOS) {
//     onSelect(jsonEncode(message));
//   }
// }

// Future<void> initNotification({
//   @required FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
//   @required NotificationAppLaunchDetails notificationAppLaunchDetails,
//   @required Future<void> onSelect(String payload),
//   @required Function onHasNewNotification,
// }) async {
//   appBloc.firebaseMessaging.configure(
//     onMessage: (message) async {
//       onHasNewNotification();
//       showLocalNotification(message);
//     },
//     onResume: (message) async {
//       _handleResumeLaunch(message, onSelect);
//     },
//     onLaunch: (message) async {
//       _handleResumeLaunch(message, onSelect);
//     },
//   );

//   final initializationSettings = InitializationSettings(
//     android: AndroidInitializationSettings('notification_icon'),
//     iOS: IOSInitializationSettings(
//       defaultPresentAlert: true,
//       defaultPresentBadge: true,
//       defaultPresentSound: true,
//       requestAlertPermission: true,
//       requestBadgePermission: true,
//       requestSoundPermission: true,
//       onDidReceiveLocalNotification: (id, title, body, payload) async {
//         onSelect(payload);
//       },
//     ),
//   );

//   await flutterLocalNotificationsPlugin.initialize(initializationSettings,
//       onSelectNotification: (String payload) async {
//     if (payload != null) {
//       onSelect(payload);
//     }
//   });

//   if (notificationAppLaunchDetails.didNotificationLaunchApp) {
//     onSelect(notificationAppLaunchDetails.payload);
//   }
// }
