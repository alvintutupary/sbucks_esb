class ContentTypeModel {
  int contentTypeId;
  String contentTypeName;

  ContentTypeModel({
    this.contentTypeId,
    this.contentTypeName,
  });

  factory ContentTypeModel.fromJson(Map<String, dynamic> json) =>
      ContentTypeModel(
        contentTypeId: json["contentTypeID"],
        contentTypeName: json["contentTypeName"],
      );

  Map<String, dynamic> toJson() => {
        "contentTypeID": contentTypeId,
        "contentTypeName": contentTypeName,
      };
}
