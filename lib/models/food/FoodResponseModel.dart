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
  List<FoodList> items;
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
            : List<FoodList>.from(
                json["items"].map((x) => FoodList.fromJson(x))),
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

class FoodList {
  FoodList({
    this.value,
    this.id,
    this.tid,
    this.kind,
    this.dtype,
    this.children,
  });

  FoodValue value;
  String id;
  String tid;
  String kind;
  String dtype;
  List<FoodSubList> children;

  factory FoodList.fromRawJson(String str) =>
      FoodList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FoodList.fromJson(Map<String, dynamic> json) => FoodList(
        value: json["value"] == null ? null : FoodValue.fromJson(json["value"]),
        id: json["_id"] == null ? null : json["_id"],
        tid: json["tid"] == null ? null : json["tid"],
        kind: json["kind"] == null ? null : json["kind"],
        dtype: json["dtype"] == null ? null : json["dtype"],
        children: json["children"] == null
            ? null
            : List<FoodSubList>.from(
                json["children"].map((x) => FoodSubList.fromJson(x))),
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

class FoodSubList {
  FoodSubList({
    this.value,
    this.id,
    this.tid,
    this.kind,
    this.dtype,
  });

  FoodSubValue value;
  String id;
  String tid;
  String kind;
  String dtype;

  factory FoodSubList.fromRawJson(String str) =>
      FoodSubList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FoodSubList.fromJson(Map<String, dynamic> json) => FoodSubList(
        value:
            json["value"] == null ? null : FoodSubValue.fromJson(json["value"]),
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

class FoodSubValue {
  FoodSubValue({
    this.arr,
  });

  List<String> arr;

  factory FoodSubValue.fromRawJson(String str) =>
      FoodSubValue.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

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
    this.arr,
    this.str,
  });

  List<dynamic> arr;
  String str;

  factory FoodValue.fromRawJson(String str) =>
      FoodValue.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FoodValue.fromJson(Map<String, dynamic> json) => FoodValue(
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
