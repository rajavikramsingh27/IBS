// To parse this JSON data, do
//
//     final foodSendModel = foodSendModelFromJson(jsonString);

import 'dart:convert';

class FoodSendModel {
  FoodSendModel({
    this.category,
    this.items,
  });

  String category;
  List<FoodIItemModel> items;

  factory FoodSendModel.fromRawJson(String str) =>
      FoodSendModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FoodSendModel.fromJson(Map<String, dynamic> json) => FoodSendModel(
        category: json["category"] == null ? null : json["category"],
        items: json["items"] == null
            ? null
            : List<FoodIItemModel>.from(
                json["items"].map((x) => FoodIItemModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "category": category == null ? null : category,
        "items": items == null
            ? null
            : List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class FoodIItemModel {
  FoodIItemModel({
    this.tid,
    this.kind,
    this.dtype,
    this.value,
    this.children,
  });

  String tid;
  String kind;
  String dtype;
  MealType value;
  List<Child> children;

  factory FoodIItemModel.fromRawJson(String str) =>
      FoodIItemModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FoodIItemModel.fromJson(Map<String, dynamic> json) => FoodIItemModel(
        tid: json["tid"] == null ? null : json["tid"],
        kind: json["kind"] == null ? null : json["kind"],
        dtype: json["dtype"] == null ? null : json["dtype"],
        value: json["value"] == null ? null : MealType.fromJson(json["value"]),
        children: json["children"] == null
            ? null
            : List<Child>.from(json["children"].map((x) => Child.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "tid": tid == null ? null : tid,
        "kind": kind == null ? null : kind,
        "dtype": dtype == null ? null : dtype,
        "value": value == null ? null : value.toJson(),
        "children": children == null
            ? null
            : List<dynamic>.from(children.map((x) => x.toJson())),
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

  factory Child.fromRawJson(String str) => Child.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Child.fromJson(Map<String, dynamic> json) => Child(
        tid: json["tid"] == null ? null : json["tid"],
        kind: json["kind"] == null ? null : json["kind"],
        dtype: json["dtype"] == null ? null : json["dtype"],
        value:
            json["value"] == null ? null : ChildValue.fromJson(json["value"]),
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
    this.arr,
  });

  List<String> arr;

  factory ChildValue.fromRawJson(String str) =>
      ChildValue.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ChildValue.fromJson(Map<String, dynamic> json) => ChildValue(
        arr: json["arr"] == null
            ? null
            : List<String>.from(json["arr"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "arr": arr == null ? null : List<dynamic>.from(arr.map((x) => x)),
      };
}

class MealType {
  MealType({
    this.str,
  });

  String str;

  factory MealType.fromRawJson(String str) =>
      MealType.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MealType.fromJson(Map<String, dynamic> json) => MealType(
        str: json["str"] == null ? null : json["str"],
      );

  Map<String, dynamic> toJson() => {
        "str": str == null ? null : str,
      };
}
