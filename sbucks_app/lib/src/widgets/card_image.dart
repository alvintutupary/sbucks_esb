import 'package:flutter/material.dart';

class CardImage extends StatelessWidget {
  final String imageUri;
  final double size;
  const CardImage(this.imageUri, {this.size});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Image.asset(
          imageUri,
          fit: BoxFit.fill,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 5,
        margin: EdgeInsets.all(10),
      ),
    );
  }
}
