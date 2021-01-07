import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sbucks/src/widgets/common/wide_button.dart';
import 'package:sbucks/src/screens/payment_screen/payment_screen_widgets/payment_chose_bank.dart';

class PaymentTopupConfirm extends StatefulWidget {
  static const kRouteName = '/payment-topup-confirm';
  @override
  _PaymentTopupConfirmState createState() => _PaymentTopupConfirmState();
}

class _PaymentTopupConfirmState extends State<PaymentTopupConfirm> {
  // final _formKey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Topup',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.chevron_left,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 10),
                      Container(
                        // alignment: Alignment.centerLeft,
                        // child: Image.asset('assets/img/icon-1.PNG'),
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('assets/img/icon-1.PNG'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Order Summary',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.green[900]),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Card(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'amount',
                              style: TextStyle(color: Colors.green[500]),
                            ),
                            Text('Rp. 100,000',
                                style: TextStyle(
                                    color: Colors.green[500], fontSize: 30)),
                          ],
                        ),
                        Divider(
                          color: Colors.green[500],
                          thickness: 2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Order ID',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(
                              'ID12049029XDS1II200',
                              // style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text('Name'),
                          SizedBox(height: 5),
                          Text('Faritno', style: TextStyle(fontSize: 20)),
                          SizedBox(height: 15),
                          Text('Email'),
                          SizedBox(height: 5),
                          Text('faritno@live.com',
                              style: TextStyle(fontSize: 20)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Continue'),
        backgroundColor: Colors.green[800],
        onPressed: () {
          Navigator.pushNamed(context, PaymentChoseBank.kRouteName);
        },
      ),
    );
  }
}
