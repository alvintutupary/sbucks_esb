import 'package:flutter/material.dart';

class ProgressSpinner extends StatelessWidget {
  final double size;

  ProgressSpinner({this.size});

  @override
  Widget build(BuildContext context) {
    if (this.size != null) {
      return SizedBox(
        width: size,
        height: size,
        child: Center(
          child: CircularProgressIndicator(strokeWidth: 2.0),
        ),
      );
    }
    return Center(
      child: CircularProgressIndicator(strokeWidth: 2.0),
    );
  }
}
