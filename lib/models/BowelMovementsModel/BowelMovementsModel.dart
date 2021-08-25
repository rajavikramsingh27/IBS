// To parse this JSON data, do
//
//     final bowelMovementsModel = bowelMovementsModelFromJson(jsonString);

import 'dart:convert';

BowelMovementsModel bowelMovementsModelFromJson(String str) => BowelMovementsModel.fromJson(json.decode(str));

String bowelMovementsModelToJson(BowelMovementsModel data) => json.encode(data.toJson());

class BowelMovementsModel {
  BowelMovementsModel({
    this.category = "bowel_movements",
    this.items,
  });

  String category;
  List<Item> items;

  factory BowelMovementsModel.fromJson(Map<String, dynamic> json) => BowelMovementsModel(
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
    this.kind,
    this.dtype,
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
    this.kind,
    this.dtype,
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
    "kind": kind == null ? null : kind,
    "dtype": dtype == null ? null : dtype,
    "value": value == null ? null : value.toJson(),
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
    this.num,
    this.string,
    this.str,
  });

  int num;
  String string;
  String str;

  factory ItemValue.fromJson(Map<String, dynamic> json) => ItemValue(
    num: json["num"] == null ? null : json["num"],
    string: json["string"] == null ? null : json["string"],
    str: json["str"] == null ? null : json["str"],
  );

  Map<String, dynamic> toJson() => {
    "num": num == null ? null : num,
    "string": string == null ? null : string,
    "str": str == null ? null : str,
  };
}
