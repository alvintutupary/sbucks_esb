import 'dart:convert';

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
  String imageUri;

  MenuCategoryModel(
      {this.menuCategoryId,
      this.menuCategoryDesc,
      this.description,
      this.menuCategoryDetails,
      this.imageUri});

  factory MenuCategoryModel.fromJson(Map<String, dynamic> json) =>
      MenuCategoryModel(
        menuCategoryId: json["menuCategoryID"],
        menuCategoryDesc: json["menuCategoryDesc"],
        description: json["description"] == null ? null : json["description"],
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
      this.imageUri});

  String menuCategoryDetailDesc;
  String description;
  List<MenuModel> menus;
  String imageUri;

  factory MenuCategoryDetailModel.fromJson(Map<String, dynamic> json) =>
      MenuCategoryDetailModel(
        menuCategoryDetailDesc: json["menuCategoryDetailDesc"],
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
  String imageUri;

  MenuModel(
      {this.menuId,
      this.menuName,
      this.menuShortName,
      this.description,
      this.orderId,
      this.imageUri});

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
