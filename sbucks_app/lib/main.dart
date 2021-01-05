import 'package:flutter/material.dart';
import 'package:sbucks/src/screens/main_screen/main_screen.dart';
import 'package:sbucks/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Starbucks',
      home: MainScreen(),
      onGenerateRoute: generateRoutes,
    );
  }
}
