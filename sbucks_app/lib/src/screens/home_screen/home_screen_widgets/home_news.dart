import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:sbucks/src/models/news_model.dart';
import 'package:sbucks/src/utils/size_config.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/html_parser.dart';
import 'package:flutter_html/style.dart';
import 'package:provider/provider.dart';
import 'package:sbucks/src/blocs/content_bloc.dart';
import 'package:sbucks/src/models/content_model.dart';
import 'package:sbucks/src/utils/constant.dart';

class HomeNews extends StatefulWidget {
  static const kRouteName = '/HomeNews';
  final ContentModel content;
  HomeNews({@required this.content});
  @override
  _HomeNewsState createState() => _HomeNewsState();
}

class _HomeNewsState extends State<HomeNews> {
  double _loadingProgress;

  @override
  void initState() {
    _loadingProgress = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.centerLeft,
          child: Text(
            widget.content.titleEn,
            style: TextStyle(color: Colors.black, fontSize: 25.scs),
          ),
        ),
      ),
      body: FutureBuilder(
          future: buildContent(widget.content),
          builder: (context, snapshot) => snapshot.hasData
              ? snapshot.data
              : Center(
                  child: CircularProgressIndicator(),
                )),
    );
  }

  Future<Widget> buildContent(ContentModel data) async {
    return Column(
      children: [
        Container(
          // padding: EdgeInsets.all(0),
          alignment: Alignment.bottomRight,
          // decoration: BoxDecoration(
          //     image: DecorationImage(
          //         fit: BoxFit.cover,
          //         image: NetworkImage(data.images[0].imageUrl))),
          height: MediaQuery.of(context).size.width / 2,
          width: MediaQuery.of(context).size.width,
          child: ClipRRect(
            child: FadeInImage.assetNetwork(
                placeholder: AppConstant.kEmptyImage,
                image: data.images[0].imageUrl),
          ),
        ),
        Text(
          data.titleEn,
          style: TextStyle(
            fontSize: 25.scs,
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(
          child: Html(
            data: data.descriptionEn,
            //Optional parameters:
            style: {
              "table": Style(
                backgroundColor: Color.fromARGB(0x50, 0xee, 0xee, 0xee),
              ),
              "tr": Style(
                border: Border(bottom: BorderSide(color: Colors.grey)),
              ),
              "th": Style(
                padding: EdgeInsets.all(6),
                backgroundColor: Colors.grey,
              ),
              "td": Style(
                padding: EdgeInsets.all(6),
              ),
              "var": Style(fontFamily: 'serif'),
            },
            customRender: {
              "flutter": (RenderContext context, Widget child, attributes, _) {
                return FlutterLogo(
                  style: (attributes['horizontal'] != null)
                      ? FlutterLogoStyle.horizontal
                      : FlutterLogoStyle.markOnly,
                  textColor: context.style.color,
                  size: context.style.fontSize.size * 5,
                );
              },
            },
            onLinkTap: (url) {
              print("Opening $url...");
            },
            onImageTap: (src) {
              print(src);
            },
            onImageError: (exception, stackTrace) {
              print(exception);
            },
          ),
        ),
      ],
    );
  }
}
