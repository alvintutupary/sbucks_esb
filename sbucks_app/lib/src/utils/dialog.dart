// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:provider/provider.dart';
// import 'package:qoqi/src/blocs/account_bloc.dart';
// import 'package:qoqi/src/blocs/order_bloc.dart';
// import 'package:qoqi/src/screens/intro_screen/intro_screen.dart';
// import 'package:qoqi/src/utils/size_config.dart';
// import 'package:qoqi/src/utils/style.dart';
// import 'package:qoqi/src/widgets/common/app_spacer.dart';
// import 'package:qoqi/src/widgets/common/circle_button.dart';
// import 'package:qoqi/src/widgets/common/wide_button.dart';
// import 'package:qoqi/src/widgets/rounded_box.dart';

// Future<bool> showAlertDialog({
//   @required BuildContext context,
//   final bool barrierDismissible = false,
//   final String title,
//   final TextAlign titleAlign = TextAlign.left,
//   final String subtitle,
//   final TextAlign subtitleAlign = TextAlign.left,
//   final String actionLabel = 'OK',
//   final Function onActionLabelPressed,
// }) {
//   return _showBaseDialog(
//     context: context,
//     barrierDismissible: barrierDismissible,
//     child: Column(
//       mainAxisSize: MainAxisSize.min,
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         if (title != null)
//           Padding(
//             padding: EdgeInsets.only(bottom: 16.scw),
//             child: Text(
//               title,
//               style: AppTextStyle.bodyText3.copyWith(
//                 fontWeight: FontWeight.bold,
//               ),
//               textAlign: titleAlign,
//             ),
//           ),
//         if (subtitle != null)
//           Padding(
//             padding: EdgeInsets.only(bottom: 16.scw),
//             child: Text(
//               subtitle,
//               style: AppTextStyle.bodyText1,
//               textAlign: subtitleAlign,
//             ),
//           ),
//         AppSpacer.vSpacing(16.0),
//         _buildActionButton(actionLabel, true, () {
//           if (onActionLabelPressed != null) {
//             onActionLabelPressed();
//           } else {
//             Navigator.pop(context);
//           }
//         }),
//       ],
//     ),
//   );
// }

// Future<bool> showConfirmDialog({
//   @required BuildContext context,
//   final String title,
//   final TextAlign titleAlign = TextAlign.left,
//   final String subtitle,
//   final TextAlign subtitleAlign = TextAlign.left,
//   final bool barrierDismissible = false,
//   final String positiveLabel = 'Ya',
//   final String negativeLabel = 'Tidak',
//   final bool emphasizePositif = false,
// }) {
//   return _showBaseDialog(
//     context: context,
//     barrierDismissible: barrierDismissible,
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         if (title != null)
//           Padding(
//             padding: EdgeInsets.only(bottom: 16.scw),
//             child: Text(
//               title,
//               style: AppTextStyle.bodyText3.copyWith(
//                 fontWeight: FontWeight.bold,
//               ),
//               textAlign: titleAlign,
//             ),
//           ),
//         if (subtitle != null)
//           Padding(
//             padding: EdgeInsets.only(bottom: 16.scw),
//             child: Text(
//               subtitle,
//               style: AppTextStyle.bodyText1,
//               textAlign: subtitleAlign,
//             ),
//           ),
//         AppSpacer.vSpacing(16.0),
//         Expanded(
//           child: Row(
//             children: [
//               Expanded(
//                 child: _buildActionButton(negativeLabel, !emphasizePositif, () {
//                   Navigator.pop(context, false);
//                 }),
//               ),
//               SizedBox(width: 10.0),
//               Expanded(
//                 child: _buildActionButton(positiveLabel, emphasizePositif, () {
//                   Navigator.pop(context, true);
//                 }),
//               ),
//             ],
//           ),
//         ),
//       ],
//     ),
//   );
// }

// Widget _buildActionButton(String label, bool emphasize, Function onPressed) {
//   return WideButton(
//     flatButton: true,
//     color: emphasize ? AppColor.kButtonPrimaryBackground : Colors.transparent,
//     borderSide: BorderSide(
//       width: 1.0,
//       color: AppColor.kBrandColor,
//     ),
//     circularRadius: 10.0,
//     child: Text(
//       label,
//       style: AppTextStyle.bodyText1.copyWith(
//         color: emphasize ? AppColor.kPrimaryText : AppColor.kBrandText,
//         fontWeight: emphasize ? FontWeight.w900 : FontWeight.normal,
//       ),
//     ),
//     onPressed: onPressed,
//   );
// }

// Future<bool> showSuccessDialog({
//   @required BuildContext context,
//   final bool barrierDismissible = false,
//   final String title,
//   final String subtitle,
// }) {
//   return _showBaseTimedDialog(
//     context: context,
//     barrierDismissible: barrierDismissible,
//     assetName: 'assets/images/animated_success.gif',
//     title: title,
//     subtitle: subtitle,
//   );
// }

// Future<bool> showPaymentPaymentDialog({
//   @required BuildContext context,
// }) {
//   return _showBaseTimedDialog(
//     context: context,
//     barrierDismissible: false,
//     assetName: 'assets/images/animated_payment_success.gif',
//     title: 'Pembayaran Berhasil!',
//     subtitle: 'Pesanan Kamu sudah dikonfirmasi',
//   );
// }

// Future<bool> showNetworkImageDialog({
//   @required BuildContext context,
//   String imageUrl,
// }) {
//   return showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return GestureDetector(
//         onTap: () {
//           Navigator.pop(context);
//         },
//         child: Stack(
//           children: [
//             Positioned(
//               top: 12.scw,
//               right: 12.scw,
//               child: CircleButton(
//                 diameter: 32.scw,
//                 backgroundColor: AppColor.kNavigationButtonBackground,
//                 splashColor: AppColor.kNavigationButtonBackground,
//                 child: Icon(
//                   Icons.close,
//                   color: Colors.white,
//                   size: 22.scs,
//                 ),
//               ),
//             ),
//             Center(
//               child: Container(
//                 padding: EdgeInsets.symmetric(horizontal: 16.scw),
//                 color: Colors.transparent,
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(10.0),
//                   child: Image.network(imageUrl),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       );
//     },
//   );
// }

// Future<void> showNoGpsPermissionError(BuildContext context) async {
//   final openSetting = await showConfirmDialog(
//     context: context,
//     title: 'Lokasi kamu tidak terdeteksi',
//     subtitle:
//         'Pengaturan privasi ponsel kamu menghalangi aplikasi untuk mendeteksi lokasi. Ubah pengaturan privasi poselmu dulu, ya!',
//     titleAlign: TextAlign.center,
//     subtitleAlign: TextAlign.center,
//     positiveLabel: 'Pengaturan',
//     negativeLabel: Platform.isAndroid ? 'Keluar' : 'Lanjutkan',
//     emphasizePositif: true,
//   );

//   if (openSetting) {
//     await Geolocator.openAppSettings();
//   }
// }

// Future<void> showErrorDialog(BuildContext context, String errorMessage,
//     {Function onRetry}) async {
//   String image, title, subtitle, buttonText;
//   Function onButtonPressed;

//   if (errorMessage.contains('internet')) {
//     image = 'assets/images/error_internet.png';
//     title = 'Duh, internet putus, nih';
//     subtitle = 'Periksa koneksi kamu untuk melanjutkan';
//     buttonText = 'Coba lagi';
//   } else if (errorMessage.contains('Unauthorised')) {
//     image = 'assets/images/error_unauthorised.png';
//     title = 'Yuk, masuk lagi!';
//     subtitle =
//         'Kamu keluar dari aplikasi karena satu akun hanya bisa digunakan di satu handphone';
//     buttonText = 'Masuk';
//   } else {
//     image = 'assets/images/error_system.png';
//     title = 'Maaf, halaman ini error';
//     subtitle = 'Silahkan tunggu beberapa saat lagi';
//     buttonText = 'Coba lagi';
//   }

//   if (errorMessage.contains('Unauthorised')) {
//     onButtonPressed = () {
//       final accountBloc = Provider.of<AccountBloc>(context, listen: false);
//       final orderBloc = Provider.of<OrderBloc>(context, listen: false);
//       accountBloc.logout();
//       orderBloc.initOrderData();
//       Navigator.pushNamedAndRemoveUntil(
//         context,
//         IntroScreen.kRouteName,
//         (r) => false,
//       );
//     };
//   } else {
//     onButtonPressed = () {
//       Navigator.pop(context);
//       if (onRetry != null) {
//         onRetry();
//       }
//     };
//   }

//   await showModalBottomSheet(
//     context: context,
//     isScrollControlled: true,
//     builder: (BuildContext context) {
//       return Container(
//         padding: EdgeInsets.fromLTRB(16.scw, 2.scw, 16.scw, 16.scw),
//         decoration: BoxDecoration(
//           color: AppColor.kBottomSheetBackground,
//           borderRadius: BorderRadius.vertical(
//             top: Radius.circular(20.scw),
//           ),
//         ),
//         child: IntrinsicHeight(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Align(
//                 child: Container(
//                   width: 55.scw,
//                   padding: EdgeInsets.only(top: 6.scw),
//                   child: Column(
//                     children: [
//                       Divider(height: 4.scw, thickness: 2.0),
//                       Divider(height: 4.scw, thickness: 2.0),
//                     ],
//                   ),
//                 ),
//               ),
//               AppSpacer.vSpacing(20.0, usingWidth: true),
//               Align(
//                 child: Image.asset(
//                   image,
//                   height: 150.scw,
//                 ),
//               ),
//               AppSpacer.vSpacing(20.0, usingWidth: true),
//               Text(
//                 title,
//                 style: AppTextStyle.headline6.copyWith(
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               AppSpacer.vSpacing(4.0, usingWidth: true),
//               Text(
//                 subtitle,
//                 style: AppTextStyle.bodyText1,
//               ),
//               AppSpacer.vSpacing(30.0, usingWidth: true),
//               WideButton(
//                 flatButton: true,
//                 circularRadius: 10.0,
//                 child: Padding(
//                   padding: EdgeInsets.all(4.scw),
//                   child: Text(
//                     buttonText,
//                     style: AppTextStyle.button.copyWith(
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//                 onPressed: onButtonPressed,
//               ),
//             ],
//           ),
//         ),
//       );
//     },
//   );

//   if (onRetry != null) {
//     onRetry();
//   }
// }

// Future<bool> _showBaseDialog({
//   @required BuildContext context,
//   final bool barrierDismissible = false,
//   Widget child,
// }) {
//   return showDialog(
//     context: context,
//     barrierDismissible: barrierDismissible,
//     builder: (BuildContext context) {
//       return Dialog(
//         elevation: 0.0,
//         backgroundColor: Colors.transparent,
//         child: RoundedBox(
//           contentPadding: EdgeInsets.all(16.scw),
//           color: AppColor.kPrimaryBackground,
//           child: IntrinsicHeight(child: child),
//         ),
//       );
//     },
//   );
// }

// Future<bool> _showBaseTimedDialog({
//   @required BuildContext context,
//   final bool barrierDismissible = false,
//   final String assetName,
//   final String title,
//   final String subtitle,
// }) {
//   return showDialog(
//     context: context,
//     barrierDismissible: barrierDismissible,
//     builder: (context) {
//       imageCache.clear();
//       Future.delayed(Duration(seconds: 3), () {
//         Navigator.pop(context);
//       });

//       return Dialog(
//         elevation: 0.0,
//         backgroundColor: Colors.transparent,
//         child: RoundedBox(
//           contentPadding: EdgeInsets.symmetric(
//             vertical: 50.scw,
//             horizontal: 16.scw,
//           ),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Center(
//                 child: Image.asset(
//                   assetName,
//                   height: 150.0,
//                   width: 150.0,
//                 ),
//               ),
//               AppSpacer.vSpacing(30.scw),
//               if (title != null)
//                 Text(
//                   title,
//                   textAlign: TextAlign.center,
//                   style: AppTextStyle.bodyText3.copyWith(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               if (subtitle != null)
//                 Text(
//                   subtitle,
//                   textAlign: TextAlign.center,
//                   style: AppTextStyle.bodyText2,
//                 ),
//             ],
//           ),
//         ),
//       );
//     },
//   );
// }

// Future<bool> showAlertBottomSheet({
//   @required BuildContext context,
//   final bool barrierDismissible = false,
//   final String title,
//   final String image,
//   final String subtitle,
//   final String actionLabel = 'OK',
// }) async {
//   return showModalBottomSheet(
//     context: context,
//     isScrollControlled: true,
//     builder: (BuildContext context) {
//       return Container(
//         padding: EdgeInsets.fromLTRB(16.scw, 2.scw, 16.scw, 16.scw),
//         decoration: BoxDecoration(
//           color: AppColor.kBottomSheetBackground,
//           borderRadius: BorderRadius.vertical(
//             top: Radius.circular(20.scw),
//           ),
//         ),
//         child: IntrinsicHeight(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Align(
//                 child: Container(
//                   width: 55.scw,
//                   padding: EdgeInsets.only(top: 6.scw),
//                   child: Column(
//                     children: [
//                       Divider(height: 4.scw, thickness: 2.0),
//                       Divider(height: 4.scw, thickness: 2.0),
//                     ],
//                   ),
//                 ),
//               ),
//               AppSpacer.vSpacing(20.0, usingWidth: true),
//               if (image != null)
//                 Padding(
//                   padding: EdgeInsets.only(bottom: 20.scw),
//                   child: Align(
//                     child: Image.asset(
//                       image,
//                       height: 150.scw,
//                     ),
//                   ),
//                 ),
//               if (title != null)
//                 Padding(
//                   padding: EdgeInsets.only(bottom: 4.scw),
//                   child: Text(
//                     title,
//                     style: AppTextStyle.bodyText3.copyWith(
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               if (subtitle != null)
//                 Padding(
//                   padding: EdgeInsets.only(bottom: 15.scw),
//                   child: Text(
//                     subtitle,
//                     style: AppTextStyle.bodyText1,
//                   ),
//                 ),
//               _buildActionButton(actionLabel, true, () {
//                 Navigator.pop(context);
//               }),
//             ],
//           ),
//         ),
//       );
//     },
//   );
// }

// Future<bool> showConfirmBottomSheet({
//   @required BuildContext context,
//   final String title,
//   final String subtitle,
//   final String image,
//   final String positiveLabel = 'Ya',
//   final String negativeLabel = 'Tidak',
//   final bool emphasizePositif = false,
//   final bool isDismissible = true,
// }) async {
//   final result = await showModalBottomSheet(
//     isDismissible: isDismissible,
//     context: context,
//     isScrollControlled: true,
//     builder: (BuildContext context) {
//       return Container(
//         padding: EdgeInsets.fromLTRB(16.scw, 2.scw, 16.scw, 16.scw),
//         decoration: BoxDecoration(
//           color: AppColor.kBottomSheetBackground,
//           borderRadius: BorderRadius.vertical(
//             top: Radius.circular(20.scw),
//           ),
//         ),
//         child: IntrinsicHeight(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Align(
//                 child: Container(
//                   width: 55.scw,
//                   padding: EdgeInsets.only(top: 6.scw),
//                   child: Column(
//                     children: [
//                       Divider(height: 4.scw, thickness: 2.0),
//                       Divider(height: 4.scw, thickness: 2.0),
//                     ],
//                   ),
//                 ),
//               ),
//               AppSpacer.vSpacing(20.0, usingWidth: true),
//               if (image != null)
//                 Padding(
//                   padding: EdgeInsets.only(bottom: 20.scw),
//                   child: Align(
//                     child: Image.asset(
//                       image,
//                       height: 150.scw,
//                     ),
//                   ),
//                 ),
//               if (title != null)
//                 Padding(
//                   padding: EdgeInsets.only(bottom: 4.scw),
//                   child: Text(
//                     title,
//                     style: AppTextStyle.bodyText3.copyWith(
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               if (subtitle != null)
//                 Padding(
//                   padding: EdgeInsets.only(bottom: 4.scw),
//                   child: Text(
//                     subtitle,
//                     style: AppTextStyle.bodyText1,
//                   ),
//                 ),
//               AppSpacer.vSpacing(12.0, usingWidth: true),
//               Expanded(
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: _buildActionButton(
//                           negativeLabel, !emphasizePositif, () {
//                         Navigator.pop(context, false);
//                       }),
//                     ),
//                     SizedBox(width: 10.0),
//                     Expanded(
//                       child: _buildActionButton(positiveLabel, emphasizePositif,
//                           () {
//                         Navigator.pop(context, true);
//                       }),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     },
//   );

//   if (result != null && result == true) {
//     return true;
//   } else {
//     return false;
//   }
// }
