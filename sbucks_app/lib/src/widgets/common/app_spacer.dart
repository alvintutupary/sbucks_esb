import 'package:flutter/material.dart';
import 'package:sbucks/src/utils/size_config.dart';

class AppSpacer {
  static SizedBox hSpacing(num width) {
    return SizedBox(width: width.scw);
  }

  static SizedBox vSpacing(num height, {bool usingWidth = false}) {
    if (usingWidth) {
      return SizedBox(height: height.scw);
    }
    return SizedBox(height: height.sch);
  }
}
