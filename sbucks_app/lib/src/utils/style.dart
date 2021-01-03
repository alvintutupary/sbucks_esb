import 'package:flutter/material.dart';
// import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:sbucks/src/utils/size_config.dart';
import 'package:sbucks/src/utils/size_extension.dart';

class AppColor {
  /// Sort the color definition ALPHABETICALLY ORDER.
  /// Put Primary and Accents colors on the top of the list, such as:
  /// kPrimaryBackground, kAccentBackground, kPrimaryText, kAccentText, etc.

  /// Background colors.
  static Color kPrimaryBackground = _kPWhite;
  static Color kAccentBackground = _kPAlabaster;
  static Color kAccountButtonBackground = _kPAzure;
  static Color kActivityTrackOrderButtonBackground = _kPAzure;
  static Color kActivityReorderButtonBackground = _kPYellowOrange;
  static Color kBadgeBackground = _kPSeashell;
  static Color kBadgeSoftBackground = _kPAlabasterApprox;
  static Color kBottomSheetBackground = _kPAlabaster;
  static Color kButtonPrimaryBackground = _kPYellowOrange;
  static Color kButtonDisabledBackground = _kPSilverChaliceApprox;
  static Color kButtonVoucherBackground = _kPAzure;
  static Color kCategorySelectedBackground = _kPNeonCarrotApprox;
  static Color kConfirmMapButtonBackground = _kPAzure;
  static Color kCurrencyBackground = _kPAzure;
  static Color kFloatingSummaryBackground = _kPAzure;
  static Color kNavigationButtonBackground = _kPBlack_50;
  static Color kNavigationButtonBackground2 = _kPSeashell;
  static Color kNewAppNotificationBackground = _kPZumthorApprox;
  static Color kPromoAppliedBackground = _kPOldLaceApprox;
  static Color kPromoAppliedIconBackground = _kPRiceFlowerApprox;
  static Color kPromoScreenBackground = _kPAlabaster;
  static Color kTextFieldBackground = _kPConcrete;
  static Color kVerifiedBackground = _kPRiceFlowerApprox;
  static Color kRegisterPageActiveBackground = _kPAzure;
  static Color kRegisterPageInactiveBackground = _kPSilverApprox;
  static Color kOrderSummaryCopyBackground = _kPSerenadeApprox;
  static Color kOrderSummaryTrackBackground = _kPAzure;
  static Color kConfirmMapPickerBackground = _kPAzure;
  static Color kCallButtonBackground = _kPGreenHazeApprox;

  /// Border colors.
  static Color kLoginRegisterBorder = _kPAzure;
  static Color kActivePromoBorder = _kPYellowOrange;
  static Color kDarkerBorder = _kPMineShaft;
  static Color kFocusedTextFieldBorder = _kPYellowOrange;
  static Color kGeneralBorder = _kPAltoApprox;
  static Color kGreenBorder = _kPRiceFlowerApprox;
  static Color kSoftBorder = _kPSeashell;
  static Color kPromoAppliedBorder = _kPSaffronApprox;

  /// Text colors.
  static Color kPrimaryText = _kPMineShaft;
  static Color kAccentText = _kPWhite;
  static Color kActivityStatusText = _kPSilverChalice;
  static Color kBottomNavigationActiveText = _kPTenn;
  static Color kBottomNavigationInactiveText = _kPBoulderApprox;
  static Color kBrandText = _kPYellowOrange;
  static Color kCategoryText = _kPSilverChaliceApprox;
  static Color kDisabledText = _kPSilverChalice;
  static Color kDialogButtonText = _kPEcstasyApprox;
  static Color kEditAccountText = _kPYellowOrange;
  static Color kGreenText = _kPLima;
  static Color kHyperlinkText = _kPAzure;
  static Color kInclusiveText = _kPGreyApprox;
  static Color kLoginHelpText = _kPGreyApprox;
  static Color kLoginRegisterText = _kPAzure;
  static Color kModifierText = _kPGreyApprox;
  static Color kPlaceholderText = _kPSilverApprox;
  static Color kPriceText = _kPTenn;
  static Color kUnverifiedEmailText = _kPBoulderApprox;
  static Color kVerifiedText = _kPLima;
  static Color kPinTextFieldActiveText = _kPYellowOrange;
  static Color kDeliveryPromoText = _kPAzure;

  /// Object colors.
  static Color kAccountArrowButtonColor = _kPSilverChalice;
  static Color kBannerInactiveBubbleColor = _kPGalleryApprox;
  static Color kBrandColor = _kPYellowOrange;
  static Color kDividerColor = _kPSeashell;
  static Color kLoaderColor = _kPSilverChalice;
  static Color kPaymentChekboxSelectedColor = _kPSunglowApprox;
  static Color kPlaceIconColor = _kPRedApprox;
  static Color kPlaceIconGreenColor = _kPLima;
  static Color kShadowColor = _kPBlack_50;
  static Color kShadowSoftColor = _kPBlack_20;
  static Color kShadowSoftestColor = _kPBlack_05;
  static Color kStatusBarPrimaryColor = _kPWhite;
  static Color kStatusBarAccentColor = _kPTransparent;
  static Color kHelpOrderFeeColor = _kPSilverChaliceApprox;
  static Color kSavedIconColor = _kPBoulderApprox;
  static Color kAlternateQtySpinnerColor = _kPAzure;

  /// General colors.
  static Color kDangerColor = _kPThunderbirdApprox;
  static Color kSuccessColor = Color(0xFF63D71C);
  static Color kWarningColor = Color(0xFFF39C12);

  /// Color palettes. ALPHABETICALLY ORDER!!!.
  /// Naming helper using http://chir.ag/projects/name-that-color/
  static Color _kPAlabaster = Color(0xFFFAFAFA);
  static Color _kPAlabasterApprox = Color(0xFFF9F9F9);
  static Color _kPAltoApprox = Color(0xFFD0D0D0);
  static Color _kPAzure = Color(0xFF315FAD);
  static Color _kPBoulderApprox = Color(0xFF7D7D7D);
  static Color _kPBlack_50 = Color.fromRGBO(0, 0, 0, 0.5);
  static Color _kPBlack_20 = Color.fromRGBO(0, 0, 0, 0.2);
  static Color _kPBlack_05 = Color.fromRGBO(0, 0, 0, 0.05);
  static Color _kPConcrete = Color(0xFFF2F2F2);
  static Color _kPEcstasyApprox = Color(0xFFFB6C0B);
  static Color _kPGalleryApprox = Color(0xFFEDEDED);
  static Color _kPGreyApprox = Color(0xFF8D8D8D);
  static Color _kPGreenHazeApprox = Color(0xFF009865);
  static Color _kPLima = Color(0xFF63D71C);
  static Color _kPMineShaft = Color(0xFF2D2D2D);
  static Color _kPNeonCarrotApprox = Color(0xFFFC9E38);
  static Color _kPOldLaceApprox = Color(0xFFFDFAED);
  static Color _kPRedApprox = Color(0xFFE10000);
  static Color _kPRiceFlowerApprox = Color(0xFFF0FFE7);
  static Color _kPSaffronApprox = Color(0xFFF4D035);
  static Color _kPSerenadeApprox = Color(0xFFFFF6E7);
  static Color _kPSeashell = Color(0xFFF1F1F1);
  static Color _kPSilverApprox = Color(0xFFCACACA);
  static Color _kPSilverChalice = Color(0xFFB0B0B0);
  static Color _kPSilverChaliceApprox = Color(0xFFAAAAAA);
  static Color _kPSunglowApprox = Color(0xFFFFBD2F);
  static Color _kPTenn = Color(0xFFD25800);
  static Color _kPThunderbirdApprox = Color(0xFFCE1212);
  static Color _kPTransparent = Colors.transparent;
  static Color _kPWhite = Color(0xFFFFFFFF);
  static Color _kPYellowOrange = Color(0xFFFFBA3E);
  static Color _kPZumthorApprox = Color(0xFFEBF2FF);
}

class AppTextStyle {
  static final AppTextStyle _instance = AppTextStyle._internal();

  // static TextStyle headline1;
  // static TextStyle headline2;
  // static TextStyle headline3;
  // static TextStyle headline4;
  static TextStyle headline5;
  static TextStyle headline6;
  static TextStyle subtitle1;
  static TextStyle subtitle2;
  static TextStyle bodyText0;
  static TextStyle bodyText1;
  static TextStyle bodyText2;
  static TextStyle bodyText3;
  static TextStyle button;
  static TextStyle overline;

  AppTextStyle._internal();

  factory AppTextStyle(
    BuildContext context, {
    double designWidth,
    double designHeight,
    double screenWidth,
    double screenHeight,
  }) {
    SizeConfig(
      context,
      designWidth: designWidth,
      designHeight: designHeight,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
    );

    // if (headline6 == null) {
    final textTheme = Theme.of(context).textTheme;
    headline5 = textTheme.headline5.copyWith(
      color: AppColor.kPrimaryText,
      fontSize: 24,
    );
    headline6 = textTheme.headline6.copyWith(
      color: AppColor.kPrimaryText,
      fontSize: 20,
    );
    subtitle2 = textTheme.subtitle2.copyWith(
      color: AppColor.kPrimaryText,
      fontSize: 10,
      letterSpacing: 0.25,
    );
    bodyText0 = textTheme.bodyText1.copyWith(
      color: AppColor.kPrimaryText,
      fontSize: 10,
      letterSpacing: 0.25,
    );
    bodyText1 = textTheme.bodyText1.copyWith(
      color: AppColor.kPrimaryText,
      fontSize: 12,
      letterSpacing: 0.25,
    );
    bodyText2 = textTheme.bodyText1.copyWith(
      color: AppColor.kPrimaryText,
      fontSize: 14,
      letterSpacing: 0.25,
    );
    bodyText3 = textTheme.bodyText1.copyWith(
      color: AppColor.kPrimaryText,
      fontSize: 16,
      letterSpacing: 0.25,
    );
    button = textTheme.button.copyWith(
      color: AppColor.kPrimaryText,
      fontSize: 14,
    );
    overline = textTheme.overline.copyWith(
      color: AppColor.kPrimaryText,
      fontSize: 10,
    );
    // }

    return _instance;
  }

  // static void setStatusBarColor(
  //     Color color, bool statusBarWhiteForeground) async {
  //   await FlutterStatusbarcolor.setStatusBarColor(color, animate: true);
  //   await FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
  // }
}
