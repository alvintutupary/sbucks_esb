import 'package:flutter/material.dart';
import 'package:sbucks/src/models/menu_model.dart';
import 'package:sbucks/src/screens/menu_screen/menu_screen_widgets/dummy_data.dart';
import 'package:sbucks/src/screens/menu_screen/menu_screen_widgets/menu_detail.dart';
import 'package:sbucks/src/utils/size_config.dart';
import 'package:sbucks/src/screens/menu_screen/menu_screen_widgets/menu_category.dart';

// class MenuScreen extends StatefulWidget {
//   static final kRouteName = '/menu';
//   @override
//   _MenuScreenState createState() => _MenuScreenState();
// }

// class _MenuScreenState extends State<MenuScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: MenuCategory());
//   }
// }

class MenuScreen extends StatefulWidget {
  // static final kRouteName = '/MenuScreen';
  // final MenuModel menuModel;
  // MenuScreen({@required this.menuModel});
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  static final kRouteName = '/menu';
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.width / 2;
    final _screenHeight = MediaQuery.of(context).size.height;

    final _menuCategories = DummyData().menuCategories;
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.centerLeft,
          child: Text(
            'Menu',
            style: TextStyle(color: Colors.black, fontSize: 25.scs),
          ),
        ),
        actions: [
          Icon(
            Icons.search,
            color: Colors.black,
            size: 25.scs,
          )
        ],
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          _imageWithText(
              _menuCategories[0].imageUri, _menuCategories[0].title, _height,
              function: () {
            return Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => MenuCategory(
                          data: _menuCategories[0],
                        )));
          }),
          _buildNextMenu(
            _menuCategories,
            _screenHeight,
            _height,
          )
        ],
      ),
    );
  }

  _buildNextMenu(
    List<MenuCategoryModel> data,
    double screenHeight,
    height,
  ) {
    return SizedBox(
        width: double.infinity,
        height: screenHeight - height,
        child: Container(
            child: GridView.builder(
                physics: ClampingScrollPhysics(),
                itemCount: data.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, position) {
                  return _imageWithText(
                    data[position].imageUri,
                    '${data[position].title} $position',
                    height,
                    function: () {
                      return Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => MenuCategory(
                                    data: data[position],
                                  )));
                    },
                  );
                })));
  }

  _imageWithText(String image, title, double height, {Function function}) =>
      InkWell(
        child: Container(
            alignment: Alignment.bottomCenter,
            decoration:
                BoxDecoration(image: DecorationImage(image: AssetImage(image))),
            height: height,
            child: Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 20.scs),
            )),
        onTap: function,
      );
}
