import 'package:flutter/material.dart';
import 'package:sbucks/src/widgets/common/wide_button.dart';

class PersonalScreen extends StatefulWidget {
  @override
  _PersonalScreenState createState() => _PersonalScreenState();
}

class _PersonalScreenState extends State<PersonalScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('Charlie Setiono'),
          Text('charlie_evolution15@yahoo.com'),
          Text('Birth date : 09 Mar'),
          WideButton(
            color: Color(0xff006442),
            flatButton: true,
            child: Text(
              'SignIn',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            circularRadius: 0,
            onPressed: () {},
          ),
          RaisedButton(
            child: Text('Change Detail'),
            onPressed: () {},
          ),
          RaisedButton(
            child: Text('Change Password'),
            onPressed: () {},
          ),
          RaisedButton(
            child: Text('Go Premium'),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
