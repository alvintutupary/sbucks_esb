import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:sbucks/src/models/menu_model.dart';
import 'package:sbucks/src/utils/constant.dart';
import 'package:sbucks/src/utils/size_config.dart';
import 'package:url_launcher/url_launcher.dart';

class MenuDetail extends StatefulWidget {
  static const kRouteName = '/menuDetail';
  final MenuModel data;
  MenuDetail({@required this.data});
  @override
  _MenuDetailState createState() => _MenuDetailState();
}

class _MenuDetailState extends State<MenuDetail> {
  double _loadingProgress;

  @override
  void initState() {
    _loadingProgress = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.width / 2;
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.centerLeft,
          child: Text(
            widget.data.menuShortName,
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
          FadeInImage.assetNetwork(
              placeholder: AppConstant.kEmptyImage,
              image: widget.data.imageUrl),
          // Container(
          //   alignment: Alignment.bottomRight,
          //   decoration: BoxDecoration(
          //       image: DecorationImage(
          //     fit: BoxFit.cover,
          //     image: widget.data.imageUrl != null &&
          //             widget.data.imageUrl.isNotEmpty &&
          //             widget.data.imageUrl != "${AppConstant.kHttpBaseUrl}/null"
          //         ? NetworkImage(
          //             widget.data.imageUrl,
          //           )
          //         : AssetImage(
          //             AppConstant.kEmptyImage,
          //           ),
          //   )),
          //   height: MediaQuery.of(context).size.width / 2,
          //   width: MediaQuery.of(context).size.width,
          //   child: Text(widget.data.menuName,
          //       style: TextStyle(
          //           fontSize: 25.scs,
          //           color: Colors.white,
          //           fontWeight: FontWeight.bold)),
          // ),
          Expanded(
            child: Text(widget.data.description),
          ),
        ],
      ),
    );
  }
}
