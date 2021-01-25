import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:sbucks/src/models/content_model.dart';
import 'package:sbucks/src/utils/constant.dart';
import 'package:sbucks/src/widgets/common/custom_stream_builder.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:provider/provider.dart';
import 'package:sbucks/src/blocs/content_bloc.dart';
import 'package:sbucks/src/utils/style.dart';
import 'package:sbucks/src/utils/size_config.dart';
import 'package:sbucks/src/utils/utilities.dart';

class StaticScreen extends StatefulWidget {
  static const kRouteName = '/StaticScreen';
  final int contentID;
  const StaticScreen(this.contentID);

  @override
  SstaticPageStateScreen createState() => SstaticPageStateScreen();
}

class SstaticPageStateScreen extends State<StaticScreen> {
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
          // title: Container(
          //   alignment: Alignment.centerLeft,
          //   child: Text(
          //     'Term And Condition',
          //   ),
          // ),
          ),
      body: FutureBuilder<Widget>(
        future: buildContent(),
        builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
          if (snapshot.hasData) return snapshot.data;
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Future<Widget> buildContent() async {
    final contentBloc = Provider.of<ContentBloc>(context, listen: false);
    final result = await contentBloc.fetchContentbyId(widget.contentID);

    ContentModel data = result.body;
    if (data == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data.titleEn,
              style: TextStyle(
                fontSize: 30.scs,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('data.createdAt'),
            Html(
              data: data.descriptionEn,

              //Optional parameters:
              // backgroundColor: Colors.white70,
              onLinkTap: (url) {
                Utilities().launchURL(url);
              },
              style: {
                "a": Style(
                    textDecorationColor: Colors.greenAccent[600],
                    color: Colors.greenAccent[600]),
              },
              onImageTap: (src) {
                Utilities().launchURL(src);
              },
            ),
          ],
        ),
      );
    }
  }
}
