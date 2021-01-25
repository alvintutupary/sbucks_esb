import 'package:flutter/material.dart';
import 'package:sbucks/src/models/menu_model.dart';
import 'package:sbucks/src/screens/menu_screen/menu_screen_widgets/menu_category_detail.dart';
import 'package:sbucks/src/screens/menu_screen/menu_screen_widgets/menu_detail.dart';
import 'package:sbucks/src/models/menu_model.dart';
import 'package:sbucks/src/screens/reward_screen/reward_screen.dart';
import 'package:sbucks/src/utils/constant.dart';
import 'package:sbucks/src/utils/size_config.dart';

class MenuCategoryDetail extends StatefulWidget {
  static final kRouteName = '/menuCategoryDetail';
  final MenuCategoryDetailModel data;
  MenuCategoryDetail({@required this.data});
  @override
  _MenuCategoryDetailState createState() => _MenuCategoryDetailState();
}

class _MenuCategoryDetailState extends State<MenuCategoryDetail> {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    // final _screenHeight = MediaQuery.of(context).size.width - _height;
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.centerLeft,
          child: Text(
            widget.data.menuCategoryDetailDesc,
            style: TextStyle(color: Colors.black, fontSize: 25.scs),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: _buildMenu(widget.data.menus, _height),
    );
  }

  _buildMenu(List<MenuModel> data, double height) {
    return SizedBox(
        width: double.infinity,
        // height: ,
        height: height,
        child: Container(
            // margin: EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: GridView.builder(
                physics: ClampingScrollPhysics(),
                itemCount: data.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, position) {
                  return _imageWithText(
                    data[position].imageUrl ?? AppConstant.kEmptyImage,
                    '${data[position].menuName}',
                    height,
                    function: () {
                      return Navigator.pushNamed(
                        context,
                        MenuDetail.kRouteName,
                        arguments: data[position],
                      );
                    },
                  );
                })));
  }

  _imageWithText(String image, title, double height, {Function function}) =>
      InkWell(
        child: Stack(
          children: [
            FadeInImage.assetNetwork(
                placeholder: AppConstant.kEmptyImage, image: image),
            Text(
              title,
              style: TextStyle(color: Colors.grey, fontSize: 20.scs),
            )
          ],
        ),
        onTap: function,
      );
  // InkWell(
  //   child: Container(
  //       alignment: Alignment.bottomCenter,
  //       decoration:
  //           BoxDecoration(image: DecorationImage(image: AssetImage(image))),
  //       height: height,
  //       child: Text(
  //         title,
  //         style: TextStyle(color: Colors.white, fontSize: 20.scs),
  //       )),
  //   onTap: function,
  // );
}
