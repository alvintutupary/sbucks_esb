import 'package:flutter/material.dart';

class RoundedBorderButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color borderColor;
  final double textSize;
  final double radius;
  final double vPadding;
  final double hPadding;
  final double borderThick;
  final Color color;
  final Function onPressed;
  const RoundedBorderButton({
    @required this.onPressed,
    @required this.text,
    this.textColor = Colors.black,
    this.borderColor = Colors.black,
    this.color = Colors.white,
    this.radius = 10,
    this.textSize = 15,
    this.vPadding = 10,
    this.hPadding = 10,
    this.borderThick = 0,
  });
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
          side: BorderSide(color: borderColor, width: borderThick)),
      color: color,
      textColor: textColor,
      padding: EdgeInsets.symmetric(vertical: vPadding, horizontal: hPadding),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(fontSize: textSize),
      ),
    );
  }
}
