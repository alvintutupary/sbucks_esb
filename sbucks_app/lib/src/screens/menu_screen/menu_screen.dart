import 'package:flutter/material.dart';
import 'package:sbucks/src/models/menu_model.dart';
import 'package:sbucks/src/blocs/menu_bloc.dart';
import 'package:sbucks/src/screens/menu_screen/menu_screen_widgets/menu_detail.dart';
import 'package:sbucks/src/utils/size_config.dart';
import 'package:sbucks/src/utils/constant.dart';
import 'package:sbucks/src/screens/menu_screen/menu_screen_widgets/menu_category.dart';
import 'package:provider/provider.dart';

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
      body: FutureBuilder(
        future: buildMenuList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) return snapshot.data;
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Future<Widget> buildMenuList() async {
    final _menuBloc = Provider.of<MenuBloc>(context, listen: false);
    // final result = await _storeBloc.fetchMenu();
    List<MenuCategoryModel> categories = _menuBloc.menuCategories;

    final _height = MediaQuery.of(context).size.width / 2;
    final _screenHeight = MediaQuery.of(context).size.height;
    final corouselMenuList = categories.getRange(1, (categories.length - 1));
    return ListView(
      children: [
        _imageWithText(
            categories[0].imageUrl, categories[0].menuCategoryDesc, _height,
            function: () {
          return Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => MenuCategory(
                        data: categories[0],
                      )));
        }),
        if (corouselMenuList != null && corouselMenuList.length > 0)
          _buildNextMenu(
            corouselMenuList,
            _screenHeight,
            _height,
          )
      ],
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
                    data[position].imageUrl,
                    "", //'${data[position].title} $position',
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
        // child: Stack(
        //   children: [
        //     FadeInImage.assetNetwork(
        //         placeholder: AppConstant.kEmptyImage, image: image),
        //     Text(
        //       title,
        //       style: TextStyle(color: Colors.grey, fontSize: 20.scs),
        //     )
        //   ],
        // ),
        onTap: function,
        child: Container(
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: image != null &&
                        image.isNotEmpty &&
                        image != "${AppConstant.kHttpBaseUrl}/null"
                    ? NetworkImage(
                        image,
                      )
                    : AssetImage(
                        AppConstant.kEmptyImage,
                      ),
              ),
            ),
            height: height,
            child: Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 20.scs),
            )),
      );
}
