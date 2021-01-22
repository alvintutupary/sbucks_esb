import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sbucks/src/screens/login_screen/login_screen_widget/login_set_pin.dart';
import 'package:sbucks/src/widgets/common/wide_button.dart';
import 'package:sbucks/src/utils/size_config.dart';
import 'package:sbucks/src/models/request_otp_result_model.dart';
import 'package:sbucks/src/widgets/common/app_spacer.dart';
import 'package:sbucks/src/blocs/account_bloc.dart';
import 'package:sbucks/src/blocs/app_bloc.dart';
import 'package:provider/provider.dart';

class LoginEmailOTP extends StatefulWidget {
  static const kRouteName = '/LoginEmailOTP';
  final RequestOtpResult data;
  const LoginEmailOTP(this.data);

  @override
  _LoginEmailOTPState createState() => _LoginEmailOTPState();
}

class _LoginEmailOTPState extends State<LoginEmailOTP> {
  var onTapRecognizer;

  TextEditingController textEditingController = TextEditingController();

  StreamController<ErrorAnimationType> errorController;

  bool hasError = false;
  String currentText = "";
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  String newAccessToken;

  @override
  void initState() {
    newAccessToken = widget.data.accessToken;
    onTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.pop(context);
      };
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final accountBloc = Provider.of<AccountBloc>(context, listen: false);
    onConfirmPin() async {
      formKey.currentState.validate();
      if (currentText.length != 6) {
        errorController.add(ErrorAnimationType.shake);
      } else {
        final resValidate =
            await accountBloc.validateOtp(currentText, newAccessToken);
        if (resValidate?.body ?? false) {
          appBloc.setToken(widget.data.accessToken);
          Navigator.pushNamed(
            context,
            LoginSetPin.kRouteName,
          );
        } else {
          errorController.add(ErrorAnimationType.shake);
        }
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      key: scaffoldKey,
      body: GestureDetector(
        onTap: () {},
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            children: <Widget>[
              AppSpacer.vSpacing(30),
              Padding(
                padding: EdgeInsets.all(8.scs),
                child: Text(
                  'A message with a verification  code has been sent to your ${widget.data.email}. Enter the code to continue',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 22.scs),
                  textAlign: TextAlign.center,
                ),
              ),
              AppSpacer.vSpacing(10),
              Form(
                key: formKey,
                child: Padding(
                    padding: EdgeInsets.all(8.scs),
                    child: PinCodeTextField(
                      appContext: context,
                      pastedTextStyle: TextStyle(
                        color: Colors.green.shade600,
                        fontWeight: FontWeight.bold,
                      ),
                      length: 6,
                      obscureText: true,
                      obscuringCharacter: '\u2022',
                      animationType: AnimationType.fade,
                      validator: (value) =>
                          value.length != 6 ? "complete the number" : null,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.underline,
                        fieldHeight: 50.sch,
                        fieldWidth: 50.scw,
                        activeFillColor: Colors.grey[300],
                        activeColor: Colors.grey[300],
                        selectedFillColor: Colors.grey[300],
                        selectedColor: Colors.grey[300],
                        inactiveFillColor: Colors.grey[300],
                        inactiveColor: Colors.grey[300],
                      ),
                      cursorColor: Colors.black,
                      animationDuration: Duration(milliseconds: 300),
                      textStyle: TextStyle(fontSize: 20.scs),
                      enableActiveFill: true,
                      errorAnimationController: errorController,
                      controller: textEditingController,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        print(value);
                        setState(() {
                          currentText = value;
                        });
                      },
                      beforeTextPaste: (text) {
                        print("Allowing to paste $text");
                        return true;
                      },
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  hasError ? "*Please fill up all the cells properly" : "",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: "Didn't receive the code? ",
                    style: TextStyle(color: Colors.black54, fontSize: 15),
                    children: [
                      TextSpan(
                          text: " RESEND",
                          recognizer: onTapRecognizer,
                          style: TextStyle(
                              color: Color(0xFF91D3B3),
                              fontWeight: FontWeight.bold,
                              fontSize: 16))
                    ]),
              ),
              SizedBox(
                height: 14,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: WideButton(
                  color: Color(0xff006442),
                  flatButton: true,
                  child: Text(
                    'Confirm',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  circularRadius: 0,
                  onPressed: () => onConfirmPin(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
