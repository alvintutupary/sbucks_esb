import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sbucks/src/screens/login_screen/login_screen_widget/login_confirm_pin.dart';
import 'package:sbucks/src/widgets/common/wide_button.dart';
import 'package:sbucks/src/utils/size_config.dart';
import 'package:sbucks/src/widgets/common/app_spacer.dart';

class LoginSetPin extends StatefulWidget {
  static const kRouteName = '/LoginSetPin';
  @override
  _LoginSetPinState createState() => _LoginSetPinState();
}

class _LoginSetPinState extends State<LoginSetPin> {
  var onTapRecognizer;

  TextEditingController textEditingController = TextEditingController();

  StreamController<ErrorAnimationType> errorController;

  bool hasError = false;
  String currentText = "";
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
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

  void onSetPin(
    BuildContext context,
    GlobalKey<FormState> formKey,
    String currentText,
    StreamController<ErrorAnimationType> errorController,
  ) {
    formKey.currentState.validate();
    if (currentText.length != 6) {
      errorController.add(ErrorAnimationType.shake);
    } else {
      Navigator.pushNamed(
        context,
        LoginConfirmPin.kRouteName,
        arguments: currentText,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
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
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.all(8.scs),
                child: Text(
                  'Set your new passcode',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22.scs,
                      color: Color(0xff006442)),
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
              Text(
                'Passcode will be required to open Starbucks app.',
                style: TextStyle(
                  fontSize: 20.scs,
                ),
                textAlign: TextAlign.center,
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
                  onPressed: () =>
                      onSetPin(context, formKey, currentText, errorController),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
