import 'package:flutter/material.dart';
import 'package:sbucks/src/utils/size_config.dart';
import 'package:sbucks/src/widgets/common/app_spacer.dart';
import 'package:sbucks/src/widgets/custom_divider.dart';

class PaymentVirtualAccounDetail extends StatefulWidget {
  @override
  _PaymentVirtualAccounDetailState createState() =>
      _PaymentVirtualAccounDetailState();
}

class _PaymentVirtualAccounDetailState
    extends State<PaymentVirtualAccounDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top Up History'),
        elevation: 0,
      ),
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '28 Dec 2020',
                style: TextStyle(
                  fontSize: 15.scs,
                ),
              ),
              Text(
                '00:27',
                style: TextStyle(
                  fontSize: 15.scs,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/img/bank BRI.JPG'))),
                height: 20.sch,
                width: 100.scw,
              ),
              Text(
                'Status: CANCELLLED',
                style: TextStyle(
                  fontSize: 15.scs,
                ),
              ),
            ],
          ),
          AppSpacer.vSpacing(5),
          Center(
              child: Text(
            'Transaction has been cancelled',
            style: TextStyle(
              fontSize: 15.scs,
            ),
          )),
          CustomDivider(
            height: 2.sch,
            width: double.infinity,
            color: Colors.grey,
          ),
          Column(
            children: [
              Text('Virtual Account Number',
                  style: TextStyle(color: Colors.green, fontSize: 20.scs)),
              Text('392392392392392', style: TextStyle(fontSize: 15.scs)),
              FlatButton(
                child: Text('Copy',
                    style: TextStyle(color: Colors.green, fontSize: 15.scs)),
                onPressed: () {},
              ),
              CustomDivider(
                height: 2.sch,
                width: double.infinity,
                color: Colors.grey,
              ),
              Text(
                'Amount',
                style: TextStyle(
                  fontSize: 15.scs,
                ),
              ),
              Text(
                'Rp. 100.000',
                style: TextStyle(
                  fontSize: 15.scs,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage('assets/img/icon-card.JPG'))),
                height: MediaQuery.of(context).size.width / 2,
                width: MediaQuery.of(context).size.width,
              ),
              AppSpacer.vSpacing(5),
              Text(
                '2934 **** **** 2934',
                style: TextStyle(
                  fontSize: 15.scs,
                ),
              ),
              AppSpacer.vSpacing(5),
              Text(
                'Notes',
                style: TextStyle(
                  fontSize: 15.scs,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.scs),
                child: Column(
                  children: [
                    Text(
                      "\u2022 One Virtual Account Number for a one time 'Top-Up' transaction",
                      style: TextStyle(
                        fontSize: 12.scs,
                      ),
                    ),
                    Text(
                      "\u2022 Check again all the details before completing the transaction",
                      style: TextStyle(
                        fontSize: 12.scs,
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
