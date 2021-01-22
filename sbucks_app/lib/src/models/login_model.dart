class LoginResult {
  int status;
  String message;
  String email;
  bool isValid;
  LoginResult({
    this.status,
    this.message,
    this.email,
    this.isValid,
  });
  factory LoginResult.fromJson(Map<String, dynamic> json) => LoginResult(
        status: json["status"],
        message: json["message"],
        email: json["email"],
        isValid: json["isValid"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "email": email,
        "isValid": isValid,
      };
}

class LoginRequest {
  String email;
  String password;
  LoginRequest({
    this.email,
    this.password,
  });
  factory LoginRequest.fromJson(Map<String, dynamic> json) => LoginRequest(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {"email": email, "password": password};
}
