import 'package:flutter/material.dart';
import 'package:sbucks/src/screens/premium_screen/premium_screen.dart';
import 'package:sbucks/src/widgets/common/wide_button.dart';
import 'package:sbucks/src/screens/personal_screen/personal_screen_widgets/personal_change_detail.dart';
import 'package:sbucks/src/screens/personal_screen/personal_screen_widgets/personal_change_password.dart';

class PersonalScreen extends StatefulWidget {
  @override
  _PersonalScreenState createState() => _PersonalScreenState();
}

class _PersonalScreenState extends State<PersonalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Charlie Setiono'),
              Text('charlie_evolution15@yahoo.com'),
              Text('Birth date : 09 Mar'),
              WideButton(
                color: Color(0xff006442),
                flatButton: true,
                child: Text(
                  'Change Detail',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                circularRadius: 0,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => PersonalChangeDetail()));
                },
              ),
              WideButton(
                color: Color(0xff006442),
                flatButton: true,
                child: Text(
                  'Change Password',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                circularRadius: 0,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => PersonalChangePassword()));
                },
              ),
              WideButton(
                color: Color(0xff006442),
                flatButton: true,
                child: Text(
                  'Go Premium',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                circularRadius: 0,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => PremiumScreen()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
