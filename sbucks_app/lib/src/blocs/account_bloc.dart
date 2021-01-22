import 'package:sbucks/src/models/api_response_model.dart';
import 'package:sbucks/src/repositories/user_repository.dart';
import 'package:sbucks/src/models/login_model.dart';
import 'package:sbucks/src/models/request_otp_result_model.dart';

class AccountBloc {
  final _userRepository = UserRepository();

  Future<ApiResponse<dynamic>> login(String email, String password) async {
    try {
      LoginResult result = await _userRepository.login(email, password);

      if (result != null && result.status == 200 && result.isValid) {
        return ApiResponse.complete(result.isValid);
      } else {
        return ApiResponse.error('TRY_AGAIN_LATER');
      }
    } catch (e) {
      print('Error: ${e.toString()}');
      return ApiResponse.error(e.toString());
    }
  }

  Future<ApiResponse<RequestOtpResult>> requestOtp(String email) async {
    try {
      final result = await _userRepository.requestOtp(email);
      if (result != null && result.status == 200) {
        return ApiResponse.complete(result);
      } else {
        return ApiResponse.error('TRY_AGAIN_LATER');
      }
    } catch (e) {
      print('Error: ${e.toString()}');
      return ApiResponse.error(e.toString());
    }
  }

  Future<ApiResponse<bool>> validateOtp(
    String otp,
    String accessToken,
  ) async {
    try {
      final result = await _userRepository.validateOtp(otp, accessToken);
      if (result != null && result.status == 200) {
        return ApiResponse.complete(true);
      } else {
        return ApiResponse.error('INVALID_OTP');
      }
    } catch (e) {
      print('Error: ${e.toString()}');
      return ApiResponse.error(e.toString());
    }
  }
}
