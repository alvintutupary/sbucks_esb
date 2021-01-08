import 'package:flutter/material.dart';
import 'package:sbucks/src/widgets/common/app_spacer.dart';
import 'package:sbucks/src/widgets/common/app_text_field.dart';

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
          AppSpacer.vSpacing(20),
          Text('ADD NEW STARBUCKS CARD'),
          Text(
              'Collect stars and earn Rewards when you pay with a registered card'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    _cardNumberField,
                    AppSpacer.vSpacing(5),
                    _pinNumberField,
                    AppSpacer.vSpacing(10),
                    RaisedButton(
                      onPressed: () {},
                      child: Text('Kirim'),
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
