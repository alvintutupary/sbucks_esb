import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final double minWidth;
  final double width;
  final double minHeight;
  final double height;
  final double circularRadius;
  final EdgeInsets contentPadding;
  final Color backgroundColor;
  final Color splashColor;
  final BoxDecoration containerDecoration;
  final Widget child;
  final Function onPressed;

  const RoundedButton({
    this.minWidth = 0.0,
    this.width,
    this.minHeight = 0.0,
    this.height,
    this.circularRadius = 4.0,
    this.contentPadding,
    this.backgroundColor,
    this.splashColor,
    this.containerDecoration,
    this.child,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final decoration = containerDecoration ?? BoxDecoration();
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: decoration.copyWith(
        borderRadius: BorderRadius.circular(this.circularRadius),
      ),
      child: Material(
        color: this.backgroundColor,
        child: InkWell(
          splashColor: this.splashColor,
          child: Container(
            width: this.width,
            height: this.height,
            padding: this.contentPadding,
            constraints: BoxConstraints(
              minWidth: this.minWidth,
              minHeight: this.minHeight,
            ),
            child: this.child,
          ),
          onTap: this.onPressed,
        ),
      ),
    );
  }
}
