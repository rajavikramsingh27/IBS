// To parse this JSON data, do
//
//     final foodResponseModel = foodResponseModelFromJson(jsonString);

import 'dart:convert';

class FoodResponseModel {
  FoodResponseModel({
    this.id,
    this.items,
    this.uid,
    this.v,
  });

  String id;
  List<Item> items;
  String uid;
  int v;

  factory FoodResponseModel.fromRawJson(String str) =>
      FoodResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FoodResponseModel.fromJson(Map<String, dynamic> json) =>
      FoodResponseModel(
        id: json["_id"] == null ? null : json["_id"],
        items: json["items"] == null
            ? null
            : List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        uid: json["uid"] == null ? null : json["uid"],
        v: json["__v"] == null ? null : json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "items": items == null
            ? null
            : List<dynamic>.from(items.map((x) => x.toJson())),
        "uid": uid == null ? null : uid,
        "__v": v == null ? null : v,
      };
}

class Item {
  Item({
    this.value,
    this.id,
    this.tid,
    this.kind,
    this.dtype,
    this.children,
  });

  ItemValue value;
  String id;
  String tid;
  String kind;
  String dtype;
  List<Child> children;

  factory Item.fromRawJson(String str) => Item.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        value: json["value"] == null ? null : ItemValue.fromJson(json["value"]),
        id: json["_id"] == null ? null : json["_id"],
        tid: json["tid"] == null ? null : json["tid"],
        kind: json["kind"] == null ? null : json["kind"],
        dtype: json["dtype"] == null ? null : json["dtype"],
        children: json["children"] == null
            ? null
            : List<Child>.from(json["children"].map((x) => Child.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "value": value == null ? null : value.toJson(),
        "_id": id == null ? null : id,
        "tid": tid == null ? null : tid,
        "kind": kind == null ? null : kind,
        "dtype": dtype == null ? null : dtype,
        "children": children == null
            ? null
            : List<dynamic>.from(children.map((x) => x.toJson())),
      };
}

class Child {
  Child({
    this.value,
    this.id,
    this.tid,
    this.kind,
    this.dtype,
  });

  ChildValue value;
  String id;
  String tid;
  String kind;
  String dtype;

  factory Child.fromRawJson(String str) => Child.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Child.fromJson(Map<String, dynamic> json) => Child(
        value:
            json["value"] == null ? null : ChildValue.fromJson(json["value"]),
        id: json["_id"] == null ? null : json["_id"],
        tid: json["tid"] == null ? null : json["tid"],
        kind: json["kind"] == null ? null : json["kind"],
        dtype: json["dtype"] == null ? null : json["dtype"],
      );

  Map<String, dynamic> toJson() => {
        "value": value == null ? null : value.toJson(),
        "_id": id == null ? null : id,
        "tid": tid == null ? null : tid,
        "kind": kind == null ? null : kind,
        "dtype": dtype == null ? null : dtype,
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

class ItemValue {
  ItemValue({
    this.arr,
    this.str,
  });

  List<dynamic> arr;
  String str;

  factory ItemValue.fromRawJson(String str) =>
      ItemValue.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ItemValue.fromJson(Map<String, dynamic> json) => ItemValue(
        arr: json["arr"] == null
            ? null
            : List<dynamic>.from(json["arr"].map((x) => x)),
        str: json["str"] == null ? null : json["str"],
      );

  Map<String, dynamic> toJson() => {
        "arr": arr == null ? null : List<dynamic>.from(arr.map((x) => x)),
        "str": str == null ? null : str,
      };
}
