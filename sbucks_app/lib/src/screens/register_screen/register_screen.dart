import 'package:flutter/material.dart';
import 'package:sbucks/src/widgets/common/app_spacer.dart';
import 'package:sbucks/src/widgets/common/app_text_field.dart';
import 'package:sbucks/src/widgets/common/wide_button.dart';
import 'package:sbucks/src/utils/size_config.dart';
import 'package:sbucks/src/screens/register_screen/register_screen_widgets/register_otp.dart';
import 'package:sbucks/src/screens/register_screen/register_screen_widgets/register_agreement.dart';

class RegisterScreen extends StatefulWidget {
  static const kRouteName = '/register';
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = new GlobalKey<FormState>();
  String _phone,
      _email,
      _password,
      _confirmPassword,
      _firstName,
      _lastName,
      _dateOfBirth,
      _favoriteBaverage;
  bool _isAgree = false;

  @override
  Widget build(BuildContext context) {
    final phoneField = TextFormField(
      autofocus: false,
      keyboardType: TextInputType.number,
      validator: (value) => value.length < 9 || value.length > 13
          ? "Please enter password"
          : null,
      onSaved: (value) => _phone = value,
      decoration:
          buildInputDecoration(hintText: "ex. 0812345678", icon: Icons.phone),
    );

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

    final confirmPasswordField = TextFormField(
      autofocus: false,
      validator: (value) => value.isEmpty ? "Your password is required" : null,
      onSaved: (value) => _confirmPassword = value,
      obscureText: true,
      decoration:
          buildInputDecoration(hintText: "Confirm password", icon: Icons.lock),
    );

    final firstNameField = TextFormField(
      autofocus: false,
      validator: (value) =>
          value.isEmpty ? "Your first name is required" : null,
      onSaved: (value) => _firstName = value,
      decoration: buildInputDecoration(hintText: "First Name"),
    );

    final lastNameField = TextFormField(
      autofocus: false,
      validator: (value) => value.isEmpty ? "Your last name is required" : null,
      onSaved: (value) => _lastName = value,
      decoration: buildInputDecoration(hintText: "Last Name"),
    );

    final dateOfBirthField = TextFormField(
      autofocus: false,
      keyboardType: TextInputType.datetime,
      validator: (value) =>
          value.isEmpty ? "Your date of birthfield is required" : null,
      onSaved: (value) => _dateOfBirth = value,
      decoration: buildInputDecoration(hintText: "Click to pick date"),
    );

    final favoriteBaverageField = TextFormField(
      autofocus: false,
      validator: (value) =>
          value.isEmpty ? "Your favorite baverage field is required" : null,
      onSaved: (value) => _favoriteBaverage = value,
      decoration: buildInputDecoration(hintText: "Your favorite baverage"),
    );

    // var loading = Row(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: <Widget>[
    //     CircularProgressIndicator(),
    //     Text(" Registering ... Please wait")
    //   ],
    // );

    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.sch, horizontal: 15.scw),
        child: ListView(children: <Widget>[
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppSpacer.vSpacing(15.0),
                label("Please Input your Mobile phone number"),
                AppSpacer.vSpacing(5.0),
                phoneField,
                AppSpacer.vSpacing(15.0),
                label("Please input your account information"),
                AppSpacer.vSpacing(5.0),
                emailField,
                AppSpacer.vSpacing(5.0),
                passwordField,
                AppSpacer.vSpacing(5.0),
                confirmPasswordField,
                AppSpacer.vSpacing(15.0),
                label("Please input your personal  detail"),
                AppSpacer.vSpacing(5.0),
                firstNameField,
                AppSpacer.vSpacing(5.0),
                lastNameField,
                AppSpacer.vSpacing(5.0),
                dateOfBirthField,
                AppSpacer.vSpacing(5.0),
                favoriteBaverageField,
                AppSpacer.vSpacing(15.0),
                // Row(
                //   children: [
                //     Checkbox(
                //       onChanged: (value) {},
                //     ),
                //     Text('I agree with term and condition')
                //   ],
                // ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Checkbox(
                      value: _isAgree,
                      onChanged: (bool value) {
                        setState(() {
                          _isAgree = value;
                        });
                      },
                    ),
                    Text(
                      "I agree with this ",
                      style: TextStyle(fontSize: 14.scs),
                    ),
                    InkWell(
                      child: Text('term and condition',
                          style:
                              TextStyle(color: Colors.blue, fontSize: 14.scs)),
                      onTap: () {
                        showDialog(
                            context: context,
                            child: AlertDialog(
                              content: RegisterAgreement(),
                            ));
                      },
                    )
                  ],
                ),
                WideButton(
                  color: Color(0xff006442),
                  flatButton: true,
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  circularRadius: 0,
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      Navigator.pushNamed(context, RegisterOTP.kRouteName);
                      _formKey.currentState.save();
                    }
                    print("""
                        phoneField : $_phone,\n
                        emailField : $_email,\n
                        passwordField : $_password,\n
                        confirmPasswordField : $_confirmPassword,\n
                        firstNameField : $_firstName,\n
                        lastNameField : $_lastName,\n
                        dateOfBirthField : $_dateOfBirth,\n
                        favoriteBaverageField : $_favoriteBaverage,\n
                              """);
                  },
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
