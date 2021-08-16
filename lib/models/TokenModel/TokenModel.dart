// To parse this JSON data, do
//
//     final tokenModel = tokenModelFromJson(jsonString);

import 'dart:convert';

TokenModel tokenModelFromJson(String str) => TokenModel.fromJson(json.decode(str));

String tokenModelToJson(TokenModel data) => json.encode(data.toJson());

class TokenModel {
  TokenModel({
    this.token,
  });

  String token;

  factory TokenModel.fromJson(Map<String, dynamic> json) => TokenModel(
    token: json["Token"] == null ? null : json["Token"],
  );

  Map<String, dynamic> toJson() => {
    "Token": token == null ? null : token,
  };
}
