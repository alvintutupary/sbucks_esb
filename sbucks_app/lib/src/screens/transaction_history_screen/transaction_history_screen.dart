import 'package:flutter/material.dart';
import 'package:sbucks/src/widgets/custom_divider.dart';
import 'package:sbucks/src/utils/style.dart';
import 'package:sbucks/src/utils/size_config.dart';

class TransactionHistoryScreen extends StatefulWidget {
  static const String kRouteName = '/TransactionHistoryScreen';
  @override
  _TransactionHistoryScreenState createState() =>
      _TransactionHistoryScreenState();
}

class _TransactionHistoryScreenState extends State<TransactionHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card Transaction Histoy'),
      ),
      body: Column(
        children: [
          Container(
            color: AppColor.kSecondaryBrand,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  child: Text(
                    'This Month',
                    style: TextStyle(
                      color: AppColor.kAccentText,
                      fontSize: 20.scs,
                    ),
                  ),
                  onTap: () {},
                ),
                CustomDivider(
                  color: AppColor.kPrimaryBackground,
                  height: 50.sch,
                  width: 3.scw,
                ),
                InkWell(
                  child: Text(
                    '6232 **** **** 4942',
                    style: TextStyle(
                      color: AppColor.kAccentText,
                      fontSize: 20.scs,
                    ),
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),
          Container(
            child: Text('You Have no activities'),
          ),
        ],
      ),
    );
  }
}
