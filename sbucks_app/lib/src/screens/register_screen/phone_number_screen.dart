import 'package:flutter/material.dart';

class PhoneNumberScreen extends StatefulWidget {
  @override
  _PhoneNumberScreenState createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('Please Insert Your Phone Number: '),
          TextField(),
          RaisedButton(
            onPressed: () {},
            child: Text('Send OTP Code'),
          ),
        ],
      ),
    );
  }
}
