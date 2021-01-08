import 'package:flutter/material.dart';
import 'package:sbucks/src/utils/size_config.dart';

class StarText extends StatelessWidget {
  final String text;
  final String value;
  final double size;

  const StarText({
    this.text,
    this.value,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          height: size * 3.scs,
          width: 60.scs,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage('assets/img/green_star.png'))),
          child: Text(
            value,
            style: TextStyle(fontSize: size * 1.scs, color: Colors.white),
          ),
        ),
        Text(
          text,
          style: TextStyle(fontSize: size * 1.scs, color: Colors.white),
        ),
      ],
    );
  }
}
