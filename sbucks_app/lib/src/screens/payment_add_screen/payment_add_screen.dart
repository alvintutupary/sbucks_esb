import 'package:flutter/material.dart';
import 'package:sbucks/src/widgets/common/app_spacer.dart';
import 'package:sbucks/src/widgets/common/app_text_field.dart';
import 'package:sbucks/src/widgets/rounded_border_button.dart';
import 'package:sbucks/src/utils/size_config.dart';

class PaymentAddScreen extends StatefulWidget {
  @override
  _PaymentAddScreenState createState() => _PaymentAddScreenState();
}

class _PaymentAddScreenState extends State<PaymentAddScreen> {
  final _formKey = new GlobalKey<FormState>();
  String _cardNumber, _pinNumber;
  @override
  Widget build(BuildContext context) {
    final _cardNumberField = TextFormField(
      autofocus: false,
      validator: (value) =>
          value.isEmpty ? "Please fill your card number" : null,
      onSaved: (value) => _cardNumber = value,
      decoration:
          buildInputDecoration(hintText: "Card Number", icon: Icons.payment),
    );

    final _pinNumberField = TextFormField(
      autofocus: false,
      obscureText: true,
      validator: (value) =>
          value.isEmpty ? "Please fill your PIN number" : null,
      onSaved: (value) => _pinNumber = value,
      decoration: buildInputDecoration(hintText: "PIN", icon: Icons.lock),
    );
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppSpacer.vSpacing(20),
                    Text(
                      'ADD NEW STARBUCKS CARD',
                      style: TextStyle(
                          color: Colors.yellow[900], fontSize: 20.scs),
                      // textAlign: TextAlign.start,
                    ),
                    Text(
                      'Collect stars and earn Rewards when you pay with a registered card',
                      style: TextStyle(fontSize: 15.scs),
                    ),
                    AppSpacer.vSpacing(15),
                    _cardNumberField,
                    AppSpacer.vSpacing(10),
                    _pinNumberField,
                    AppSpacer.vSpacing(15),
                    Center(
                      child: RoundedBorderButton(
                        text: 'SEND',
                        color: Colors.green[700],
                        borderColor: Colors.white,
                        textColor: Colors.white,
                        borderThick: 2,
                        radius: 50,
                        onPressed: () {},
                      ),
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}
