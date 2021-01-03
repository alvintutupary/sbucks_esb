import 'package:flutter/material.dart';
export 'size_extension.dart';

class SizeConfig {
  static const double _defaultDesignWidth = 1080;
  static const double _defaultDesignHeight = 1920;
  static const bool _defaultAllowFontScaling = false;

  static final SizeConfig _instance = SizeConfig._internal();
  static MediaQueryData _mediaQueryData;
  static double _designWidth;
  static double _designHeight;
  static double _screenWidth;
  static double _screenHeight;
  static bool _allowFontScaling;
  static double _textScaleFactor;
  static double _scaleWidth;
  static double _scaleHeight;

  SizeConfig._internal();

  factory SizeConfig(
    BuildContext context, {
    double designWidth,
    double designHeight,
    double screenWidth,
    double screenHeight,
    bool allowFontScaling,
  }) {
    // if (_mediaQueryData == null) {
    _mediaQueryData = MediaQuery.of(context);
    _designWidth = 360;
    _designHeight = 592; //designHeight ?? _defaultDesignHeight;
    _screenWidth = _mediaQueryData.size.shortestSide;
    _screenHeight = _mediaQueryData.size.longestSide;
    _allowFontScaling = allowFontScaling ?? _defaultAllowFontScaling;
    _textScaleFactor = _mediaQueryData.textScaleFactor;
    _scaleWidth = _screenWidth / _designWidth;
    _scaleHeight = _screenHeight / _designHeight;
    // }

    return _instance;
  }

  static double get designWidth => _designWidth;

  static double get designHeight => _designHeight;

  static bool get allowFontScaling => _allowFontScaling;

  static double get textScaleFactor => _textScaleFactor;

  static num width(num width) => width * _scaleWidth;

  static num height(num height) => height * _scaleHeight;

  static num size(num fontSize) =>
      fontSize * _scaleWidth / (_allowFontScaling ? 1 : _textScaleFactor);

  /// Return SizedBox with defined width.
  static SizedBox hSpacing(double width) {
    return SizedBox(width: SizeConfig.width(width));
  }

  /// Return SizedBox with defined height.
  static SizedBox vSpacing(double height) {
    return SizedBox(height: SizeConfig.width(height));
  }

  static void info() {
    print(
      'DesignWidth: $_designWidth, DesignHeight: $_designHeight, ' +
          'ScreenWidth: $_screenWidth, ScreenHeight: $_screenHeight, ' +
          'AllowFontScaling: $_allowFontScaling, TextScaleFactor: $_textScaleFactor',
    );
  }
}
