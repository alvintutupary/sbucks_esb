import 'package:flutter/material.dart';
import 'package:sbucks/src/widgets/common/wide_button.dart';

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
    'Americano',
    ''' add MenuItem 'assets/images/menu_not_found.png' 'Mojito' 'subtitle''',
  ))
  ..add(_MenuItem(
    'assets/images/menu_not_found.png',
    'Manhattan',
    ''' add MenuItem 'assets/images/menu_not_found.png' 'Mojito' 'subtitle''',
  ))
  ..add(_MenuItem(
    'assets/images/menu_not_found.png',
    'Margarita',
    ''' add MenuItem 'assets/images/menu_not_found.png' 'Mojito' 'subtitle''',
  ))
  ..add(_MenuItem(
    'assets/images/menu_not_found.png',
    'Mojito',
    ''' add MenuItem 'assets/images/menu_not_found.png' 'Mojito' 'subtitle''',
  ))
  ..add(_MenuItem(
    'assets/images/menu_not_found.png',
    'Ambonese',
    ''' add MenuItem 'assets/images/menu_not_found.png' 'Mojito' 'subtitle''',
  ))
  ..add(_MenuItem(
    'assets/images/menu_not_found.png',
    'Japanese',
    ''' add MenuItem 'assets/images/menu_not_found.png' 'Mojito' 'subtitle''',
  ));

Widget _buildMenuList(
    {String imageUri, String title, String description, int index}) {
  bool isLeft = index % 2 == 0;
  final _buildImage = Container(
    width: 50.0,
    height: 50.0,
    decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(imageUri),
        )),
  );

  return Card(
      child: Column(
    children: [
      ListTile(
        leading: isLeft ? _buildImage : null, //Image.asset(imageUri),
        title: Text(title),
        subtitle: Text(description),
        trailing: isLeft ? null : _buildImage,
        isThreeLine: true,
      ),
      WideButton(
        child: Text('View'),
        width: 20,
        onPressed: () {},
      )
    ],
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
        itemBuilder: (context, index) {
          return Column(
            children: [
              _buildMenuList(
                imageUri: _menuItems[index].imageUri,
                title: _menuItems[index].title,
                description: _menuItems[index].description,
                index: index,
              ),
            ],
          );
        });
  }
}
