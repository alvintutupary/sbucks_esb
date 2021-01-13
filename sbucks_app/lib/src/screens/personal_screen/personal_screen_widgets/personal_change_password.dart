import 'package:flutter/material.dart';
import 'package:sbucks/src/widgets/common/app_text_field.dart';
import 'package:sbucks/src/widgets/common/wide_button.dart';
import 'package:sbucks/src/screens/register_screen/register_screen_widgets/register_otp.dart';
import 'package:sbucks/src/screens/register_screen/register_screen_widgets/register_agreement.dart';

class PersonalChangePassword extends StatefulWidget {
  static const kRouteName = '/register';
  @override
  _PersonalChangePasswordState createState() => _PersonalChangePasswordState();
}

class _PersonalChangePasswordState extends State<PersonalChangePassword> {
  final _formKey = new GlobalKey<FormState>();
  String _oldPassword, _password, _confirmPassword;
  bool _isAgree = false;

  @override
  Widget build(BuildContext context) {
    final oldPasswordField = TextFormField(
      autofocus: false,
      obscureText: true,
      validator: (value) => value.isEmpty ? "Please enter password" : null,
      onSaved: (value) => _oldPassword = value,
      decoration: buildInputDecoration(hintText: "Password", icon: Icons.lock),
    );

    final passwordField = TextFormField(
      autofocus: false,
      obscureText: true,
      validator: (value) => value.isEmpty ? "Please enter password" : null,
      onSaved: (value) => _password = value,
      decoration: buildInputDecoration(hintText: "Password", icon: Icons.lock),
    );

    final confirmPasswordField = TextFormField(
      autofocus: false,
      validator: (value) => value.isEmpty
          ? "Your password is required"
          : value != _password
              ? "Your password is not match"
              : null,
      onSaved: (value) => _confirmPassword = value,
      obscureText: true,
      decoration:
          buildInputDecoration(hintText: "Confirm password", icon: Icons.lock),
    );

    // var loading = Row(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: <Widget>[
    //     CircularProgressIndicator(),
    //     Text(" Registering ... Please wait")
    //   ],
    // );

    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(40.0),
          child: ListView(children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15.0),
                  label("charlie_evolution15@yahoo.com"),
                  SizedBox(height: 5.0),
                  oldPasswordField,
                  SizedBox(height: 5.0),
                  passwordField,
                  SizedBox(height: 15.0),
                  confirmPasswordField,
                  SizedBox(height: 15.0),
                  // Row(
                  //   children: [
                  //     Checkbox(
                  //       onChanged: (value) {},
                  //     ),
                  //     Text('I agree with term and condition')
                  //   ],
                  // ),
                  WideButton(
                    color: Color(0xff006442),
                    flatButton: true,
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    circularRadius: 0,
                    onPressed: () {},
                  ),
                  WideButton(
                    color: Color(0xff006442),
                    flatButton: true,
                    child: Text(
                      'Submit',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    circularRadius: 0,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
