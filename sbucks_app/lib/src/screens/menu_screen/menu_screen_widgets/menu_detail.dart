import 'package:flutter/material.dart';
import 'package:sbucks/src/models/menu_model.dart';
import 'package:sbucks/src/utils/size_config.dart';

class MenuDetail extends StatefulWidget {
  static final kRouteName = '/menuDetail';
  final MenuDetailModel data;
  MenuDetail({@required this.data});
  @override
  _MenuDetailState createState() => _MenuDetailState();
}

class _MenuDetailState extends State<MenuDetail> {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.width / 2;
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.centerLeft,
          child: Text(
            widget.data.title,
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
      body: Column(
        children: [
          Container(
            width: double.infinity,
            child: Image.asset(widget.data.imageUri),
          ),
          Text(widget.data.description)
        ],
      ),
    );
  }
}
