import 'dart:convert';

class CropModel {
  CropModel({
    this.cropImage,
    this.cropName,
    this.cropDescription,
    this.msp,
    this.allBid,
    this.higestBid,
    this.ownerContactInfo,
    this.cropQuantity,
  });

  String cropImage;
  String cropName;
  String cropDescription;
  String msp;
  List<dynamic> allBid;
  String higestBid;
  String ownerContactInfo;
  String cropQuantity;

  factory CropModel.fromRawJson(String str) =>
      CropModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CropModel.fromJson(Map<String, dynamic> json) => CropModel(
        cropImage: json["cropImage"],
        cropName: json["cropName"],
        cropDescription: json["cropDescription"],
        msp: json["msp"],
        // allBid: List<dynamic>.from(json["allBid"].map((x) => x)),
        higestBid: json["HigestBid"],
        ownerContactInfo: json["ownerContactInfo"],
        cropQuantity: json["cropQuantity"],
      );

  Map<String, dynamic> toJson() => {
        "cropImage": cropImage,
        "cropName": cropName,
        "cropDescription": cropDescription,
        "msp": msp,
        // "allBid": List<dynamic>.from(allBid.map((x) => x)),
        "cropQuantity": cropQuantity,
        "HigestBid": higestBid,
        "ownerContactInfo": ownerContactInfo,
      };
}
