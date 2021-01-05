import 'package:flutter/material.dart';
import 'package:sbucks/src/screens/payment_screen/payment_screen_widgets/payment_topup.dart';

class PaymentScreen extends StatefulWidget {
  static const kRouteName = '/payment';
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          bottom: TabBar(
            labelColor: Color(0xff006442),
            indicatorColor: Color(0xff006442),
            tabs: [
              Tab(text: 'PAY'),
              Tab(text: 'ADD'),
              Tab(text: 'VIRTUAL ACCOUNT'),
              Tab(text: 'REPORT LOST CARD'),
            ],
          ),
          title: Text('Starbucks Card'),
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            PayTab(),
            Icon(Icons.directions_transit),
            Icon(Icons.directions_bike),
            Icon(Icons.directions_bike),
          ],
        ),
      ),
    );
  }
}

class PayTab extends StatefulWidget {
  @override
  _PayTabState createState() => _PayTabState();
}

class _PayTabState extends State<PayTab> {
  bool _isDefaultCard = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Your account balance'),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [Text('Rp. 20,000'), Icon(Icons.refresh)],
                ),
                Text('Active'),
                FlatButton(
                    child: Text('TOPUP'),
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        PaymentTopup.kRouteName,
                      );
                    })
              ],
            ),
          ),
          Center(
            child: Text('12/12/1212'),
          ),
          Image.asset('assets/img/sbuck-card.jpg'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: _isDefaultCard,
                    onChanged: (bool value) {
                      setState(() {
                        _isDefaultCard = value;
                      });
                    },
                  ),
                  Text('Set as default card')
                ],
              ),
              RaisedButton(
                child: Text('PAY'),
                onPressed: () {},
              )
            ],
          )
        ],
      ),
    );
  }
}
