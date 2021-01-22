import 'package:flutter/material.dart';
import 'package:sbucks/src/screens/payment_add_screen/payment_add_screen.dart';
import 'package:sbucks/src/screens/payment_report_lost_card_screen/payment_report_lost_card_screen.dart';
import 'package:sbucks/src/screens/payment_screen/payment_screen_widgets/payment_topup.dart';
import 'package:sbucks/src/screens/payment_virtual_account_screen/payment_virtual_account_screen.dart';
import 'package:sbucks/src/screens/payment_screen/payment_screen_widgets/payment_dummy_data.dart';
import 'package:sbucks/src/models/card_model.dart';
import 'package:sbucks/src/widgets/rounded_border_button.dart';
import 'package:sbucks/src/widgets/card_image.dart';
import 'package:sbucks/src/widgets/common/app_spacer.dart';
import 'package:sbucks/src/utils/size_config.dart';
import 'package:sbucks/src/utils/style.dart';

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
            isScrollable: true,
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
          children: [
            PayTab(),
            PaymentAddScreen(),
            PaymentVirtualAccountScreen(),
            PaymentReportLostCardScreen(),
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
  List<CardModel> cards = PaymentDummyData().cards;

  CardModel _defaultCard;

  @override
  void initState() {
    _defaultCard = cards.firstWhere((fw) => fw.isDefault);
    super.initState();
  }

  void onClickCard(CardModel data) {
    setState(() {
      _defaultCard = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppSpacer.vSpacing(5),
          Text(
            'Your account balance',
            style: TextStyle(
              fontSize: 15.scs,
            ),
          ),
          // AppSpacer.vSpacing(15),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text('Rp. ${_defaultCard.balance}'),
                    Icon(Icons.refresh)
                  ],
                ),
                _defaultCard.isActive
                    ? Text(
                        'Active',
                        style: TextStyle(color: Colors.green),
                      )
                    : Text(
                        'Inactive',
                        style: TextStyle(color: Colors.red),
                      ),
                FlatButton(
                    child: Text(
                      'TOPUP',
                      style: TextStyle(
                        fontSize: 20.scs,
                        color: AppColor.kPrimaryBrand,
                      ),
                    ),
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
            child: Text(_defaultCard.createdAt),
          ),
          CardImage(
            _defaultCard.imageUri,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: _defaultCard.isDefault,
                    onChanged: (bool value) {
                      // setState(() {

                      // });
                    },
                  ),
                  Text('Set as default card')
                ],
              ),
              RoundedBorderButton(
                text: 'PAY',
                color: Colors.green[700],
                borderColor: Colors.white,
                textColor: Colors.white,
                borderThick: 2,
                radius: 50,
                onPressed: () {},
              )
            ],
          ),
          Text('MY CARD'),
          Container(
            height: 100.sch,
            width: double.infinity,
            child: ListView.builder(
              itemCount: PaymentDummyData().cards.length,
              itemBuilder: (context, index) {
                return InkWell(
                  child: Column(
                    children: [
                      CardImage(
                        PaymentDummyData().cards[index].imageUri,
                        size: 80.sch,
                      ),
                      Text(
                        '(${PaymentDummyData().cards[index].number.substring(15, 19)})',
                        style: TextStyle(fontSize: 15.scs),
                      ),
                    ],
                  ),
                  onTap: () => onClickCard(PaymentDummyData().cards[index]),
                );
              },
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }
}
