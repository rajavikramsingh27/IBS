// To parse this JSON data, do
//
//     final symptomsModel = symptomsModelFromJson(jsonString);

/*
  IAN: All the items being submitted to the API should include the category.
  Since this controller is dedicated to Symptoms, easiest thing for me to do
  was hard-code "category": "symptoms".
 */
import 'dart:convert';

import 'package:flutter_ibs/controllers/home/HomeController.dart';
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:get/get.dart';

SymptomsModel symptomsModelFromJson(String str) =>
    SymptomsModel.fromJson(json.decode(str));

String symptomsModelToJson(SymptomsModel data) => json.encode(data.toJson());

class SymptomsModel {
  SymptomsModel({
    this.id,
    this.category = "symptoms",
    this.items,
    this.trackedAt,
  });

  String id;
  String category;
  List<TrackableSubmitItem> items;
  DateTime trackedAt;

  factory SymptomsModel.fromJson(Map<String, dynamic> json) => SymptomsModel(
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
    /*
    HomeController controller = Get.find();
    DateTime now = DateTime.now();
    DateTime trackedAt = new DateTime(
        controller.selectedDate.year,
        controller.selectedDate.month,
        controller.selectedDate.day,
        now.hour,
        now.minute,
        now.second);
*/
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
