import 'package:flutter/material.dart';
import 'package:sbucks/src/widgets/common/app_text_field.dart';
import 'package:sbucks/src/widgets/common/wide_button.dart';
import 'package:sbucks/src/utils/size_config.dart';
import 'package:sbucks/src/utils/style.dart';
import 'package:sbucks/src/widgets/common/app_spacer.dart';
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
        padding: EdgeInsets.all(10.scs),
        child: ListView(children: <Widget>[
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Please input your personal  detail",
                  style: TextStyle(
                    fontSize: 20.scs,
                  ),
                ),
                AppSpacer.vSpacing(5),
                firstNameField,
                AppSpacer.vSpacing(5),
                lastNameField,
                AppSpacer.vSpacing(5),
                phoneField,
                AppSpacer.vSpacing(5),
                favoriteBaverageField,
                SizedBox(height: 15.0),
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
                      "I wish to receive direct marketing \ncommunication from Starbucks Indonesia",
                      style: TextStyle(
                        fontSize: 15.scs,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  ],
                ),
                WideButton(
                  color: AppColor.kSecondaryBrand,
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
                  color: AppColor.kSecondaryBrand,
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
