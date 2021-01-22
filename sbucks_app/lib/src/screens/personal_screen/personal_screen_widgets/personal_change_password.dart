import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sbucks/src/utils/style.dart';
import 'package:sbucks/src/utils/size_config.dart';
import 'package:sbucks/src/widgets/common/app_spacer.dart';
import 'package:sbucks/src/widgets/label_button.dart';
import 'package:sbucks/src/widgets/custom_divider.dart';
import 'package:sbucks/src/utils/style.dart';

class PersonalChangePassword extends StatefulWidget {
  @override
  _PersonalChangePasswordState createState() => _PersonalChangePasswordState();
}

class _PersonalChangePasswordState extends State<PersonalChangePassword> {
  final _formKey = new GlobalKey<FormState>();
  String _password, _newPassword, _newConfirmPassword;
  bool isPasswordVisible, isNewPasswordVisible, isConfirmNewPasswordVisible;

  @override
  void initState() {
    isPasswordVisible = false;
    isNewPasswordVisible = false;
    isConfirmNewPasswordVisible = false;
    super.initState();
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
            'Change Password',
            style: TextStyle(fontSize: 20.scs, fontWeight: FontWeight.bold),
          ),
          CustomDivider(
            height: 2.sch,
          ),
          AppSpacer.vSpacing(5),
          Padding(
            padding: EdgeInsets.all(10.scs),
            child: Column(
              children: [
                AppSpacer.vSpacing(5),
                Theme(
                  data: Theme.of(context).copyWith(
                    primaryColor: AppColor.kPrimaryBrand,
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    validator: (value) => value.isEmpty
                        ? "Please enter password"
                        : value != '123123'
                            ? "Password wrong"
                            : null,
                    onSaved: (value) => _password = value,
                    obscureText: !isPasswordVisible,
                    decoration: InputDecoration(
                      labelText: 'New Password',
                      suffixIcon: IconButton(
                        icon: Icon(isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                AppSpacer.vSpacing(5),
                Theme(
                  data: Theme.of(context).copyWith(
                    primaryColor: AppColor.kPrimaryBrand,
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    validator: (value) => value.isEmpty
                        ? "Please enter new password"
                        : value != '123123'
                            ? "Password wrong"
                            : null,
                    onSaved: (value) => _newPassword = value,
                    obscureText: !isNewPasswordVisible,
                    decoration: InputDecoration(
                      labelText: 'New Password',
                      suffixIcon: IconButton(
                        icon: Icon(isNewPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            isNewPasswordVisible = !isNewPasswordVisible;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                AppSpacer.vSpacing(5),
                Theme(
                  data: Theme.of(context).copyWith(
                    primaryColor: AppColor.kPrimaryBrand,
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    validator: (value) => value.isEmpty
                        ? "Please enter new password"
                        : value != '123123'
                            ? "Password wrong"
                            : null,
                    onSaved: (value) => _newConfirmPassword = value,
                    obscureText: !isConfirmNewPasswordVisible,
                    decoration: InputDecoration(
                      labelText: 'Confirm New Password',
                      suffixIcon: IconButton(
                        icon: Icon(isConfirmNewPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            isConfirmNewPasswordVisible =
                                !isConfirmNewPasswordVisible;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
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
                  text: 'SEND',
                  color: Colors.white,
                  onTap: () {},
                ),
                // showForgotEmailToast(context, _formKey, 'text')),
              ],
            ),
          )
        ],
      ),
    );
  }
}
