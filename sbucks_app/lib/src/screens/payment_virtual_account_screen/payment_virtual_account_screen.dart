import 'package:flutter/material.dart';

class PaymentVirtualAccountScreen extends StatefulWidget {
  @override
  _PaymentVirtualAccountScreenState createState() =>
      _PaymentVirtualAccountScreenState();
}

class _PaymentVirtualAccountScreenState
    extends State<PaymentVirtualAccountScreen> {
  final _dummyList = [];
  @override
  Widget build(BuildContext context) {
    return Container(
        child: (_dummyList != null && _dummyList.length > 0)
            ? Column(
                children: [
                  Text('ADD NEW STARBUCKS CARD'),
                  Text(
                      'Collect stars and earn Rewards when you pay with a registered card'),
                  Form(
                      child: Column(
                    children: [
                      TextFormField(),
                      TextFormField(),
                      RaisedButton(
                        onPressed: () {},
                        child: Text('Kirim'),
                      ),
                    ],
                  ))
                ],
              )
            : Center(
                child: Text(
                    'Please click "TOP UP" in the Pay Tab to create your first Virtual Account'),
              ));
  }
}
