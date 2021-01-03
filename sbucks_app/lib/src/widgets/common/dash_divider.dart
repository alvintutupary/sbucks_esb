import 'package:flutter/material.dart';

class DashDivider extends StatelessWidget {
  final double height;
  final double thickness;
  final Color color;

  const DashDivider({
    this.height = 16.0,
    this.thickness = 1.0,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashWidth = 5.0;
        final dashHeight = this.thickness;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();

        return SizedBox(
          height: this.height,
          child: Center(
            child: Flex(
              children: List.generate(dashCount, (_) {
                return SizedBox(
                  width: dashWidth,
                  height: dashHeight,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: this.color ?? Theme.of(context).dividerColor,
                    ),
                  ),
                );
              }),
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              direction: Axis.horizontal,
            ),
          ),
        );
      },
    );
  }
}
