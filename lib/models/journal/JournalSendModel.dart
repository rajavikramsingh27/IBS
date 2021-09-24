// To parse this JSON data, do
//
//     final journalSendModel = journalSendModelFromJson(jsonString);

import 'dart:convert';

import 'package:flutter_ibs/controllers/home/HomeController.dart';
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:get/get.dart';

JournalSendModel journalSendModelFromJson(String str) =>
    JournalSendModel.fromJson(json.decode(str));

String journalSendModelToJson(JournalSendModel data) =>
    json.encode(data.toJson());

class JournalSendModel {
  JournalSendModel({
    this.category = "journal",
    this.items,
    this.trackedAt,
  });

  String category;
  List<TrackableSubmitItem> items;
  DateTime trackedAt;

  factory JournalSendModel.fromJson(Map<String, dynamic> json) =>
      JournalSendModel(
        category: json["category"] == null ? null : json["category"],
        items: json["items"] == null
            ? null
            : List<TrackableSubmitItem>.from(
                json["items"].map((x) => TrackableSubmitItem.fromJson(x))),
        trackedAt:
            json["trackedAt"] == null ? null : new DateTime(json["trackedAt"]),
      );

  Map<String, dynamic> toJson() {
    HomeController controller = Get.find();
    DateTime now = DateTime.now();
    DateTime trackedAt = new DateTime(
        controller.selectedDate.year,
        controller.selectedDate.month,
        controller.selectedDate.day,
        now.hour,
        now.minute,
        now.second);

    Map<String, dynamic> json = {
      "category": category == null ? null : category,
      "items": items == null
          ? null
          : List<dynamic>.from(items.map((x) => x.toJson())),
      "trackedAt": trackedAt.toUtc().toString(),
    };
    return json;
  }
}

/*
class Item {
  Item({
    this.tid = "journal-entry",
    this.kind = "textInput",
    this.dtype = "str",
    this.value,
    this.category,
  });

  String tid;
  String kind;
  String dtype;
  Value value;
  String category;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        tid: json["tid"] == null ? null : json["tid"],
        kind: json["kind"] == null ? null : json["kind"],
        dtype: json["dtype"] == null ? null : json["dtype"],
        value: json["value"] == null ? null : Value.fromJson(json["value"]),
        category: "journal",
      );

  Map<String, dynamic> toJson() => {
        "tid": tid == null ? null : tid,
        "kind": kind == null ? null : kind,
        "dtype": dtype == null ? null : dtype,
        "value": value == null ? null : value.toJson(),
        "category": "journal",
      };
}

class Value {
  Value({
    this.str,
  });

  String str;

  factory Value.fromJson(Map<String, dynamic> json) => Value(
        str: json["str"] == null ? null : json["str"],
      );

  Map<String, dynamic> toJson() => {
        "str": str == null ? null : str,
      };
}
*/
