import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:sbucks/src/utils/size_config.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:sbucks/src/blocs/content_bloc.dart';
import 'package:sbucks/src/models/content_model.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:sbucks/src/utils/utilities.dart';
import 'package:provider/provider.dart';

class RewardBenefit extends StatefulWidget {
  static final kRouteName = '/RewardBenefit';
  @override
  _RewardBenefitState createState() => _RewardBenefitState();
}

class _RewardBenefitState extends State<RewardBenefit> {
  double _loadingProgress;

  @override
  void initState() {
    _loadingProgress = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _contentBloc = Provider.of<ContentBloc>(context, listen: false);

    List<ContentModel> data = _contentBloc.rewardBenefitContents;
    return DefaultTabController(
      length: data.length,
      child: Scaffold(
        appBar: AppBar(
          title: Container(
            alignment: Alignment.centerLeft,
            child: Text(
              'Rewards Benefit',
              style: TextStyle(color: Colors.black, fontSize: 25.scs),
            ),
          ),
          backgroundColor: Colors.white,
          bottom: TabBar(
            labelColor: Color(0xff006442),
            indicatorColor: Color(0xff006442),
            tabs: data
                .map((item) => Tab(
                      child: Text(item.titleEn),
                    ))
                .toList(),
          ),
        ),
        body: TabBarView(
          children: data
              .map(
                (content) => RewardView(
                  data: content,
                  onProgressChanged: (_, value) {
                    setState(() {
                      _loadingProgress = value / 100;
                      if (_loadingProgress >= 1) {
                        _loadingProgress = 0;
                      }
                    });
                  },
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class RewardView extends StatelessWidget {
  final ContentModel data;
  final Function onProgressChanged;

  RewardView({this.data, this.onProgressChanged});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.bottomRight,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.contain,
                  image: NetworkImage(data.images[0].imageUrl))),
          height: MediaQuery.of(context).size.width / 2,
          width: MediaQuery.of(context).size.width,
        ),
        Text(data.titleEn,
            style: TextStyle(
                fontSize: 25.scs,
                // color: Colors.black,
                fontWeight: FontWeight.bold)),
        Expanded(
          child: SingleChildScrollView(
            child: Html(
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
          ),
        ),
      ],
    );
  }
}
