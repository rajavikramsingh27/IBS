// To parse this JSON data, do
//
//     final symptomsModel = symptomsModelFromJson(jsonString);

import 'dart:convert';

SymptomsModel symptomsModelFromJson(String str) => SymptomsModel.fromJson(json.decode(str));

String symptomsModelToJson(SymptomsModel data) => json.encode(data.toJson());

class SymptomsModel {
  SymptomsModel({
    this.category = "symptoms",
    this.items,
  });

  String category;
  List<Item> items;

  factory SymptomsModel.fromJson(Map<String, dynamic> json) => SymptomsModel(
    category: json["category"] == null ? null : json["category"],
    items: json["items"] == null ? null : List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "category": category == null ? null : category,
    "items": items == null ? null : List<dynamic>.from(items.map((x) => x.toJson())),
  };
}

class Item {
  Item({
    this.tid,
    this.kind = "rating",
    this.dtype = "num",
    this.value,
    this.children,
  });

  String tid;
  String kind;
  String dtype;
  ItemValue value;
  List<Child> children;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    tid: json["tid"] == null ? null : json["tid"],
    kind: json["kind"] == null ? null : json["kind"],
    dtype: json["dtype"] == null ? null : json["dtype"],
    value: json["value"] == null ? null : ItemValue.fromJson(json["value"]),
    children: json["children"] == null ? null : List<Child>.from(json["children"].map((x) => Child.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "tid": tid == null ? null : tid,
    "kind": kind == null ? null : kind,
    "dtype": dtype == null ? null : dtype,
    "value": value == null ? null : value.toJson(),
    "children": children == null ? null : List<dynamic>.from(children.map((x) => x.toJson())),
  };
}

class Child {
  Child({
    this.tid,
    this.kind = "list",
    this.dtype = "arr",
    this.value,
  });

  String tid;
  String kind;
  String dtype;
  ChildValue value;

  factory Child.fromJson(Map<String, dynamic> json) => Child(
    tid: json["tid"] == null ? null : json["tid"],
    kind: json["kind"] == null ? null : json["kind"],
    dtype: json["dtype"] == null ? null : json["dtype"],
    value: json["value"] == null ? null : ChildValue.fromJson(json["value"]),
  );

  Map<String, dynamic> toJson() => {
    "tid": tid == null ? null : tid,
    "kind": kind == null ? null: kind,
    "dtype": dtype == null ? null : dtype,
    "value": value == null ? null : value.toJson(),
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
