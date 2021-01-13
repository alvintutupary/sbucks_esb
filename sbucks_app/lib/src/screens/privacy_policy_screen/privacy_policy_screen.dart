import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:sbucks/src/utils/constant.dart';
import 'package:url_launcher/url_launcher.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  static final kRouteName = '/privacyPolicyScreen';
  @override
  _PrivacyPolicyScreenState createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
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
            'Privacy & Policy',
            // style: TextStyle(color: Colors.black, fontSize: 25.scs),
          ),
        ),
        // backgroundColor: Colors.white,
      ),
      body: InAppWebView(
        initialUrl: AppConstant.kPrivacyPolicyUrl,
        initialOptions: InAppWebViewGroupOptions(
          crossPlatform: InAppWebViewOptions(
            cacheEnabled: false,
            clearCache: true,
            useShouldOverrideUrlLoading: true,
          ),
        ),
        onProgressChanged: (_, value) {
          setState(() {
            _loadingProgress = value / 100;
            if (_loadingProgress >= 1) {
              _loadingProgress = 0;
            }
          });
        },
        shouldOverrideUrlLoading: _handleUrlChanged,
      ),
    );
  }

  Future<ShouldOverrideUrlLoadingAction> _handleUrlChanged(
      _, ShouldOverrideUrlLoadingRequest request) async {
    final url = request.url;

    if (url != AppConstant.kPrivacyPolicyUrl) {
      if (await canLaunch(url)) {
        await launch(url);
      }

      return ShouldOverrideUrlLoadingAction.CANCEL;
    }

    return ShouldOverrideUrlLoadingAction.ALLOW;
  }
}
