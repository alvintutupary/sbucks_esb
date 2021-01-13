import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function onTap;
  final Color color;
  final double thicknes;
  CustomListTile({
    this.title,
    this.icon,
    this.onTap,
    this.color,
    this.thicknes,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            InkWell(
              child: ListTile(
                title: Text(title ?? ''),
                trailing: icon != null ? Icon(icon) : null,
                onTap: onTap,
              ),
            ),
          ],
        ),
        Divider(
          thickness: 2,
          color: color ?? Colors.black,
        )
      ],
    );
  }
}
