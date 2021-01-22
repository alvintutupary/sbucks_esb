import 'package:flutter/material.dart';
import 'package:sbucks/src/blocs/content_bloc.dart';
import 'package:sbucks/src/screens/home_screen/home_screen_widgets/banner_slider.dart';
import 'package:sbucks/src/screens/home_screen/home_screen_widgets/list_news.dart';
import 'package:sbucks/src/screens/home_screen/home_screen_widgets/linier_indicator.dart';
import 'package:sbucks/src/screens/profile_screen/profile_screen.dart';
import 'package:sbucks/src/screens/inbox_screen/inbox_screen.dart';
import 'package:sbucks/src/screens/ecode_screen/ecode_screen.dart';
import 'package:sbucks/src/widgets/common/star_text.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:sbucks/src/utils/size_config.dart';
import 'package:sbucks/src/widgets/common/app_spacer.dart';
import 'package:sbucks/src/utils/style.dart';

class HomeScreen extends StatefulWidget {
  static const kRouteName = '/home';
  HomeScreen({Key key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _buildHomeContext(context)),
    );
  }
}

Widget _buildHomeContext(BuildContext context) {
  return SafeArea(
    child: Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.scw),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Good Afternoon,',
                    style: TextStyle(fontSize: 30.scs),
                    textAlign: TextAlign.left,
                  ),
                  AppSpacer.vSpacing(5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Alvin',
                        style: TextStyle(fontSize: 25.scs),
                      ),
                      Text('Green Level',
                          style: TextStyle(
                              fontSize: 25.scs, color: AppColor.kBrandColor)),
                    ],
                  ),
                  AppSpacer.vSpacing(5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        child: Row(children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 2.scs),
                            child: Icon(Icons.person),
                          ),
                          Text('Profile')
                        ]),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => ProfileScreen()));
                        },
                      ),
                      InkWell(
                        child: Row(children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 2.scw),
                            child: Icon(Icons.mail),
                          ),
                          Text('Inbox')
                        ]),
                        onTap: () => Navigator.pushNamed(
                            context, InboxScreen.kRouteName),
                      ),
                      InkWell(
                        child: Row(children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 2.scw),
                            child: Icon(Icons.label),
                          ),
                          Text('E-Code')
                        ]),
                        onTap: () => showDialog(
                            context: context,
                            child: AlertDialog(
                              content: ECodeScreen(),
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              color: AppColor.kStarTextColor,
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 15.scw, vertical: 10.sch),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'STARBUCK REWARDS',
                            style: TextStyle(
                                color: Colors.white, fontSize: 15.scs),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            children: [
                              Text(
                                '10',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 30.scs),
                              ),
                              Text(
                                '/100',
                                style: TextStyle(
                                    color: Colors.green[300], fontSize: 15.scs),
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.green[300],
                                size: 10.scs,
                              )
                            ],
                          ),
                          linierIndicator(Colors.white, 0.5, 2.sch, 150.scw),
                          Text(
                            '90% Stars to next Reward',
                            style: TextStyle(
                                color: Colors.white, fontSize: 10.scs),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5.scs),
                      child: StarText(
                        size: 15.scs,
                        value: '0',
                        text: 'Rewards',
                      ),
                    ),
                    Text(
                      '290 Stars to \nGold Tier',
                      style: TextStyle(color: Colors.white, fontSize: 10.scs),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
            BannerSlider(),
            Expanded(
              child: MenuList(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('PAY'),
        backgroundColor: Color(0xff006442),
        onPressed: () {
          showDialog(
              context: context,
              builder: (_) => new AlertDialog(
                    title: new Text(
                      "Scan this to redeem reward or pay",
                      style: TextStyle(fontSize: 14.scs),
                      textAlign: TextAlign.center,
                    ),
                    content: BarcodeWidget(
                      barcode: Barcode.pdf417(),
                      data: '6232020671965087',
                      drawText: true,
                      height: 50.sch,
                      width: 400.scw,
                    ),
                    actions: [
                      FlatButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text(
                            'Done',
                            textAlign: TextAlign.center,
                          ))
                    ],
                  ));
        },
      ),
    ),
  );
}
