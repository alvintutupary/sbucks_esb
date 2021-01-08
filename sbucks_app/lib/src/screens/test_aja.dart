import 'package:flutter/material.dart';
import 'package:sbucks/src/utils/size_config.dart';

class TestAja extends StatefulWidget {
  @override
  _TestAjaState createState() => _TestAjaState();
}

class _TestAjaState extends State<TestAja> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          height: 60.scs,
          width: 60.scs,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage('assets/img/green_star.png'))),
          child: Text(
            '1',
            style: TextStyle(fontSize: 20.scs, color: Colors.white),
          ),
        ),
        Text(
          '1',
          style: TextStyle(fontSize: 20.scs, color: Colors.white),
        ),
      ],
    );
  }
}
