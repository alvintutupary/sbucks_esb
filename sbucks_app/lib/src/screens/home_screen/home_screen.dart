import 'package:flutter/material.dart';
import 'package:sbucks/src/screens/home_screen/home_screen_widgets/banner_slider.dart';
import 'package:sbucks/src/screens/home_screen/home_screen_widgets/list_menu.dart';
import 'package:sbucks/src/screens/home_screen/home_screen_widgets/linier_indicator.dart';
import 'package:sbucks/src/screens/profile_screen/profile_screen.dart';
import 'package:sbucks/src/screens/inbox_screen/inbox_screen.dart';
import 'package:sbucks/src/screens/ecode_screen/ecode_screen.dart';
import 'package:sbucks/src/widgets/common/star_text.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:sbucks/src/utils/size_config.dart';

class HomeScreen extends StatefulWidget {
  static const kRouteName = '/';
  HomeScreen({Key key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = new GlobalKey<FormState>();
  String _email, _password;

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _buildHomeContext(context)),
    );
  }
}

Widget _buildHomeContext(BuildContext context) {
  return Scaffold(
    body: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 25.0,
              left: 15,
              right: 15,
            ),
            child: Text(
              'Good Afternoon,',
              style: TextStyle(fontSize: 30),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 10.0,
              bottom: 30.0,
              left: 15,
              right: 15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Alvin',
                  style: TextStyle(fontSize: 25),
                ),
                Text('Green Level',
                    style: TextStyle(fontSize: 25, color: Color(0xff006442))),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  child: Row(children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: Icon(Icons.person),
                    ),
                    Text('Profile')
                  ]),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => ProfileScreen()));
                  },
                ),
                InkWell(
                  child: Row(children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: Icon(Icons.mail),
                    ),
                    Text('Inbox')
                  ]),
                  onTap: () =>
                      Navigator.pushNamed(context, InboxScreen.kRouteName),
                ),
                InkWell(
                  child: Row(children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
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
          ),
          Container(
            color: Color(0xff006442),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'STARBUCK REWARDS',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text('10/100'),
                        linierIndicator(Colors.white, 0.5, 1, 100),
                        Text(
                          '90% Stars to next Reward',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: StarText(
                      size: 15,
                      value: '0',
                      text: 'Rewards',
                    ),
                  ),
                  // Container(
                  //     child: Column(
                  //   children: [
                  //     Icon(
                  //       Icons.star,
                  //       size: 50,
                  //       color: Colors.teal[900],
                  //     ),
                  //     Text(
                  //       'Rewards',
                  //       style: TextStyle(color: Colors.white),
                  //     )
                  //   ],
                  // )),
                  Text(
                    '290 Stars to Gold Tier',
                    style: TextStyle(color: Colors.white),
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
                    style: TextStyle(fontSize: 14),
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
  );
}
