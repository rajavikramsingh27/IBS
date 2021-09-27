// To parse this JSON data, do
//
//     final healthWellnessModel = healthWellnessModelFromJson(jsonString);

import 'dart:convert';

import 'package:flutter_ibs/controllers/home/HomeController.dart';
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:get/get.dart';

HealthWellnessModel healthWellnessModelFromJson(String str) =>
    HealthWellnessModel.fromJson(json.decode(str));

String healthWellnessModelToJson(HealthWellnessModel data) =>
    json.encode(data.toJson());

class HealthWellnessModel {
  HealthWellnessModel({
    this.id,
    this.category = "healthWellness",
    this.items,
    this.trackedAt,
  });

  String id;
  String category;
  List<TrackableSubmitItem> items = [];
  DateTime trackedAt;

  factory HealthWellnessModel.fromJson(Map<String, dynamic> json) =>
      HealthWellnessModel(
        id: json["_id"] == null ? null : json["_id"],
        category: json["category"] == null ? null : json["category"],
        items: json["items"] == null
            ? null
            : List<TrackableSubmitItem>.from(
                json["items"].map((x) => TrackableSubmitItem.fromJson(x))),
        trackedAt:
            json["trackedAt"] == null ? null : new DateTime(json["trackedAt"]),
      );

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {
      "_id": id == null ? null : id,
      "category": category == null ? null : category,
      "items": items == null
          ? null
          : List<dynamic>.from(items.map((x) => x.toJson())),
      "trackedAt": trackedAt.toUtc().toString(),
    };
    return json;
  }
}
