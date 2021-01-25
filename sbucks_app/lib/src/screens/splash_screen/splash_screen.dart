import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sbucks/src/screens/intro_screen/intro_screen.dart';
import 'package:sbucks/src/screens/login_screen/login_screen_widget/login_pin.dart';
import 'package:sbucks/src/screens/login_screen/login_screen.dart';
import 'package:sbucks/src/utils/size_config.dart';
import 'package:sbucks/src/utils/style.dart';
import 'package:sbucks/src/blocs/app_bloc.dart';
import 'package:sbucks/src/blocs/content_bloc.dart';
import 'package:sbucks/src/blocs/menu_bloc.dart';
import 'package:sbucks/src/utils/constant.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  static const kRouteName = '/';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> _loadData() async {
    final isFirstRun = await appBloc.isFirstRun();
    final userPin = await appBloc.getPin();

    if (isFirstRun) {
      Navigator.pushReplacementNamed(context, IntroScreen.kRouteName);
    } else {
      if (userPin.isEmpty) {
        Navigator.pushReplacementNamed(context, LoginScreen.kRouteName);
      } else {
        final _contentBloc = Provider.of<ContentBloc>(context, listen: false);
        final _menuBloc = Provider.of<MenuBloc>(context, listen: false);
        final resCarouselImages =
            await _contentBloc.fetchContentbyType(AppConstant.kCarouselImages);
        final resWhatsNews =
            await _contentBloc.fetchContentbyType(AppConstant.kWhatsNews);
        final resRewardBenefit =
            await _contentBloc.fetchContentbyType(AppConstant.kRewardBenefit);
        final resContactUs =
            await _contentBloc.fetchContentbyType(AppConstant.kContactUs);
        final resFAQ = await _contentBloc.fetchContentbyType(AppConstant.kFAQ);
        final resPrivacy =
            await _contentBloc.fetchContentbyType(AppConstant.kPrivacy);
        final resTac = await _contentBloc.fetchContentbyType(AppConstant.kTac);
        final resMenu = await _menuBloc.fetchMenu();

        _contentBloc.rewardBenefitContents = resRewardBenefit.body;
        _contentBloc.tacContents = resTac.body;
        _contentBloc.whatsNewsContents = resWhatsNews.body;
        _contentBloc.carouselImagesContents = resCarouselImages.body;
        _contentBloc.faqContents = resFAQ.body;
        _contentBloc.contactUsContents = resContactUs.body;
        _contentBloc.privacyContents = resPrivacy.body;
        _menuBloc.menuCategories = resMenu.body.menuCategory;
        Navigator.pushReplacementNamed(context, LoginPin.kRouteName);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _loadData();
    // Future.delayed(Duration(seconds: 3), () {
    // });
  }

  @override
  Widget build(BuildContext context) {
    // final _contentBloc = Provider.of<ContentBloc>(context, listen: false);
    // final result =
    //     await _contentBloc.fetchContentbyType(AppConstant.kCarouselImages);
    // List<ContentModel> datas = result.body;
    return Scaffold(
      backgroundColor: AppColor.kPrimaryBrand,
      body: SafeArea(
        child: Center(
          child: Image.asset(
            'assets/img/icon-1.PNG',
            width: 120.scw,
          ),
        ),
      ),
    );
  }
}
