import 'package:flutter/material.dart';
import 'package:sbucks/src/screens/login_screen/login_screen.dart';
import 'package:sbucks/src/widgets/custom_dialog.dart';
import 'package:sbucks/src/utils/constant.dart';
import 'package:sbucks/src/screens/static_screen/static_screen.dart';
import 'package:sbucks/src/screens/intro_screen/intro_screen.dart';
import 'package:sbucks/src/widgets/custom_divider.dart';
import 'package:sbucks/src/widgets/common/app_spacer.dart';
import 'package:sbucks/src/utils/size_config.dart';
import 'package:sbucks/src/widgets/label_button.dart';
import 'package:sbucks/src/utils/style.dart';
import 'package:sbucks/src/blocs/app_bloc.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool isSwitched;

  @override
  void initState() {
    isSwitched = false;
    super.initState();
  }

  void doLogOut() async {
    showDialog(
      barrierDismissible: false,
      context: context,
      child: AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        contentPadding: EdgeInsets.all(0),
        content: SignOutDialog(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Shake to Pay'),
              Switch(
                value: isSwitched,
                onChanged: (value) {
                  setState(() {
                    isSwitched = value;
                  });
                },
              )
            ],
          ),
          _buildList('Change Language', '', () {
            return CustomDialog.common(context,
                title: Text('Change  Language'),
                widget: Column(
                  children: [
                    InkWell(
                      child: Text('English'),
                      onTap: () {},
                    ),
                    InkWell(
                      child: Text('Indonesia'),
                      onTap: () {},
                    ),
                  ],
                ));
          }),
          _buildList('Passcode Lock', '', () {
            return CustomDialog.common(
              context,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('PASSCODE LOCK'),
                  Text('ON'),
                ],
              ),
              widget: InkWell(
                child: ListTile(
                  leading: Icon(Icons.mode_edit),
                  title: Text('Change Passcode'),
                ),
                onTap: () {},
              ),
            );
          }),
          _buildList('Faq', '', () {
            return Navigator.pushNamed(context, StaticScreen.kRouteName,
                arguments: AppConstant.kFaqId);
          }),
          _buildList('Privacy Policy', '', () {
            return Navigator.pushNamed(context, StaticScreen.kRouteName,
                arguments: AppConstant.kPrivacyId);
          }),
          _buildList('Terms & Condition', '', () {
            return Navigator.pushNamed(context, StaticScreen.kRouteName,
                arguments: AppConstant.kTacId);
          }),
          _buildList('Contact Us', '', () {
            return Navigator.pushNamed(context, StaticScreen.kRouteName,
                arguments: AppConstant.kContactUsId);
          }),
          _buildList('Tutorial', '',
              () => Navigator.pushNamed(context, IntroScreen.kRouteName)),
          _buildList(
            'Sign Out',
            'tutuparyalvin@gmail.com',
            () => doLogOut(),
          ),
          Text('App Version 3.0.8'),
        ],
      ),
    );
  }

  _buildList(
    String text,
    String text2,
    Function onTap,
  ) =>
      Column(
        children: [
          InkWell(
            child: Padding(
              padding: EdgeInsets.all(8.sch),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(text),
                  Text(text2),
                ],
              ),
            ),
            onTap: onTap,
          ),
          // Divider(color: Colors.black),
          CustomDivider(
            color: Colors.black,
            height: 1.scs,
          )
        ],
      );
}

class SignOutDialog extends StatefulWidget {
  @override
  SignOutDialogState createState() => SignOutDialogState();
}

class SignOutDialogState extends State<SignOutDialog> {
  final _formKey = new GlobalKey<FormState>();
  bool isPasswordVisible;

  @override
  void initState() {
    isPasswordVisible = false;
    super.initState();
  }

  void doSignOut() async {
    appBloc.clearPin();
    Navigator.pushNamedAndRemoveUntil(
        context, LoginScreen.kRouteName, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppSpacer.vSpacing(10),
          Text(
            'Warning',
            style: TextStyle(fontSize: 20.scs, fontWeight: FontWeight.bold),
          ),
          CustomDivider(
            height: 2.sch,
          ),
          AppSpacer.vSpacing(5),
          Text('Are you sure want to sign out?'),
          AppSpacer.vSpacing(10),
          Container(
            color: AppColor.kDialogButtonColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                LabelButton(
                  text: 'CANCEL',
                  color: Colors.white,
                  onTap: () {
                    Navigator.pop(context, false);
                  },
                ),
                CustomDivider(
                  width: 2.scs,
                  height: 50.sch,
                  color: Colors.white,
                ),
                LabelButton(
                    text: 'OK', color: Colors.white, onTap: () => doSignOut()),
              ],
            ),
          )
        ],
      ),
    );
  }
}
