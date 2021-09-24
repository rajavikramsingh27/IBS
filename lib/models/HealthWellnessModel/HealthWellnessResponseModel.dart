// To parse this JSON data, do
//
//     final healthWellnessResponseModel = healthWellnessResponseModelFromJson(jsonString);

import 'dart:convert';

HealthWellnessResponseModel healthWellnessResponseModelFromJson(String str) =>
    HealthWellnessResponseModel.fromJson(json.decode(str));

String healthWellnessResponseModelToJson(HealthWellnessResponseModel data) =>
    json.encode(data.toJson());

class HealthWellnessResponseModel {
  HealthWellnessResponseModel({
    this.id,
    this.items,
    this.uid,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String id;
  List<Item> items;
  String uid;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory HealthWellnessResponseModel.fromJson(Map<String, dynamic> json) =>
      HealthWellnessResponseModel(
        id: json["_id"] == null ? null : json["_id"],
        items: json["items"] == null
            ? null
            : List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        uid: json["uid"] == null ? null : json["uid"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"] == null ? null : json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "items": items == null
            ? null
            : List<dynamic>.from(items.map((x) => x.toJson())),
        "uid": uid == null ? null : uid,
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
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

  Value value;
  String id;
  String tid;
  String kind;
  Dtype dtype;
  dynamic children;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        value: json["value"] == null ? null : Value.fromJson(json["value"]),
        id: json["_id"] == null ? null : json["_id"],
        tid: json["tid"] == null ? null : json["tid"],
        kind: json["kind"] == null ? null : json["kind"],
        dtype: json["dtype"] == null ? null : dtypeValues.map[json["dtype"]],
        children: json["children"],
      );

  Map<String, dynamic> toJson() => {
        "value": value == null ? null : value.toJson(),
        "_id": id == null ? null : id,
        "tid": tid == null ? null : tid,
        "kind": kind == null ? null : kind,
        "dtype": dtype == null ? null : dtypeValues.reverse[dtype],
        "children": children,
      };
}

enum Dtype { NUM, ARR, STR }

final dtypeValues =
    EnumValues({"arr": Dtype.ARR, "num": Dtype.NUM, "str": Dtype.STR});

class Value {
  Value({
    this.arr,
    this.num,
    this.str,
  });

  List<String> arr;
  int num;
  String str;

  factory Value.fromJson(Map<String, dynamic> json) => Value(
        arr: json["arr"] == null
            ? null
            : List<String>.from(json["arr"].map((x) => x)),
        num: json["num"] == null ? null : json["num"],
        str: json["str"] == null ? null : json["str"],
      );

  Map<String, dynamic> toJson() => {
        "arr": arr == null ? null : List<dynamic>.from(arr.map((x) => x)),
        "num": num == null ? null : num,
        "str": str == null ? null : str,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
