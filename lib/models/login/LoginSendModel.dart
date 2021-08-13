// To parse this JSON data, do
//
//     final loginSendModel = loginSendModelFromJson(jsonString);

import 'dart:convert';

class LoginSendModel {
  LoginSendModel({
    this.strategy,
    this.loginId,
    this.password,
  });

  String strategy;
  String loginId;
  String password;

  factory LoginSendModel.fromRawJson(String str) =>
      LoginSendModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LoginSendModel.fromJson(Map<String, dynamic> json) => LoginSendModel(
        strategy: json["strategy"] == null ? null : json["strategy"],
        loginId: json["loginId"] == null ? null : json["loginId"],
        password: json["password"] == null ? null : json["password"],
      );

  Map<String, dynamic> toJson() => {
        "strategy": strategy == null ? null : strategy,
        "loginId": loginId == null ? null : loginId,
        "password": password == null ? null : password,
      };
}
