// To parse this JSON data, do
//
//     final languageResponseModel = languageResponseModelFromJson(jsonString);

import 'dart:convert';

LanguageResponseModel languageResponseModelFromJson(String str) => LanguageResponseModel.fromJson(json.decode(str));

String languageResponseModelToJson(LanguageResponseModel data) => json.encode(data.toJson());

class LanguageResponseModel {
  LanguageResponseModel({
    this.total,
    this.limit,
    this.skip,
    this.data,
  });

  int total;
  int limit;
  int skip;
  List<dynamic> data;

  factory LanguageResponseModel.fromJson(Map<String, dynamic> json) => LanguageResponseModel(
    total: json["total"] == null ? null : json["total"],
    limit: json["limit"] == null ? null : json["limit"],
    skip: json["skip"] == null ? null : json["skip"],
    data: json["data"] == null ? null : json["data"]
  );

  Map<String, dynamic> toJson() => {
    "total": total == null ? null : total,
    "limit": limit == null ? null : limit,
    "skip": skip == null ? null : skip,
    "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
  };
}