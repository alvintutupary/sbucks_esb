import 'package:flutter/material.dart';
import 'package:sbucks/src/screens/login_screen/login_screen.dart';
import 'package:sbucks/src/widgets/custom_dialog.dart';
import 'package:sbucks/src/screens/faq_screen/faq_screen.dart';
import 'package:sbucks/src/screens/privacy_policy_screen/privacy_policy_screen.dart';
import 'package:sbucks/src/screens/term_condition_screen/term_condition_screen.dart';
import 'package:sbucks/src/screens/contact_us_screen/contact_us_screen.dart';
import 'package:sbucks/src/screens/tutorial_screen/tutorial_screen.dart';

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
            return Navigator.push(
                context, MaterialPageRoute(builder: (_) => FaqScreen()));
          }),
          _buildList('Privacy Policy', '', () {
            return Navigator.push(context,
                MaterialPageRoute(builder: (_) => PrivacyPolicyScreen()));
          }),
          _buildList('Terms & Condition', '', () {
            return Navigator.push(context,
                MaterialPageRoute(builder: (_) => TermConditionScreen()));
          }),
          _buildList('Contact Us', '', () {
            return Navigator.push(
                context, MaterialPageRoute(builder: (_) => ContactUsScreen()));
          }),
          _buildList('Tutorial', '',
              () => Navigator.pushNamed(context, TutorialScreen.kRouteName)),
          _buildList('Sign Out', 'tutuparyalvin@gmail.com',
              () => Navigator.pushNamed(context, LoginScreen.kRouteName)),
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
      InkWell(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(text),
                Text(text2),
              ],
            ),
            Divider(color: Colors.black),
          ],
        ),
        onTap: onTap,
      );
}
