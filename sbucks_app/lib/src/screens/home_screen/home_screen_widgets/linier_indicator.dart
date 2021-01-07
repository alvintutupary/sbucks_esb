import 'package:flutter/material.dart';

linierIndicator(Color color, double value, double height, double width) =>
    Container(
      height: height,
      width: width,
      child: LinearProgressIndicator(
        value: value,
        valueColor: AlwaysStoppedAnimation<Color>(color),
        backgroundColor: color.withOpacity(.5),
      ),
    );
