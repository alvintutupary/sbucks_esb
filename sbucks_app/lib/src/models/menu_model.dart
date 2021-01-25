import 'dart:convert';
import 'package:sbucks/src/utils/constant.dart';

MenusModel MenusModelFromJson(String str) =>
    MenusModel.fromJson(json.decode(str));

String MenusModelToJson(MenusModel data) => json.encode(data.toJson());

class MenusModel {
  MenusModel({
    this.menuCategory,
  });

  List<MenuCategoryModel> menuCategory;

  factory MenusModel.fromJson(Map<String, dynamic> json) => MenusModel(
        menuCategory: List<MenuCategoryModel>.from(
            json["menuCategory"].map((x) => MenuCategoryModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "menuCategory": List<dynamic>.from(menuCategory.map((x) => x.toJson())),
      };
}

class MenuCategoryModel {
  int menuCategoryId;
  String menuCategoryDesc;
  String description;
  List<MenuCategoryDetailModel> menuCategoryDetails;
  String imageUrl;

  MenuCategoryModel(
      {this.menuCategoryId,
      this.menuCategoryDesc,
      this.description,
      this.menuCategoryDetails,
      this.imageUrl});

  factory MenuCategoryModel.fromJson(Map<String, dynamic> json) =>
      MenuCategoryModel(
        menuCategoryId: json["menuCategoryID"],
        menuCategoryDesc: json["menuCategoryDesc"],
        imageUrl: json["imageUrl"] != "" || json["imageUrl"] != null
            ? json["imageUrl"]
            : "",
        description: json["description"] ?? '',
        menuCategoryDetails: List<MenuCategoryDetailModel>.from(
            json["menuCategoryDetails"]
                .map((x) => MenuCategoryDetailModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "menuCategoryID": menuCategoryId,
        "menuCategoryDesc": menuCategoryDesc,
        "description": description == null ? null : description,
        "menuCategoryDetails":
            List<dynamic>.from(menuCategoryDetails.map((x) => x.toJson())),
      };
}

class MenuCategoryDetailModel {
  MenuCategoryDetailModel(
      {this.menuCategoryDetailDesc,
      this.description,
      this.menus,
      this.imageUrl});

  String menuCategoryDetailDesc;
  String description;
  List<MenuModel> menus;
  String imageUrl;

  factory MenuCategoryDetailModel.fromJson(Map<String, dynamic> json) =>
      MenuCategoryDetailModel(
        menuCategoryDetailDesc: json["menuCategoryDetailDesc"],
        imageUrl: json["imageUrl"] != "" || json["imageUrl"] != null
            ? json["imageUrl"]
            : "",
        description: json["description"] == null ? null : json["description"],
        menus: List<MenuModel>.from(
            json["menus"].map((x) => MenuModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "menuCategoryDetailDesc": menuCategoryDetailDesc,
        "description": description == null ? null : description,
        "menus": List<dynamic>.from(menus.map((x) => x.toJson())),
      };
}

class MenuModel {
  int menuId;
  String menuName;
  String menuShortName;
  String description;
  int orderId;
  String imageUrl;

  MenuModel(
      {this.menuId,
      this.menuName,
      this.menuShortName,
      this.description,
      this.orderId,
      this.imageUrl});

  factory MenuModel.fromJson(Map<String, dynamic> json) => MenuModel(
        menuId: json["menuID"],
        menuName: json["menuName"],
        menuShortName: json["menuShortName"],
        description: json["description"],
        orderId: json["orderID"] == null ? null : json["orderID"],
      );

  Map<String, dynamic> toJson() => {
        "menuID": menuId,
        "menuName": menuName,
        "menuShortName": menuShortName,
        "description": description,
        "orderID": orderId == null ? null : orderId,
      };
}
