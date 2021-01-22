import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final double height;
  final double width;
  final Color color;
  const CustomDivider(
      {this.height = 3,
      this.width = double.infinity,
      this.color = Colors.black});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: new Center(
        child: new Container(
          color: color,
        ),
      ),
    );
  }
}
