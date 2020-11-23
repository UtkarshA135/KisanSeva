import 'dart:convert';

class FeedModel {
  FeedModel({
    this.headline,
    this.date,
    this.img,
  });

  String headline;
  String date;
  String img;

  factory FeedModel.fromRawJson(String str) =>
      FeedModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FeedModel.fromJson(Map<String, dynamic> json) => FeedModel(
        headline: json["headline"],
        date: json["date"],
        img: json["img"],
      );

  Map<String, dynamic> toJson() => {
        "headline": headline,
        "date": date,
        "img": img,
      };
}
