// To parse this JSON data, do
//
//     final foodSendModel = foodSendModelFromJson(jsonString);

import 'dart:convert';

import 'package:flutter_ibs/controllers/home/HomeController.dart';
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:get/get.dart';

FoodSendModel foodSendModelFromJson(String str) =>
    FoodSendModel.fromJson(json.decode(str));

String foodSendModelToJson(FoodSendModel data) => json.encode(data.toJson());

class FoodSendModel {
  FoodSendModel({
    this.category = "foods",
    this.items,
    this.trackedAt,
  });

  String category;
  List<TrackableSubmitItem> items;
  DateTime trackedAt;

  factory FoodSendModel.fromJson(Map<String, dynamic> json) => FoodSendModel(
        category: json["category"] == null ? null : json["category"],
        items: json["items"] == null
            ? null
            : List<TrackableSubmitItem>.from(
                json["items"].map((x) => TrackableSubmitItem.fromJson(x))),
        trackedAt: json["trackedAt"] == null ? null : new DateTime(json["trackedAt"]),
      );

  Map<String, dynamic> toJson() {
    HomeController controller = Get.find();
    DateTime now = DateTime.now();
    DateTime trackedAt = new DateTime(controller.selectedDate.year, controller.selectedDate.month, controller.selectedDate.day,
        now.hour, now.minute, now.second);

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
class FoodList {
  FoodList({
    this.tid = "food-meal",
    this.kind = "list",
    this.dtype = "str",
    this.value,
    this.children,
    this.category,
  });

  String tid;
  String kind;
  String dtype;
  FoodValue value;
  List<FoodSubList> children;
  String category;

  factory FoodList.fromJson(Map<String, dynamic> json) => FoodList(
        tid: json["tid"] == null ? null : json["tid"],
        kind: json["kind"] == null ? null : json["kind"],
        dtype: json["dtype"] == null ? null : json["dtype"],
        value: json["value"] == null ? null : FoodValue.fromJson(json["value"]),
        children: json["children"] == null
            ? null
            : List<FoodSubList>.from(
                json["children"].map((x) => FoodSubList.fromJson(x))),
        category: "foods",
  );

  Map<String, dynamic> toJson() => {
        "tid": tid == null ? null : tid,
        "kind": kind == null ? null : kind,
        "dtype": dtype == null ? null : dtype,
        "value": value == null ? null : value.toJson(),
        "children": children == null
            ? null
            : List<dynamic>.from(children.map((x) => x.toJson())),
        "category": "foods",
      };
}

class FoodSubList {
  FoodSubList({
    this.tid,
    this.kind = "tags",
    this.dtype = "arr",
    this.value,
    this.category,
  });

  String tid;
  String kind;
  String dtype;
  FoodSubValue value;
  String category;

  factory FoodSubList.fromJson(Map<String, dynamic> json) => FoodSubList(
        tid: json["tid"] == null ? null : json["tid"],
        kind: json["kind"] == null ? null : json["kind"],
        dtype: json["dtype"] == null ? null : json["dtype"],
        value:
            json["value"] == null ? null : FoodSubValue.fromJson(json["value"]),
        category: "foods",
      );

  Map<String, dynamic> toJson() => {
        "tid": tid == null ? null : tid,
        "kind": kind == null ? null : kind,
        "dtype": dtype == null ? null : dtype,
        "value": value == null ? null : value.toJson(),
        "category": "foods",
      };
}

class FoodSubValue {
  FoodSubValue({
    this.arr,
  });

  List<String> arr;

  factory FoodSubValue.fromJson(Map<String, dynamic> json) => FoodSubValue(
        arr: json["arr"] == null
            ? null
            : List<String>.from(json["arr"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "arr": arr == null ? null : List<dynamic>.from(arr.map((x) => x)),
      };
}

class FoodValue {
  FoodValue({
    this.str,
    this.num,
  });

  String str;
  int num;

  factory FoodValue.fromJson(Map<String, dynamic> json) => FoodValue(
        str: json["str"] == null ? null : json["str"],
        num: json["num"] == null ? null : json["num"],
      );

  Map<String, dynamic> toJson() => {
        "str": str == null ? null : str,
        "num": num == null ? null : num,
      };
}
*/
