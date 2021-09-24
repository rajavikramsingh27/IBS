// To parse this JSON data, do
//
//     final tagsSendModel = tagsSendModelFromJson(jsonString);

import 'dart:convert';

class TagsSendModel {
  TagsSendModel({
    this.category,
    this.key,
    this.value,
    this.required,
  });

  String category;
  String key;
  String value;
  bool required;

  factory TagsSendModel.fromRawJson(String str) =>
      TagsSendModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TagsSendModel.fromJson(Map<String, dynamic> json) => TagsSendModel(
        category: json["category"] == null ? null : json["category"],
        key: json["key"] == null ? null : json["key"],
        value: json["value"] == null ? null : json["value"],
        required: json["required"] == null ? null : json["required"],
      );

  Map<String, dynamic> toJson() => {
        "category": category == null ? null : category,
        "key": key == null ? null : key,
        "value": value == null ? null : value,
        "required": required == null ? null : required,
      };
}
