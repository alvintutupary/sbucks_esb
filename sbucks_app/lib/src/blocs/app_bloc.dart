import 'package:shared_preferences/shared_preferences.dart';
import 'package:sbucks/src/utils/constant.dart';

class AppBloc {
  Future<bool> isFirstRun() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(AppConstant.kPreferenceIsFirstRun) ?? true;
  }

  void finishFirstRun() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(AppConstant.kPreferenceIsFirstRun, false);
  }

  Future<String> getPin() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(AppConstant.kPreferenceUserPin) ?? '';
  }

  void setPin(String pin) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(AppConstant.kPreferenceUserPin, pin);
  }

  Future<void> clearPin() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(AppConstant.kPreferenceUserPin);
  }

  Future<String> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(AppConstant.kPreferenceUserToken) ?? '';
  }

  void setToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(AppConstant.kPreferenceUserToken, token);
  }

  Future<void> clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(AppConstant.kPreferenceUserToken);
  }
}

AppBloc appBloc = AppBloc();
