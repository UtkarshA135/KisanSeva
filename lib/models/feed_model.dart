import 'dart:convert';

class FeedModel {
  FeedModel({
    this.headline,
    this.date,
    this.img,
    this.url,
  });

  String headline;
  String date;
  String img;
  String url;

  factory FeedModel.fromRawJson(String str) =>
      FeedModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FeedModel.fromJson(Map<String, dynamic> json) => FeedModel(
      headline: json["headline"],
      date: json["date"],
      img: json["img"],
      url: json["url"]);

  Map<String, dynamic> toJson() => {
        "headline": headline,
        "date": date,
        "img": img,
        "url": url,
      };
}
