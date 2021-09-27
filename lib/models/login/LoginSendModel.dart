// To parse this JSON data, do
//
//     final loginSendModel = loginSendModelFromJson(jsonString);

import 'dart:convert';

class LoginSendModel {
  LoginSendModel({
    this.strategy,
    this.loginId,
    this.password,
    this.email,
  });

  String strategy;
  String loginId;
  String password;
  String email;

  factory LoginSendModel.fromRawJson(String str) =>
      LoginSendModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LoginSendModel.fromJson(Map<String, dynamic> json) => LoginSendModel(
        strategy: json["strategy"] == null ? null : json["strategy"],
        loginId: json["loginId"] == null ? null : json["loginId"],
        password: json["password"] == null ? null : json["password"],
        email: json["email"] == null ? null : json["email"],
      );

  Map<String, dynamic> toJson() {
    if (this.email != null) {
      return <String, dynamic>{
        "strategy": strategy == null ? null : strategy,
        "password": password == null ? null : password,
        "email": email == null ? null : email,
      };
    }

    return <String, dynamic>{
      "strategy": strategy == null ? null : strategy,
      "loginId": loginId == null ? null : loginId,
      "password": password == null ? null : password,
    };
  }
}
