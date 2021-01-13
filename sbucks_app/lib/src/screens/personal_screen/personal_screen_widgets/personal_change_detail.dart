import 'package:flutter/material.dart';
import 'package:sbucks/src/widgets/common/app_text_field.dart';
import 'package:sbucks/src/widgets/common/wide_button.dart';
import 'package:sbucks/src/screens/register_screen/register_screen_widgets/register_otp.dart';
import 'package:sbucks/src/screens/register_screen/register_screen_widgets/register_agreement.dart';

class PersonalChangeDetail extends StatefulWidget {
  static const kRouteName = '/register';
  @override
  _PersonalChangeDetailState createState() => _PersonalChangeDetailState();
}

class _PersonalChangeDetailState extends State<PersonalChangeDetail> {
  final _formKey = new GlobalKey<FormState>();
  String _firstName, _lastName, _phone, _favoriteBaverage;
  bool _isAgree = false;

  @override
  Widget build(BuildContext context) {
    final phoneField = TextFormField(
      autofocus: false,
      keyboardType: TextInputType.number,
      validator: (value) => value.length < 9 || value.length > 13
          ? "Please enter phone number"
          : null,
      onSaved: (value) => _phone = value,
      decoration: buildInputDecoration(hintText: "ex. 0812345678"),
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
      appBar: AppBar(
        title: Text('Change Profile'),
      ),
      body: Container(
        padding: EdgeInsets.all(40.0),
        child: ListView(children: <Widget>[
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                label("Please input your personal  detail"),
                SizedBox(height: 5.0),
                firstNameField,
                SizedBox(height: 5.0),
                lastNameField,
                SizedBox(height: 5.0),
                phoneField,
                SizedBox(height: 5.0),
                favoriteBaverageField,
                SizedBox(height: 15.0),
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
                    Text("I agree with this "),
                    InkWell(
                      child: Text('term and condition',
                          style: TextStyle(color: Colors.blue)),
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
                    'Update',
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
    );
  }
}
