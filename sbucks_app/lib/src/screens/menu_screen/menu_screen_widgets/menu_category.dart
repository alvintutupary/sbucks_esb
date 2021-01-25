import 'package:flutter/material.dart';
import 'package:sbucks/src/models/menu_model.dart';
import 'package:sbucks/src/screens/menu_screen/menu_screen_widgets/menu_category_detail.dart';
import 'package:sbucks/src/screens/menu_screen/menu_screen_widgets/menu_detail.dart';
import 'package:sbucks/src/utils/constant.dart';
import 'package:sbucks/src/utils/size_config.dart';

class MenuCategory extends StatefulWidget {
  static final kRouteName = '/menuCategory';
  final MenuCategoryModel data;
  MenuCategory({@required this.data});
  @override
  _MenuCategoryState createState() => _MenuCategoryState();
}

class _MenuCategoryState extends State<MenuCategory> {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.centerLeft,
          child: Text(
            widget.data.menuCategoryDesc,
            style: TextStyle(color: Colors.black, fontSize: 25.scs),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: _buildMenu(widget.data.menuCategoryDetails, _height),
    );
  }

  _buildMenu(List<MenuCategoryDetailModel> data, double height) {
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
                    '${data[position].menuCategoryDetailDesc}',
                    height,
                    function: () {
                      return Navigator.push(context,
                          MaterialPageRoute(builder: (_) {
                        return MenuCategoryDetail(
                          data: widget.data.menuCategoryDetails[position],
                        );
                      }));
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
