import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sbucks/src/blocs/barcode_bloc.dart';
import 'package:sbucks/src/screens/register_screen/register_screen.dart';
import 'package:sbucks/src/screens/register_screen/register_screen_widgets/register_otp.dart';
import 'package:sbucks/src/utils/style.dart';
import 'package:sbucks/src/widgets/common/app_spacer.dart';
import 'package:sbucks/src/widgets/common/app_text_field.dart';

class LoginScreen extends StatefulWidget {
  static const kRouteName = '/login';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = new GlobalKey<FormState>();
  String _email, _password;

  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
      autofocus: false,
      validator: validateEmail,
      onSaved: (value) => _email = value,
      decoration: buildInputDecoration(hintText: "Email", icon: Icons.email),
    );

    final passwordField = TextFormField(
      autofocus: false,
      obscureText: true,
      validator: (value) => value.isEmpty ? "Please enter password" : null,
      onSaved: (value) => _password = value,
      decoration: buildInputDecoration(hintText: "Password", icon: Icons.lock),
    );
    return Scaffold(
      backgroundColor: AppColor.kPrimaryBackground,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/img/bg-5.jpg'), fit: BoxFit.cover),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RaisedButton(
                      onPressed: () => Navigator.pushNamed(
                          context, RegisterScreen.kRouteName),
                      child: Text('Join Now'),
                    ),
                    RaisedButton(
                      onPressed: () => showDialog(
                          barrierDismissible: false,
                          context: context,
                          child: AlertDialog(
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Login'),
                                AppSpacer.vSpacing(5),
                                emailField,
                                AppSpacer.vSpacing(5),
                                passwordField,
                                AppSpacer.vSpacing(10),
                                Row(
                                  children: [
                                    FlatButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: Text('Cancel')),
                                    FlatButton(
                                        onPressed: () {
                                          return Navigator.pushNamed(
                                              context, RegisterOTP.kRouteName);
                                        },
                                        child: Text('Submit'))
                                  ],
                                )
                              ],
                            ),
                          )),
                      child: Text('Sign In'),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
