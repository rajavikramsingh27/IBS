// To parse this JSON data, do
//
//     final bowelMovementsModel = bowelMovementsModelFromJson(jsonString);

import 'dart:convert';

import 'package:flutter_ibs/controllers/home/HomeController.dart';
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:get/get.dart';

BowelMovementsModel bowelMovementsModelFromJson(String str) =>
    BowelMovementsModel.fromJson(json.decode(str));

String bowelMovementsModelToJson(BowelMovementsModel data) =>
    json.encode(data.toJson());

class BowelMovementsModel {
  BowelMovementsModel({
    this.category = "bowelMovements",
    this.items,
    this.trackedAt,
  });

  String category;
  List<TrackableSubmitItem> items;
  DateTime trackedAt;

  factory BowelMovementsModel.fromJson(Map<String, dynamic> json) =>
      BowelMovementsModel(
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
    category: "bowelMovements",
  );

  Map<String, dynamic> toJson() => {
    "tid": tid == null ? null : tid,
    "kind": kind == null ? null : kind,
    "dtype": dtype == null ? null : dtype,
    "value": value == null ? null : value.toJson(),
    "children": children == null ? null : List<dynamic>.from(children.map((x) => x.toJson())),
    "category": "bowelMovements",
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
    category: "bowelMovements",
  );

  Map<String, dynamic> toJson() => {
    "tid": tid == null ? null : tid,
    "kind": kind == null ? null : kind,
    "dtype": dtype == null ? null : dtype,
    "value": value == null ? null : value.toJson(),
    "category": "bowelMovements",
  };
}

class ChildValue {
  ChildValue({
    this.valueBool,
  });

  bool valueBool;

  factory ChildValue.fromJson(Map<String, dynamic> json) => ChildValue(
    valueBool: json["bool"] == null ? null : json["bool"],
  );

  Map<String, dynamic> toJson() => {
    "bool": valueBool == null ? null : valueBool,
  };
}

class ItemValue {
  ItemValue({
    this.itemNum = 0,
    this.string = "",
    this.str = "",
  });

  num itemNum;
  String string;
  String str;

  factory ItemValue.fromJson(Map<String, dynamic> json) => ItemValue(
    itemNum: json["num"] == null ? null : json["num"],
    string: json["string"] == null ? null : json["string"],
    str: json["str"] == null ? null : json["str"],
  );

  Map<String, dynamic> toJson() => {
    "num": itemNum == null ? null : itemNum,
    "string": string == null ? null : string,
    "str": str == null ? null : str,
  };
}
*/
