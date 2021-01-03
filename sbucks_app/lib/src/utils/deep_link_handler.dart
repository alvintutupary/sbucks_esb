// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:qoqi/src/blocs/app_bloc.dart';
// import 'package:qoqi/src/blocs/branch_bloc.dart';
// import 'package:qoqi/src/blocs/order_bloc.dart';
// import 'package:qoqi/src/models/payment_response_model.dart';
// import 'package:qoqi/src/models/user_model.dart';
// import 'package:qoqi/src/screens/order_screen/order_screen.dart';
// import 'package:qoqi/src/screens/payment_loading_screen/payment_loading_screen.dart';
// import 'package:qoqi/src/utils/constant.dart';

// void handleDeeplink(BuildContext context, Uri uri) {
//   if (uri.toString().startsWith(AppConstant.kUrlPaymentCallback)) {
//     _navigateToValidatePaymentScreen(context, uri);
//   } else if (uri.toString().startsWith(AppConstant.kUrlOrderScreen)) {
//     _navigateToOrderScreen(context, uri);
//   }
// }

// void _navigateToValidatePaymentScreen(BuildContext context, Uri uri) {
//   final params = uri.queryParameters;
//   String orderId = params['order_id'] ?? params['orderID'];
//   String result = uri.queryParameters['result'];
//   String paymentMethod = uri.pathSegments[1];

//   final response = PaymentResponse(
//     orderId: orderId,
//     paymentMethodId: paymentMethod,
//   );

//   if (result == 'failure') {
//     response.paymentFailed = true;
//     Navigator.pushNamed(
//       context,
//       PaymentLoadingScreen.kRouteName,
//       arguments: response,
//     );
//   } else {
//     Navigator.pushNamed(
//       context,
//       PaymentLoadingScreen.kRouteName,
//       arguments: response,
//     );
//   }
// }

// void _navigateToOrderScreen(BuildContext context, Uri uri) async {
//   String companyBranchCode;
//   User user;
//   if (uri.pathSegments.length == 3) {
//     companyBranchCode = '${uri.pathSegments[1]}/${uri.pathSegments[2]}';
//   }

//   if (appBloc.userToken != null) {
//     user = await appBloc.user.first;
//   }

//   if (companyBranchCode != null && companyBranchCode.length > 0) {
//     final branchBloc = Provider.of<BranchBloc>(context, listen: false);
//     final orderBloc = Provider.of<OrderBloc>(context, listen: false);

//     appBloc.changeActiveCompanyBranchCode(companyBranchCode);
//     branchBloc.fetchBranchData();
//     branchBloc.fetchMenu();
//     branchBloc.resetFilter();
//     orderBloc.changePhoneNumber(user != null ? user.phoneNumber : '');
//     Navigator.pushNamed(context, OrderScreen.kRouteName);
//   }
// }
