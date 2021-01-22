import 'package:dio/dio.dart';
import 'package:sbucks/src/models/api_exception.model.dart';
import 'package:sbucks/src/utils/constant.dart';
import 'package:sbucks/src/utils/utilities.dart';

class ApiClient {
  static final ApiClient _instance = ApiClient._internal();
  Dio _dio = Dio();

  ApiClient._internal();

  factory ApiClient() {
    return _instance;
  }

  Future<dynamic> postBasic(
    String url, {
    String baseUrl = AppConstant.kHttpBaseUrl,
    Map<String, dynamic> header,
    dynamic body,
  }) async {
    _dio.options.headers['X-Signature'] =
        Utilities().generateSignature('POST', url, body: body) ?? {};
    try {
      final response = await _dio.post(
        '$baseUrl$url',
        data: body,
      );
      return response.data;
    } on DioError catch (e) {
      return _errorHandler(e);
    }
  }

  Future<dynamic> getBasic(
    String url, {
    String baseUrl = AppConstant.kHttpBaseUrl,
    String accessToken,
    Map<String, dynamic> header,
    Map<String, dynamic> queryParams,
  }) async {
    _dio.options.headers['X-Signature'] =
        Utilities().generateSignature('GET', url) ?? {};
    _dio.options.headers['Authorization'] = 'Bearer ${accessToken ?? ""}';

    try {
      final response = await _dio.get(
        '$baseUrl$url',
        queryParameters: queryParams,
      );

      return response.data;
    } on DioError catch (e) {
      return _errorHandler(e);
    }
  }

  dynamic _errorHandler(DioError error) {
    switch (error.type) {
      case DioErrorType.CONNECT_TIMEOUT:
      case DioErrorType.RECEIVE_TIMEOUT:
        throw UserRequestException(
            'Connection Timeout: Server might be overloaded, please try again');
        break;

      case DioErrorType.DEFAULT:
        throw UserRequestException(
            'Connection Error: Please verify your internet connection and try again');
        break;
      default:
    }

    final errorData = error.response.data;
    switch (error.response.statusCode) {
      case 400:
        throw UserRequestException(errorData['message']);
      case 401:
        throw error.response.statusCode;
      case 403:
        throw SystemException('Forbiden: ${errorData['message']}');
      case 500:
      default:
        throw SystemException(
            'Error During Communication with Server: ${error.response.statusCode} - ${error.response.data}');
    }
  }
}
