import 'package:flutter/material.dart';
import 'package:sbucks/src/widgets/common/app_text_field.dart';
import 'package:sbucks/src/utils/size_config.dart';
import 'package:sbucks/src/widgets/common/app_spacer.dart';
import 'dart:io';

class PremiumReview extends StatefulWidget {
  String photoIdPath, selfieIdPath;
  PremiumReview(this.photoIdPath, this.selfieIdPath);

  @override
  _PremiumReviewState createState() => _PremiumReviewState();
}

class _PremiumReviewState extends State<PremiumReview> {
  String _firstName,
      _lastNamed,
      _idCard,
      _idNumber,
      _dateOfBirth,
      _gender,
      _address,
      _city,
      _region,
      _distric,
      _village,
      _zip,
      _nationality,
      _occupation;

  @override
  Widget build(BuildContext context) {
    final firstNameField = TextFormField(
      autofocus: false,
      validator: (value) => value.isEmpty ? "Please firstName password" : null,
      onSaved: (value) => _firstName = value,
      decoration: buildInputDecoration(hintText: "firstName"),
    );

    final lastNamedField = TextFormField(
      autofocus: false,
      validator: (value) => value.isEmpty ? "Please lastNamed password" : null,
      onSaved: (value) => _lastNamed = value,
      decoration: buildInputDecoration(hintText: "lastNamed"),
    );
    final idCardField = TextFormField(
      autofocus: false,
      validator: (value) => value.isEmpty ? "Please idCard password" : null,
      onSaved: (value) => _idCard = value,
      decoration: buildInputDecoration(hintText: "idCard"),
    );

    final idNumberField = TextFormField(
      autofocus: false,
      validator: (value) => value.isEmpty ? "Please idNumber password" : null,
      onSaved: (value) => _idNumber = value,
      decoration: buildInputDecoration(hintText: "idNumber"),
    );
    final dateOfBirthField = TextFormField(
      autofocus: false,
      validator: (value) =>
          value.isEmpty ? "Please dateOfBirth password" : null,
      onSaved: (value) => _dateOfBirth = value,
      decoration: buildInputDecoration(hintText: "dateOfBirth"),
    );

    final genderField = TextFormField(
      autofocus: false,
      validator: (value) => value.isEmpty ? "Please gender password" : null,
      onSaved: (value) => _gender = value,
      decoration: buildInputDecoration(hintText: "gender"),
    );
    final addressField = TextFormField(
      autofocus: false,
      validator: (value) => value.isEmpty ? "Please address password" : null,
      onSaved: (value) => _address = value,
      decoration: buildInputDecoration(hintText: "address"),
    );

    final cityField = TextFormField(
      autofocus: false,
      validator: (value) => value.isEmpty ? "Please city password" : null,
      onSaved: (value) => _city = value,
      decoration: buildInputDecoration(hintText: "city"),
    );
    final regionField = TextFormField(
      autofocus: false,
      validator: (value) => value.isEmpty ? "Please region password" : null,
      onSaved: (value) => _region = value,
      decoration: buildInputDecoration(hintText: "region"),
    );

    final districField = TextFormField(
      autofocus: false,
      validator: (value) => value.isEmpty ? "Please distric password" : null,
      onSaved: (value) => _distric = value,
      decoration: buildInputDecoration(hintText: "distric"),
    );
    final villageField = TextFormField(
      autofocus: false,
      validator: (value) => value.isEmpty ? "Please village password" : null,
      onSaved: (value) => _village = value,
      decoration: buildInputDecoration(hintText: "village"),
    );
    final zipField = TextFormField(
      autofocus: false,
      validator: (value) => value.isEmpty ? "Please zip password" : null,
      onSaved: (value) => _zip = value,
      decoration: buildInputDecoration(hintText: "zip"),
    );
    final nationalityField = TextFormField(
      autofocus: false,
      validator: (value) =>
          value.isEmpty ? "Please nationality password" : null,
      onSaved: (value) => _nationality = value,
      decoration: buildInputDecoration(hintText: "nationality"),
    );
    final occupationField = TextFormField(
      autofocus: false,
      validator: (value) => value.isEmpty ? "Please occupation password" : null,
      onSaved: (value) => _occupation = value,
      decoration: buildInputDecoration(hintText: "occupation"),
    );
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            label('Please input your personal details'),
            AppSpacer.vSpacing(5),
            firstNameField,
            AppSpacer.vSpacing(5),
            lastNamedField,
            AppSpacer.vSpacing(5),
            idCardField,
            AppSpacer.vSpacing(5),
            idNumberField,
            AppSpacer.vSpacing(5),
            dateOfBirthField,
            AppSpacer.vSpacing(5),
            genderField,
            AppSpacer.vSpacing(5),
            addressField,
            AppSpacer.vSpacing(5),
            cityField,
            AppSpacer.vSpacing(5),
            regionField,
            AppSpacer.vSpacing(5),
            districField,
            AppSpacer.vSpacing(5),
            villageField,
            AppSpacer.vSpacing(5),
            zipField,
            AppSpacer.vSpacing(5),
            nationalityField,
            AppSpacer.vSpacing(5),
            occupationField,
            AppSpacer.vSpacing(5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: FileImage(File(widget.photoIdPath)))),
                  height: 150.sch,
                  width: 150.scw,
                ),
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: FileImage(File(widget.selfieIdPath)))),
                  height: 150.sch,
                  width: 150.scw,
                ),
              ],
            ),
            AppSpacer.vSpacing(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FlatButton(
                  onPressed: () {
                    // Navigator.popUntil(context, (route) => );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Retake',
                      style: TextStyle(
                          color: Colors.greenAccent[400], fontSize: 15.scs),
                    ),
                  ),
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    side: BorderSide(color: Colors.greenAccent[400]),
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    // _callCamera();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Submit',
                      style: TextStyle(color: Colors.white, fontSize: 15.scs),
                    ),
                  ),
                  color: Colors.greenAccent[400],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    // side: BorderSide(color: Colors.red),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
