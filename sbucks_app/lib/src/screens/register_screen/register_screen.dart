import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  static const kRouteName = '/register';
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/bg-2.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(),
              TextField(),
              RaisedButton(
                onPressed: () {},
                child: Text('SignUp'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
