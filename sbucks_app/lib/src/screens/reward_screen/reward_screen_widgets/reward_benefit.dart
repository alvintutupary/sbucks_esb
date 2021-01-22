import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:sbucks/src/utils/size_config.dart';
import 'package:url_launcher/url_launcher.dart';

class RewardBenefitModel {
  String imageUri;
  String title;
  String descriptionUri;
  RewardBenefitModel(
    this.imageUri,
    this.title,
    this.descriptionUri,
  );
}

class RewardBenefit extends StatefulWidget {
  static final kRouteName = '/RewardBenefit';
  // final RewardBenefitModel data;
  // RewardBenefit({@required this.data});
  @override
  _RewardBenefitState createState() => _RewardBenefitState();
}

class _RewardBenefitState extends State<RewardBenefit> {
  double _loadingProgress;
  final data = List<RewardBenefitModel>()
    ..add(RewardBenefitModel('assets/img/green_star.png', 'Green Member',
        'https://qoqi.co.id/kebijakan-privasi.html'))
    ..add(RewardBenefitModel('assets/img/gold_star.png', 'Gold Member',
        'https://qoqi.co.id/kebijakan-privasi.html'));
  @override
  void initState() {
    _loadingProgress = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                          child: Text(item.title),
                        ))
                    .toList(),
              ),
            ),
            body: TabBarView(children: [
              RewardView(
                  data: data[0],
                  onProgressChanged: (_, value) {
                    setState(() {
                      _loadingProgress = value / 100;
                      if (_loadingProgress >= 1) {
                        _loadingProgress = 0;
                      }
                    });
                  }),
              RewardView(
                  data: data[1],
                  onProgressChanged: (_, value) {
                    setState(() {
                      _loadingProgress = value / 100;
                      if (_loadingProgress >= 1) {
                        _loadingProgress = 0;
                      }
                    });
                  }),
            ])));
  }
}

class RewardView extends StatelessWidget {
  // bool _loadingProgress;
  final RewardBenefitModel data;
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
                  fit: BoxFit.contain, image: AssetImage(data.imageUri))),
          height: MediaQuery.of(context).size.width / 2,
          width: MediaQuery.of(context).size.width,
        ),
        Text(data.title,
            style: TextStyle(
                fontSize: 25.scs,
                // color: Colors.black,
                fontWeight: FontWeight.bold)),
        Expanded(
          child: InAppWebView(
            initialUrl: data.descriptionUri,
            initialOptions: InAppWebViewGroupOptions(
              crossPlatform: InAppWebViewOptions(
                cacheEnabled: false,
                clearCache: true,
                useShouldOverrideUrlLoading: true,
              ),
            ),
            onProgressChanged: onProgressChanged,
            shouldOverrideUrlLoading: _handleUrlChanged,
          ),
        ),
      ],
    );
  }

  Future<ShouldOverrideUrlLoadingAction> _handleUrlChanged(
      _, ShouldOverrideUrlLoadingRequest request) async {
    final url = request.url;

    if (url != data.descriptionUri) {
      if (await canLaunch(url)) {
        await launch(url);
      }

      return ShouldOverrideUrlLoadingAction.CANCEL;
    }

    return ShouldOverrideUrlLoadingAction.ALLOW;
  }
}
