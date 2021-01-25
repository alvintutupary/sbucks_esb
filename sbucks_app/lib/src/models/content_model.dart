import 'dart:convert';
import 'package:sbucks/src/utils/constant.dart';

ContentsModel ContentsModelFromJson(String str) =>
    ContentsModel.fromJson(json.decode(str));

String ContentsModelToJson(ContentsModel data) => json.encode(data.toJson());

class ContentsModel {
  List<List<ContentModel>> content;

  ContentsModel({
    this.content,
  });

  factory ContentsModel.fromJson(Map<String, dynamic> json) => ContentsModel(
        content: List<List<ContentModel>>.from(json["content"].map((x) =>
            List<ContentModel>.from(x.map((x) => ContentModel.fromJson(x))))),
      );

  Map<String, dynamic> toJson() => {
        "content": List<dynamic>.from(
            content.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
      };
}

class ContentModel {
  ContentModel({
    this.contentId,
    this.contentTypeId,
    this.titleId,
    this.titleEn,
    this.summaryId,
    this.summaryEn,
    this.descriptionId,
    this.descriptionEn,
    this.images,
  });

  int contentId;
  int contentTypeId;
  String titleId;
  String titleEn;
  String summaryId;
  String summaryEn;
  String descriptionId;
  String descriptionEn;
  List<ImageModel> images;

  factory ContentModel.fromJson(Map<String, dynamic> json) => ContentModel(
        contentId: json["contentID"],
        contentTypeId: json["contentTypeID"],
        titleId: json["titleId"],
        titleEn: json["titleEn"],
        summaryId: json["summaryId"],
        summaryEn: json["summaryEn"],
        descriptionId: json["descriptionId"],
        descriptionEn: json["descriptionEn"],
        images: List<ImageModel>.from(
            json["images"].map((x) => ImageModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "contentID": contentId,
        "contentTypeID": contentTypeId,
        "titleId": titleId,
        "titleEn": titleEn,
        "summaryId": summaryId,
        "summaryEn": summaryEn,
        "descriptionId": descriptionId,
        "descriptionEn": descriptionEn,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
      };
}

class ImageModel {
  ImageModel({
    this.imageUrl,
  });

  String imageUrl;

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        imageUrl: '${AppConstant.kHttpBaseUrl}/${json["imageUrl"]}',
      );

  Map<String, dynamic> toJson() => {
        "imageUrl": imageUrl,
      };
}
