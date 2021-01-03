// import 'dart:io';

// import 'package:flutter/services.dart';
// import 'package:intl/intl.dart';
// import 'package:url_launcher/url_launcher.dart';

// class Utilities {
//   static String numberFormat(
//     double number, {
//     String symbol = '',
//     int decimalDigits = 0,
//     String thousandSeparator = '.',
//     String decimalSeparator = ',',
//   }) {
//     final formattedString = NumberFormat.currency(
//       symbol: symbol,
//       decimalDigits: decimalDigits,
//       locale: 'en_US',
//     ).format(number);

//     return formattedString
//         .replaceAll(',', '[,]')
//         .replaceAll('.', '[.]')
//         .replaceAll('[,]', thousandSeparator)
//         .replaceAll('[.]', decimalSeparator);
//   }

//   static bool isValidPhoneNumber(String phoneNumber) {
//     bool isValid = true;
//     if (phoneNumber.length < 10 || phoneNumber.length > 13) {
//       isValid = false;
//     }
//     if (int.tryParse(phoneNumber) == null) {
//       isValid = false;
//     }
//     if (!phoneNumber.startsWith('08')) {
//       isValid = false;
//     }
//     return isValid;
//   }

//   static bool isValidEmail(String email) {
//     return RegExp(
//             r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
//         .hasMatch(email);
//   }

//   static String properCase(String s) =>
//       s[0].toUpperCase() + s.substring(1).toLowerCase();

//   static void openWhatsapp(String phoneNumber, {Function onFailed}) async {
//     String url() {
//       if (Platform.isIOS) {
//         return "whatsapp://wa.me/$phoneNumber";
//       } else {
//         return "whatsapp://send?phone=$phoneNumber";
//       }
//     }

//     if (await canLaunch(url())) {
//       await launch(url());
//     } else {
//       if (onFailed != null) {
//         onFailed();
//       }
//     }
//   }

//   static final List<TextInputFormatter> filterEmoticonInputFormatter = [
//     FilteringTextInputFormatter.deny(RegExp(
//       '(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])',
//     ))
//   ];
// }
