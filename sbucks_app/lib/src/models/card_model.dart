class CardModel {
  String name;
  String number;
  bool isDefault;
  String imageUri;
  bool isActive;
  double balance;
  String createdAt;

  CardModel(
    this.name,
    this.number,
    this.isDefault,
    this.imageUri,
    this.isActive,
    this.balance,
    this.createdAt,
  );

  CardModel.fromJson(Map<String, dynamic> json)
      : name = json['name'] ?? '',
        number = json['number'] ?? '',
        isDefault = json['isDefault'] ?? '',
        imageUri = json['imageUri'] ?? '',
        isActive = json['isActive'] ?? false,
        balance = json['balance'] ?? 0,
        createdAt = json['createdAt'] ?? '';
}
