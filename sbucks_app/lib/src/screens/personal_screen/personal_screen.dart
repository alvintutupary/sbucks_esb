import 'package:flutter/material.dart';
import 'package:sbucks/src/screens/premium_screen/premium_screen.dart';
import 'package:sbucks/src/screens/personal_screen/personal_screen_widgets/personal_change_password.dart';
import 'package:sbucks/src/utils/style.dart';
import 'package:sbucks/src/utils/size_config.dart';
import 'package:sbucks/src/widgets/common/app_spacer.dart';
import 'package:sbucks/src/widgets/common/wide_button.dart';
import 'package:sbucks/src/screens/personal_screen/personal_screen_widgets/personal_change_detail.dart';

class PersonalScreen extends StatefulWidget {
  @override
  _PersonalScreenState createState() => _PersonalScreenState();
}

class _PersonalScreenState extends State<PersonalScreen> {
  void showDialogChangePassword() async {
    final bool isVerifiedLogin = await showDialog(
      barrierDismissible: false,
      context: context,
      child: AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        contentPadding: EdgeInsets.all(0),
        content: PersonalChangePassword(),
      ),
    );

    if (isVerifiedLogin) {
      // Navigator.pushNamed(context, LoginEmailOTP.kRouteName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Alvin Tutupary',
                style: TextStyle(
                  fontSize: 25.scs,
                ),
              ),
              Text(
                'tutuparyalvin@gmail.com',
                style: TextStyle(
                  fontSize: 20.scs,
                ),
              ),
              Text(
                'Birth date : 01 Jan',
                style: TextStyle(
                  fontSize: 15.scs,
                ),
              ),
              AppSpacer.vSpacing(10),
              WideButton(
                color: AppColor.kSecondaryBrand,
                flatButton: true,
                child: Text(
                  'Change Detail',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                circularRadius: 0,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => PersonalChangeDetail()));
                },
              ),
              WideButton(
                color: AppColor.kSecondaryBrand,
                flatButton: true,
                child: Text(
                  'Change Password',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                circularRadius: 0,
                onPressed: () => showDialogChangePassword(),
              ),
              WideButton(
                color: Color(0xff006442),
                flatButton: true,
                child: Text(
                  'Go Premium',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                circularRadius: 0,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => PremiumScreen()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
