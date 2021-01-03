import 'package:flutter/material.dart';
import 'package:sbucks/src/widgets/common/rounded_button.dart';

class CircleButton extends StatelessWidget {
  final double diameter;
  final EdgeInsets contentPadding;
  final Color backgroundColor;
  final Color splashColor;
  final Widget child;
  final Function onPressed;
  final List<BoxShadow> boxShadow;

  const CircleButton({
    this.diameter,
    this.contentPadding,
    this.backgroundColor,
    this.splashColor,
    this.child,
    this.onPressed,
    this.boxShadow,
  });

  @override
  Widget build(BuildContext context) {
    return RoundedButton(
      width: this.diameter,
      height: this.diameter,
      circularRadius: 1000.0,
      contentPadding: this.contentPadding,
      backgroundColor: this.backgroundColor,
      splashColor: this.splashColor,
      child: this.child,
      onPressed: this.onPressed,
      containerDecoration: BoxDecoration(
        boxShadow: this.boxShadow,
      ),
    );
  }
}
