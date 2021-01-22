import 'dart:io';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:sbucks/src/utils/constant.dart';
import 'package:crypto/crypto.dart';

class Utilities {
  static String numberFormat(
    double number, {
    String symbol = '',
    int decimalDigits = 0,
    String thousandSeparator = '.',
    String decimalSeparator = ',',
  }) {
    final formattedString = NumberFormat.currency(
      symbol: symbol,
      decimalDigits: decimalDigits,
      locale: 'en_US',
    ).format(number);

    return formattedString
        .replaceAll(',', '[,]')
        .replaceAll('.', '[.]')
        .replaceAll('[,]', thousandSeparator)
        .replaceAll('[.]', decimalSeparator);
  }

  static bool isValidPhoneNumber(String phoneNumber) {
    bool isValid = true;
    if (phoneNumber.length < 10 || phoneNumber.length > 13) {
      isValid = false;
    }
    if (int.tryParse(phoneNumber) == null) {
      isValid = false;
    }
    if (!phoneNumber.startsWith('08')) {
      isValid = false;
    }
    return isValid;
  }

  static bool isValidEmail(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  static String properCase(String s) =>
      s[0].toUpperCase() + s.substring(1).toLowerCase();

  static void openWhatsapp(String phoneNumber, {Function onFailed}) async {
    String url() {
      if (Platform.isIOS) {
        return "whatsapp://wa.me/$phoneNumber";
      } else {
        return "whatsapp://send?phone=$phoneNumber";
      }
    }

    if (await canLaunch(url())) {
      await launch(url());
    } else {
      if (onFailed != null) {
        onFailed();
      }
    }
  }

  static final List<TextInputFormatter> filterEmoticonInputFormatter = [
    FilteringTextInputFormatter.deny(RegExp(
      '(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])',
    ))
  ];

  static formatDate(String strDatetime) {
    return DateFormat('MMMM dd, yyyy').format(DateTime.parse(strDatetime));
  }

  static encodeHmac256Encode(String message, String key) {
    List<int> messageBytes = utf8.encode(message);
    List<int> encodeKey = utf8.encode(key);
    Hmac hmac = new Hmac(sha256, encodeKey);
    Digest digest = hmac.convert(messageBytes);
    return digest;
  }

  launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  String generateSignature(String _method, String url, {dynamic body}) {
    String time = DateTime.now().millisecondsSinceEpoch.toString();
    String method = _method.toUpperCase();
    String path = '$url';
    String rawSignature = '$time:$method:$path:'; //${body ?? ""}';
    final signature = encodeHmac256Encode(rawSignature, AppConstant.kSecretKey);
    String finalSignature = '$time:$signature';
    return finalSignature;
  }
}
