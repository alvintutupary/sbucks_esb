class User {
  String firstName;
  String lastName;
  String email;
  String phoneNumber;
  bool flagEmailActivation;
  int unreadNotification;

  User({
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.flagEmailActivation,
    this.unreadNotification,
  });

  User.fromJson(Map<String, dynamic> json)
      : firstName = json['firstName'] ?? '',
        lastName = json['lastName'] ?? '',
        email = json['email'] ?? '',
        phoneNumber = json['phoneNumber'] ?? '',
        flagEmailActivation = json['flagEmailActivation'] ?? false,
        unreadNotification =
            int.tryParse(json['unreadNotification'].toString());
}
