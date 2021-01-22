import 'package:sbucks/src/repositories/api_client.dart';
import 'package:sbucks/src/models/login_model.dart';
import 'package:sbucks/src/models/request_otp_result_model.dart';
import 'package:sbucks/src/utils/constant.dart';

class UserRepository {
  final _apiClient = ApiClient();

  Future<dynamic> login(String email, String password) async {
    LoginRequest loginRequest = LoginRequest(email: email, password: password);
    final response = await _apiClient.postBasic(AppConstant.kLogin,
        body: loginRequest.toJson());
    final result = LoginResult.fromJson(response);
    return result;
  }

  Future<RequestOtpResult> requestOtp(String email) async {
    final response = await _apiClient
        .postBasic(AppConstant.kRequestOtp, body: {'email': email});
    final result = RequestOtpResult.fromJson(response);
    return result;
  }

  Future<RequestOtpResult> validateOtp(String otp, String accessToken) async {
    final response =
        await _apiClient.postBasic(AppConstant.kValidateOtp, body: {
      'otp': otp,
      'accessToken': accessToken,
    });
    return RequestOtpResult.fromJson(response);
  }
}
