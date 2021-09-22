// To parse this JSON data, do
//
//     final symptomsModel = symptomsModelFromJson(jsonString);

/*
  IAN: All the items being submitted to the API should include the category.
  Since this controller is dedicated to Symptoms, easiest thing for me to do
  was hard-code "category": "symptoms".
 */
import 'dart:convert';

import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';

SymptomsModel symptomsModelFromJson(String str) => SymptomsModel.fromJson(json.decode(str));

String symptomsModelToJson(SymptomsModel data) => json.encode(data.toJson());

class SymptomsModel {
  SymptomsModel({
    this.category = "symptoms",
    this.items,
    this.trackedAt,
  });

  String category;
  List<TrackableSubmitItem> items;
  DateTime trackedAt;

  factory SymptomsModel.fromJson(Map<String, dynamic> json) => SymptomsModel(
    category: json["category"] == null ? null : json["category"],
    items: json["items"] == null ? null : List<TrackableSubmitItem>.from(json["items"].map((x) => TrackableSubmitItem.fromJson(x))),
    trackedAt:  json["trackedAt"] == null ? null : new DateTime(json["trackedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "category": category == null ? null : category,
    "items": items == null ? null : List<dynamic>.from(items.map((x) => x.toJson())),
    "trackedAt": trackedAt == null ? new DateTime.now() : trackedAt,
  };
}
/*
class Item {
  Item({
    this.tid,
    this.kind = "rating",
    this.dtype = "num",
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
    category: "symptoms" //json["category"] == null ? null : json["category"],
  );

  Map<String, dynamic> toJson() => {
    "tid": tid == null ? null : tid,
    "kind": kind == null ? null : kind,
    "dtype": dtype == null ? null : dtype,
    "value": value == null ? null : value.toJson(),
    "children": children == null ? null : List<dynamic>.from(children.map((x) => x.toJson())),
    "category": "symptoms",
  };
}

class Child {
  Child({
    this.tid,
    this.kind = "list",
    this.dtype = "arr",
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
    category: "symptoms",
  );

  Map<String, dynamic> toJson() => {
    "tid": tid == null ? null : tid,
    "kind": kind == null ? null: kind,
    "dtype": dtype == null ? null : dtype,
    "value": value == null ? null : value.toJson(),
    "category": "symptoms",
  };
}

class ChildValue {
  ChildValue({
    this.arr,
    this.str,
  });

  List<String> arr;
  String str;

  factory ChildValue.fromJson(Map<String, dynamic> json) => ChildValue(
    arr: json["arr"] == null ? null : List<String>.from(json["arr"].map((x) => x)),
    str: json["str"] == null ? null : json["str"],
  );

  Map<String, dynamic> toJson() => {
    "arr": arr == null ? null : List<dynamic>.from(arr.map((x) => x)),
    "str": str == null ? null : str,
  };
}

class ItemValue {
  ItemValue({
    this.numValue,
    this.str,
  });

  num numValue;
  String str;

  factory ItemValue.fromJson(Map<String, dynamic> json) => ItemValue(
    numValue: json["num"] == null ? null : json["num"],
    str: json["str"] == null ? null : json["str"],
  );

  Map<String, dynamic> toJson() => {
    "num": numValue == null ? null : numValue,
    "str": str == null ? null : str,
  };
}

*/
