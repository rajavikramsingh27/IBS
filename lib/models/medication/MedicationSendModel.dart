// To parse this JSON data, do
//
//     final medicationSendModel = medicationSendModelFromJson(jsonString);

import 'dart:convert';

class MedicationSendModel {
  MedicationSendModel({
    this.category = "medications",
    this.items,
  });

  String category;
  List<MedicationItem> items;

  factory MedicationSendModel.fromRawJson(String str) =>
      MedicationSendModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MedicationSendModel.fromJson(Map<String, dynamic> json) =>
      MedicationSendModel(
        category: json["category"] == null ? null : json["category"],
        items: json["items"] == null
            ? null
            : List<MedicationItem>.from(
                json["items"].map((x) => MedicationItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "category": category == null ? null : category,
        "items": items == null
            ? null
            : List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class MedicationItem {
  MedicationItem({
    this.tid,
    this.kind,
    this.dtype,
    this.value,
  });

  String tid;
  String kind;
  String dtype;
  MedicationValue value;

  factory MedicationItem.fromRawJson(String str) =>
      MedicationItem.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MedicationItem.fromJson(Map<String, dynamic> json) => MedicationItem(
        tid: json["tid"] == null ? null : json["tid"],
        kind: json["kind"] == null ? null : json["kind"],
        dtype: json["dtype"] == null ? null : json["dtype"],
        value: json["value"] == null
            ? null
            : MedicationValue.fromJson(json["value"]),
      );

  Map<String, dynamic> toJson() => {
        "tid": tid == null ? null : tid,
        "kind": kind == null ? null : kind,
        "dtype": dtype == null ? null : dtype,
        "value": value == null ? null : value.toJson(),
      };
}

class MedicationValue {
  MedicationValue({
    this.arr,
    this.str,
  });

  List<String> arr;
  String str;

  factory MedicationValue.fromRawJson(String str) =>
      MedicationValue.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MedicationValue.fromJson(Map<String, dynamic> json) =>
      MedicationValue(
        arr: json["arr"] == null
            ? null
            : List<String>.from(json["arr"].map((x) => x)),
        str: json["str"] == null ? null : json["str"],
      );

  Map<String, dynamic> toJson() => {
        "arr": arr == null ? null : List<dynamic>.from(arr.map((x) => x)),
        "str": str == null ? null : str,
      };
}
