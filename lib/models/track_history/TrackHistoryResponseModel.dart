// To parse this JSON data, do
//
//     final trackHistoryResponseModel = trackHistoryResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:flutter_ibs/services/url.dart';

class TrackHistoryResponseModelList {
  TrackHistoryResponseModelList({this.trackHistoryList});

  List<TrackHistoryResponseModel> trackHistoryList;

  factory TrackHistoryResponseModelList.fromJson(json) {
    List<TrackHistoryResponseModel> abcx;

    abcx = (json as List)
        .map((i) => TrackHistoryResponseModel.fromJson(i))
        .toList();
    return TrackHistoryResponseModelList(
      trackHistoryList: abcx,
    );
  }
}

class TrackHistoryResponseModel {
  TrackHistoryResponseModel({
    this.id,
    this.createdAt,
    this.trackedAt,
    this.category,
    this.title,
    this.image,
    this.items,
  });

  String id;
  DateTime createdAt;
  DateTime trackedAt;
  String category;
  String title;
  Image image;
  List<TrackableSubmitItem> items;

  factory TrackHistoryResponseModel.fromRawJson(String str) =>
      TrackHistoryResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TrackHistoryResponseModel.fromJson(Map<String, dynamic> json) =>
      TrackHistoryResponseModel(
        id: json["_id"] == null ? null : json["_id"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
          trackedAt: json["trackedAt"] == null
              ? null
              : DateTime.parse(json["trackedAt"]),
        category: json["category"] == null ? null : json["category"],
        title: json["title"] == null ? null : json["title"],
        image: json["image"] == null ? null : Image.fromJson(json["image"]),
        items: json["items"] == null
            ? []
            : List<TrackableSubmitItem>.from(
                json["items"].map((x) => TrackableSubmitItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "category": category == null ? null : category,
        "title": title == null ? null : title,
        "image": image == null ? null : image.toJson(),
      };
}

class Image {
  Image({
    this.normal,
  });

  String normal;

  factory Image.fromRawJson(String str) => Image.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        normal: json["normal"] == null ? null : "$BASE_URL${json["normal"]}",
      );

  Map<String, dynamic> toJson() => {
        "normal": normal == null ? null : normal,
      };
}
