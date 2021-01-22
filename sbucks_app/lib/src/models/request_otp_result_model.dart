class RequestOtpResult {
  int status;
  String email;
  String accessToken;
  String createdDate;

  RequestOtpResult.fromJson(Map<String, dynamic> json)
      : status = json['status'] ?? 0,
        email = json['email'] ?? '',
        accessToken = json['accessToken'] ?? '',
        createdDate = json['createdDate'] ?? '';
}
