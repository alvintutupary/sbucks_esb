import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sbucks/src/screens/login_screen/login_screen_widget/login_email_otp.dart';
import 'package:sbucks/src/utils/style.dart';
import 'package:sbucks/src/utils/size_config.dart';
import 'package:sbucks/src/widgets/common/app_spacer.dart';
import 'package:sbucks/src/widgets/common/app_text_field.dart';
import 'package:sbucks/src/widgets/label_button.dart';
import 'package:sbucks/src/widgets/custom_divider.dart';
import 'package:sbucks/src/blocs/account_bloc.dart';
import 'package:sbucks/src/models/request_otp_result_model.dart';
import 'package:provider/provider.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

class LoginScreen extends StatefulWidget {
  static const kRouteName = '/login';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void showDialogLogin() async {
    RequestOtpResult resArguments = await showDialog(
      barrierDismissible: false,
      context: context,
      child: AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        contentPadding: EdgeInsets.all(0),
        content: LoginDialog(),
      ),
    );
    if (resArguments != null) {
      Navigator.pushNamed(context, LoginEmailOTP.kRouteName,
          arguments: resArguments);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColor.kPrimaryBackground,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/img/bg-5.jpg'), fit: BoxFit.cover),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              children: [
                CustomDivider(color: Colors.white, height: 2.scs),
                Padding(
                    padding: EdgeInsets.all(5.sch),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        LabelButton(
                          text: 'JOIN NOW',
                          color: Colors.white,
                          onTap: () {},
                        ),
                        CustomDivider(
                          width: 2.scs,
                          height: 40.sch,
                          color: Colors.white,
                        ),
                        LabelButton(
                          text: 'SIGN IN',
                          color: Colors.white,
                          onTap: () => showDialogLogin(),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LoginDialog extends StatefulWidget {
  @override
  _LoginDialogState createState() => _LoginDialogState();
}

class _LoginDialogState extends State<LoginDialog> {
  final _formKey = new GlobalKey<FormState>();
  String _email, _password;
  bool isPasswordVisible;

  @override
  void initState() {
    _email = "";
    _password = "";
    isPasswordVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final accountBloc = Provider.of<AccountBloc>(context, listen: false);

    onSubmitLogin(
      BuildContext context,
      GlobalKey<FormState> _formKey,
    ) async {
      if (_formKey.currentState.validate()) {
        _formKey.currentState.save();
        final resultLogin = await accountBloc.login(_email, _password);
        if (resultLogin.body) {
          final otpResult = await accountBloc.requestOtp(_email);
          RequestOtpResult requestOtpResult = otpResult.body;
          Navigator.pop(context, requestOtpResult);
        }
      }
    }

    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppSpacer.vSpacing(10),
          Text(
            'SIGN IN',
            style: TextStyle(fontSize: 20.scs, fontWeight: FontWeight.bold),
          ),
          AppSpacer.vSpacing(10),
          CustomDivider(
            height: 2.sch,
          ),
          AppSpacer.vSpacing(5),
          Padding(
            padding: EdgeInsets.all(10.scs),
            child: Column(
              children: [
                Theme(
                  data: Theme.of(context).copyWith(
                    primaryColor: AppColor.kPrimaryBrand,
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    validator: validateEmail,
                    onSaved: (value) => _email = value,
                    decoration: InputDecoration(
                        labelText: 'Email', icon: Icon(Icons.email)),
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
                    validator: (value) =>
                        value.isEmpty ? "Please enter password" : null,
                    onSaved: (value) => _password = value,
                    obscureText: !isPasswordVisible,
                    decoration: InputDecoration(
                        labelText: 'Password',
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
                        icon: Icon(Icons.vpn_key)),
                  ),
                ),
                InkWell(
                  onTap: () => showDialog(
                    barrierDismissible: false,
                    context: context,
                    child: AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero),
                      contentPadding: EdgeInsets.all(0),
                      content: ForgetPasswordDialog(),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.sch),
                    child: Text(
                      'Lupa kata sandi ?',
                      style: TextStyle(fontSize: 20.scs, color: Colors.grey),
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
                  onTap: () => Navigator.pop(context),
                ),
                CustomDivider(
                  width: 2.scs,
                  height: 50.sch,
                  color: Colors.white,
                ),
                LabelButton(
                  text: 'SIGN IN',
                  color: Colors.white,
                  onTap: () => onSubmitLogin(context, _formKey),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

void showForgotEmailToast(
    BuildContext context, GlobalKey<FormState> _formKey, String text) {
  final scaffold = _scaffoldKey.currentState;

  if (_formKey.currentState.validate()) {
    _formKey.currentState.save();

    Navigator.pop(context, true);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text(
          'You will receive a password reset email if the provided email is already registered',
          textAlign: TextAlign.center,
        ),
        duration: Duration(milliseconds: 500),
      ),
    );
  }
}

class ForgetPasswordDialog extends StatefulWidget {
  @override
  _ForgetPasswordDialogState createState() => _ForgetPasswordDialogState();
}

class _ForgetPasswordDialogState extends State<ForgetPasswordDialog> {
  final _formKey = new GlobalKey<FormState>();
  String _email;
  bool isPasswordVisible;

  @override
  void initState() {
    isPasswordVisible = false;
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
            'Forget Password',
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
                Theme(
                  data: Theme.of(context).copyWith(
                    primaryColor: AppColor.kPrimaryBrand,
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    validator: validateEmail,
                    onSaved: (value) => _email = value,
                    decoration: InputDecoration(
                        labelText: 'Email', icon: Icon(Icons.email)),
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
                    onTap: () =>
                        showForgotEmailToast(context, _formKey, 'text')),
              ],
            ),
          )
        ],
      ),
    );
  }
}
