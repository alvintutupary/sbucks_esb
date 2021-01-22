class ApiException implements Exception {
  final _message;

  ApiException(this._message);

  @override
  String toString() {
    return _message;
  }
}

class UserRequestException extends ApiException {
  UserRequestException(message) : super(message);
}

class SystemException extends ApiException {
  SystemException(message) : super(message);
}
