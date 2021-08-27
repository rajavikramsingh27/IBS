// To parse this JSON data, do
//
//     final journalSendModel = journalSendModelFromJson(jsonString);

import 'dart:convert';

JournalSendModel journalSendModelFromJson(String str) =>
    JournalSendModel.fromJson(json.decode(str));

String journalSendModelToJson(JournalSendModel data) =>
    json.encode(data.toJson());

class JournalSendModel {
  JournalSendModel({
    this.category = "journal",
    this.items,
  });

  String category;
  List<Item> items;

  factory JournalSendModel.fromJson(Map<String, dynamic> json) =>
      JournalSendModel(
        category: json["category"] == null ? null : json["category"],
        items: json["items"] == null
            ? null
            : List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "category": category == null ? null : category,
        "items": items == null
            ? null
            : List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    this.tid = "journal-entry",
    this.kind = "textInput",
    this.dtype = "str",
    this.value,
  });

  String tid;
  String kind;
  String dtype;
  Value value;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        tid: json["tid"] == null ? null : json["tid"],
        kind: json["kind"] == null ? null : json["kind"],
        dtype: json["dtype"] == null ? null : json["dtype"],
        value: json["value"] == null ? null : Value.fromJson(json["value"]),
      );

  Map<String, dynamic> toJson() => {
        "tid": tid == null ? null : tid,
        "kind": kind == null ? null : kind,
        "dtype": dtype == null ? null : dtype,
        "value": value == null ? null : value.toJson(),
      };
}

class Value {
  Value({
    this.str,
  });

  String str;

  factory Value.fromJson(Map<String, dynamic> json) => Value(
        str: json["str"] == null ? null : json["str"],
      );

  Map<String, dynamic> toJson() => {
        "str": str == null ? null : str,
      };
}
