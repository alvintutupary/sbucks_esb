import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: PaymentReportLostCardScreen(),
    ));

class PaymentReportLostCardScreen extends StatefulWidget {
  @override
  _PaymentReportLostCardScreenState createState() =>
      _PaymentReportLostCardScreenState();
}

class _PaymentReportLostCardScreenState
    extends State<PaymentReportLostCardScreen> {
  String _valGender;
  String _valFriends;
  List _listGender = ["Male", "Female"];
  List _myFriends = [
    "Clara",
    "John",
    "Rizal",
    "Steve",
    "Laurel",
    "Bernard",
    "Miechel"
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // DropdownButton(
          //   hint: Text("Select Your Friends"),
          //   value: _valFriends,
          //   items: _myFriends.map((value) {
          //     return DropdownMenuItem(
          //       child: Text(value),
          //       value: value,
          //     );
          //   }).toList(),
          //   onChanged: (value) {
          //     setState(() {
          //       _valFriends =
          //           value; //Untuk memberitahu _valFriends bahwa isi nya akan diubah sesuai dengan value yang kita pilih
          //     });
          //   },
          // ),
          Container(
            color: Colors.brown,
            child: ListTile(
              title: Text(
                '6232 **** **** 5087',
                textAlign: TextAlign.center,
              ),
              trailing: Icon(Icons.arrow_drop_down),
            ),
          ),
          Image.asset('assets/img/sbuck-card-1.jpg'),
          Container(
            color: Colors.brown,
            child: ListTile(
              title: Text(
                'Please Select Reason',
                textAlign: TextAlign.center,
              ),
              trailing: Icon(Icons.arrow_drop_down),
            ),
          ),
          Text(
            '''if you need further assistance, please call our Customer Care at (021) 1-500-087 or email to customer.care@starbuck.co.id''',
            textAlign: TextAlign.center,
          ),
          RaisedButton(
            onPressed: () {},
            child: Text('Confirm'),
          )
        ],
      ),
    );
  }
}
