import 'package:flutter/material.dart';

class _MenuItem {
  String imageUri;
  String title;
  String description;

  _MenuItem(
    this.imageUri,
    this.title,
    this.description,
  );
}

final _menuItems = List<_MenuItem>()
  ..add(_MenuItem(
    'assets/images/menu_not_found.png',
    'title',
    'subtitle',
  ))
  ..add(_MenuItem(
    'assets/images/menu_not_found.png',
    'title',
    'subtitle',
  ))
  ..add(_MenuItem(
    'assets/images/menu_not_found.png',
    'title',
    'subtitle',
  ))
  ..add(_MenuItem(
    'assets/images/menu_not_found.png',
    'title',
    'subtitle',
  ))
  ..add(_MenuItem(
    'assets/images/menu_not_found.png',
    'title',
    'subtitle',
  ))
  ..add(_MenuItem(
    'assets/images/menu_not_found.png',
    'title',
    'subtitle',
  ));

Widget _buildMenuList({String imageUri, String title, String description}) {
  return Card(
      child: ListTile(
    leading: Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(imageUri),
          )),
    ), //Image.asset(imageUri),
    title: Text(title),
    subtitle: Text(description),
    trailing: Icon(Icons.more_vert),
    isThreeLine: true,
  ));
}

class MenuList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MenuListState();
  }
}

class _MenuListState extends State<MenuList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _menuItems.length,
      itemBuilder: (context, index) => _buildMenuList(
          imageUri: _menuItems[index].imageUri,
          title: _menuItems[index].title,
          description: _menuItems[index].description),
    );
  }
}
