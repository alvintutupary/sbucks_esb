import 'package:flutter/material.dart';
import 'package:sbucks/src/screens/payment_screen/payment_screen_widgets/payment_topup_confirm.dart';

class PaymentTopup extends StatefulWidget {
  static const kRouteName = '/payment-toppup';
  @override
  _PaymentTopupState createState() => _PaymentTopupState();
}

class _PaymentTopupState extends State<PaymentTopup> {
  String _test = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('TOPUP', style: TextStyle(color: Colors.black)),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 25,
          ),
          Image.asset('assets/img/sbuck-card.jpg'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('082121992802'),
              Icon(
                Icons.check_circle,
                color: Colors.greenAccent[400],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Rp. 50,000', style: TextStyle(fontSize: 35)),
              Icon(
                Icons.refresh,
                color: Colors.grey,
                size: 40,
              )
            ],
          ),
          Text('As of  12/12/1212 12:12'),
          SizedBox(
            height: 10,
          ),
          Text('Select Top Up Amount'),
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(color: Colors.grey[850]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _textFlatButton(
                    text: '50k',
                    onPressed: () => setState(() {
                          _test = '50k';
                        })),
                _textFlatButton(
                    text: '100k',
                    onPressed: () => setState(() {
                          _test = '100k';
                        })),
                _textFlatButton(
                    text: '200k',
                    onPressed: () => setState(() {
                          _test = '200k';
                        })),
                _textFlatButton(
                    text: '300k',
                    onPressed: () => setState(() {
                          _test = '300k';
                        })),
                _textFlatButton(
                    text: 'other',
                    onPressed: () => setState(() {
                          _test = 'other';
                        })),
              ],
            ),
          ),
          SizedBox(height: 10),
          Text(
            _test.isEmpty
                ? ''
                : (_test == 'other')
                    ? 'Select other amount'
                    : '+Rp. $_test',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          FlatButton(
            onPressed: () {
              Navigator.pushNamed(context, PaymentTopupConfirm.kRouteName);
            },
            color: Colors.greenAccent[400],
            visualDensity: VisualDensity.comfortable,
            child: Text(
              'Top Up',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}

Widget _textFlatButton({String text, Function onPressed}) {
  return InkWell(
    onTap: onPressed,
    child: Text(text,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
  );
}
