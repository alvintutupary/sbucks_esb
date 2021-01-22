import 'dart:convert';

StoreModel StoreModelFromJson(String str) =>
    StoreModel.fromJson(json.decode(str));

String StoreModelToJson(StoreModel data) => json.encode(data.toJson());

class StoreModel {
  StoreModel({
    this.nearMeOutletCount,
    this.notNearMeOutletCount,
    this.distance,
    this.distanceText,
    this.outlet,
  });

  int nearMeOutletCount;
  int notNearMeOutletCount;
  dynamic distance;
  dynamic distanceText;
  List<OutletModel> outlet;

  factory StoreModel.fromJson(Map<String, dynamic> json) => StoreModel(
        nearMeOutletCount: json["nearMeOutletCount"],
        notNearMeOutletCount: json["notNearMeOutletCount"],
        distance: json["distance"],
        distanceText: json["distanceText"],
        outlet: List<OutletModel>.from(
            json["outlet"].map((x) => OutletModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "nearMeOutletCount": nearMeOutletCount,
        "notNearMeOutletCount": notNearMeOutletCount,
        "distance": distance,
        "distanceText": distanceText,
        "outlet": List<dynamic>.from(outlet.map((x) => x.toJson())),
      };
}

class OutletModel {
  OutletModel({
    this.branchCode,
    this.branchName,
    this.selfOrderBanner,
    this.latitude,
    this.longitude,
    this.distance,
    this.radius,
    this.distanceText,
    this.flagNearMe,
  });

  String branchCode;
  String branchName;
  String selfOrderBanner;
  double latitude;
  double longitude;
  String distance;
  int radius;
  String distanceText;
  bool flagNearMe;

  factory OutletModel.fromJson(Map<String, dynamic> json) => OutletModel(
        branchCode: json["branchCode"],
        branchName: json["branchName"],
        selfOrderBanner: json["selfOrderBanner"],
        latitude: double.parse(json["latitude"]),
        longitude: double.parse(json["longitude"]),
        distance: json["distance"],
        radius: json["radius"],
        distanceText: json["distanceText"],
        flagNearMe: json["flagNearMe"],
      );

  Map<String, dynamic> toJson() => {
        "branchCode": branchCode,
        "branchName": branchName,
        "selfOrderBanner": selfOrderBanner,
        "latitude": latitude,
        "longitude": longitude,
        "distance": distance,
        "radius": radius,
        "distanceText": distanceText,
        "flagNearMe": flagNearMe,
      };
}
