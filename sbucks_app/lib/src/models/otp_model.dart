class GenerateOtpResult {
  int status;
  String email;
  String accessToken;
  bool createdDate;
  GenerateOtpResult({
    this.status,
    this.email,
    this.accessToken,
    this.createdDate,
  });
  factory GenerateOtpResult.fromJson(Map<String, dynamic> json) =>
      GenerateOtpResult(
        status: json["status"],
        email: json["email"],
        accessToken: json["accessToken"],
        createdDate: json["createdDate"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "email": email,
        "accessToken": accessToken,
        "createdDate": createdDate,
      };
}
