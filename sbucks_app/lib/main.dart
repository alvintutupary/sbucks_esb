import 'package:flutter/material.dart';
import 'package:sbucks/src/screens/intro_screen/intro_screen.dart';
import 'package:sbucks/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: IntroScreen(),
      onGenerateRoute: generateRoutes,
    );
  }
}
