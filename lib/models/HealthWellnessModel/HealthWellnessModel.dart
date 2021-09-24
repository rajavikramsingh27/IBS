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
    this.category = "healthWellness",
    this.items,
    this.trackedAt,
  });

  String category;
  List<TrackableSubmitItem> items = [];
  DateTime trackedAt;

  factory HealthWellnessModel.fromJson(Map<String, dynamic> json) =>
      HealthWellnessModel(
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
    this.tid,
    this.kind,
    this.dtype,
    this.value,
    this.children,
    this.category,
  });

  String tid;
  String kind;
  String dtype;
  ItemValue value;
  List<Child> children;
  String category;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    tid: json["tid"] == null ? null : json["tid"],
    kind: json["kind"] == null ? null : json["kind"],
    dtype: json["dtype"] == null ? null : json["dtype"],
    value: json["value"] == null ? null : ItemValue.fromJson(json["value"]),
    children: json["children"] == null ? null : List<Child>.from(json["children"].map((x) => Child.fromJson(x))),
    category: "healthWellness",
  );

  Map<String, dynamic> toJson() => {
    "tid": tid == null ? null : tid,
    "kind": kind == null ? null : kind,
    "dtype": dtype == null ? null : dtype,
    "value": value == null ? null : value.toJson(),
    "children": children == null ? null : List<dynamic>.from(children.map((x) => x.toJson())),
    "category": "healthWellness",
  };
}

class Child {
  Child({
    this.tid,
    this.kind,
    this.dtype,
    this.value,
    this.category,
  });

  String tid;
  String kind;
  String dtype;
  ChildValue value;
  String category;

  factory Child.fromJson(Map<String, dynamic> json) => Child(
    tid: json["tid"] == null ? null : json["tid"],
    kind: json["kind"] == null ? null : json["kind"],
    dtype: json["dtype"] == null ? null : json["dtype"],
    value: json["value"] == null ? null : ChildValue.fromJson(json["value"]),
    category: "healthWellness",
  );

  Map<String, dynamic> toJson() => {
    "tid": tid == null ? null : tid,
    "kind": kind == null ? null : kind,
    "dtype": dtype == null ? null : dtype,
    "value": value == null ? null : value.toJson(),
    "category": "healthWellness",
  };
}

class ChildValue {
  ChildValue({
    this.num,
  });

  int num;

  factory ChildValue.fromJson(Map<String, dynamic> json) => ChildValue(
    num: json["num"] == null ? null : json["num"],
  );

  Map<String, dynamic> toJson() => {
    "num": num == null ? null : num,
  };
}

class ItemValue {
  ItemValue({
    this.numValue,
    this.arr,
    this.str,
  });

  num numValue;
  String str;
  List<String> arr;

  factory ItemValue.fromJson(Map<String, dynamic> json) => ItemValue(
    numValue: json["num"] == null ? null : json["num"],
    arr: json["arr"] == null ? null : List<String>.from(json["arr"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "num": numValue == null ? null : numValue,
    "str": str == null ? null : str,
    "arr": arr == null ? null : List<dynamic>.from(arr.map((x) => x)),
  };


}

 */
