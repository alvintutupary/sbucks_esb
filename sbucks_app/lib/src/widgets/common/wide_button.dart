import 'package:flutter/material.dart';
import 'package:sbucks/src/utils/size_config.dart';

class WideButton extends StatelessWidget {
  final double width;
  final double elevation;
  final EdgeInsets padding;
  final BorderSide borderSide;
  final double circularRadius;
  final Color color;
  final Icon icon;
  final Widget child;
  final bool enabled;
  final bool flatButton;
  final Function onPressed;

  const WideButton({
    this.width = double.infinity,
    this.elevation,
    this.padding,
    this.circularRadius = 15.0,
    this.borderSide,
    this.color,
    this.icon,
    this.child,
    this.enabled = true,
    this.flatButton = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final child = this.child is Row ? Expanded(child: this.child) : this.child;

    return Container(
      width: this.width,
      padding: this.padding,
      constraints: BoxConstraints(minWidth: 60),
      child: RaisedButton(
        elevation: flatButton ? 0 : this.elevation,
        disabledElevation: flatButton ? 0 : this.elevation,
        focusElevation: flatButton ? 0 : this.elevation,
        highlightElevation: flatButton ? 0 : this.elevation,
        hoverElevation: flatButton ? 0 : this.elevation,
        shape: RoundedRectangleBorder(
          side: this.borderSide ?? BorderSide.none,
          borderRadius: BorderRadius.circular(this.circularRadius),
        ),
        color: this.color ?? Theme.of(context).accentColor,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.scw),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (this.icon != null)
                Padding(
                  padding: EdgeInsets.only(right: 8.scw),
                  child: this.icon,
                ),
              child,
            ],
          ),
        ),
        onPressed: this.enabled ? this.onPressed : null,
      ),
    );
  }
}
