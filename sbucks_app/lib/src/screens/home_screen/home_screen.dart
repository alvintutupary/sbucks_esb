import 'package:flutter/material.dart';
import 'package:sbucks/src/screens/home_screen/home_screen_widgets/banner_slider.dart';
import 'package:sbucks/src/screens/home_screen/home_screen_widgets/list_menu.dart';
import 'package:sbucks/src/screens/home_screen/home_screen_widgets/linier_indicator.dart';

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
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: HOME',
      style: optionStyle,
    ),
    Text(
      'Index 1: PAY',
      style: optionStyle,
    ),
    Text(
      'Index 2: REWARD',
      style: optionStyle,
    ),
  ];

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
                Row(children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: Icon(Icons.person),
                  ),
                  Text('Profile')
                ]),
                Row(children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: Icon(Icons.mail),
                  ),
                  Text('Inbox')
                ]),
                Row(children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: Icon(Icons.label),
                  ),
                  Text('E-Code')
                ]),
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
                  Container(
                      child: Column(
                    children: [
                      Icon(
                        Icons.star,
                        size: 50,
                        color: Colors.teal[900],
                      ),
                      Text(
                        'Rewards',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  )),
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
                  content: Image.asset(
                    'assets/img/barcode.jpg',
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                  ),
                  // actions: <Widget>[
                  //   FlatButton(
                  //     child: Text('Close me!'),
                  //     onPressed: () {
                  //       Navigator.of(context).pop();
                  //     },
                  //   )
                  // ],
                ));
      },
    ),
  );
}
