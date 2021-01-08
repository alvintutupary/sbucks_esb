import 'package:flutter/material.dart';
import 'package:sbucks/src/screens/reward_screen/reward_screen_widgets/reward_benefit.dart';
import 'package:sbucks/src/utils/size_config.dart';

class RewardScreen extends StatefulWidget {
  static const kRouteName = '/reward';
  @override
  _RewardScreenState createState() => _RewardScreenState();
}

class _RewardScreenState extends State<RewardScreen> {
  // final _barcode = buildBarcode(
  //   Barcode.code39(),
  //   'CODE 39',
  // );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[900],
      appBar: AppBar(
        title: Container(
          alignment: Alignment.centerLeft,
          child: Text(
            'Starbucks Rewards',
            style: TextStyle(color: Colors.black, fontSize: 25.scs),
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          ListTile(
            title: Text('Green Level',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 20.scs,
                  fontWeight: FontWeight.bold,
                )),
            subtitle: Text('Member Since - 06 Jan 2021',
                style: TextStyle(color: Colors.white, fontSize: 15.scs)),
            trailing: Container(
                child: Column(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.green,
                  size: 30.scs,
                ),
                Text('Rewards',
                    style: TextStyle(color: Colors.white, fontSize: 15.scs))
              ],
            )),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Text('90 Stars to next Reward',
                    style: TextStyle(color: Colors.white, fontSize: 20.scs)),
                _linierIndicator(Colors.green, .1, 10, double.infinity)
              ],
            ),
          ),
          RaisedButton(
            onPressed: () {},
            child: Text('View History'),
          ),
          Text('Reward and Benefits',
              style: TextStyle(color: Colors.white, fontSize: 15.scs)),
          InkWell(
              child: ListTile(
                title: Text('Information On Benefits',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.scs,
                        fontWeight: FontWeight.bold)),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
              ),
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (_) => RewardBenefit()))),
          Divider(
            height: 5,
            color: Colors.white,
          )
        ],
      ),
    );
  }

  _linierIndicator(Color color, double value, double height, double width) =>
      Container(
        height: height,
        width: width,
        child: LinearProgressIndicator(
          value: value,
          valueColor: AlwaysStoppedAnimation<Color>(color),
          backgroundColor: color.withOpacity(.5),
        ),
      );
}
