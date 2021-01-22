import 'package:flutter/material.dart';
import 'package:sbucks/src/widgets/common/app_spacer.dart';
import 'package:sbucks/src/widgets/common/app_text_field.dart';
import 'package:sbucks/src/widgets/common/wide_button.dart';

class ECodeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String _eCode;
    final eCodeField = TextFormField(
      autofocus: false,
      validator: (value) => value.isEmpty ? "Please enter ecode" : null,
      onSaved: (value) => _eCode = value,
      decoration: buildInputDecoration(hintText: "E-Code"),
    );
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
              'Apply Promotion Code to Enjoy  Bonus Stars / Rewards / Special Offers'),
          AppSpacer.hSpacing(15),
          eCodeField,
          AppSpacer.hSpacing(15),
          WideButton(
            child: Text('Apply'),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
