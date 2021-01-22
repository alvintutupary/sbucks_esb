import 'package:flutter/material.dart';
import 'package:sbucks/src/utils/size_config.dart';

class LabelButton extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  final Function onTap;
  const LabelButton({
    @required this.onTap,
    @required this.text,
    this.color = Colors.black,
    this.size = 20,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Text(
        text,
        style: TextStyle(
            fontWeight: FontWeight.bold, color: color, fontSize: size.scs),
      ),
      onTap: onTap,
    );
  }
}
