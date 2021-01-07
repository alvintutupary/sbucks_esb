import 'package:flutter/material.dart';
import 'package:sbucks/src/utils/size_config.dart';

class RoundedBox extends StatelessWidget {
  final bool fullWidth;
  final EdgeInsets margin;
  final EdgeInsets outerPadding;
  final EdgeInsets contentPadding;
  final Color color;
  final Border border;
  final BorderRadius borderRadius;
  final double circularRadius;
  final List<BoxShadow> boxShadow;
  final Widget child;

  const RoundedBox({
    this.fullWidth = true,
    this.margin,
    this.outerPadding,
    this.contentPadding,
    this.color = Colors.white,
    this.border,
    this.borderRadius,
    this.circularRadius,
    this.boxShadow,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    final contentBorderRadius = this.borderRadius != null
        ? this.borderRadius
        : BorderRadius.circular(this.circularRadius ?? 10.scw);

    return Container(
      margin: this.margin,
      padding: this.outerPadding ?? EdgeInsets.symmetric(horizontal: 10.scw),
      child: Container(
        width: this.fullWidth ? double.infinity : null,
        padding: this.contentPadding ??
            EdgeInsets.symmetric(
              horizontal: 8.scw,
              vertical: 12.scw,
            ),
        decoration: BoxDecoration(
          color: this.color,
          border: this.border,
          borderRadius: contentBorderRadius,
          boxShadow: this.boxShadow,
        ),
        child: this.child,
      ),
    );
  }
}
