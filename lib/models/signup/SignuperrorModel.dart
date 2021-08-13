// To parse this JSON data, do
//
//     final signupErrorModel = signupErrorModelFromJson(jsonString);

import 'dart:convert';

class SignupErrorModel {
  SignupErrorModel({
    this.name,
    this.message,
    this.code,
    this.className,
    this.errors,
  });

  String name;
  String message;
  int code;
  String className;
  Errors errors;

  factory SignupErrorModel.fromRawJson(String str) =>
      SignupErrorModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SignupErrorModel.fromJson(Map<String, dynamic> json) =>
      SignupErrorModel(
        name: json["name"] == null ? null : json["name"],
        message: json["message"] == null ? null : json["message"],
        code: json["code"] == null ? null : json["code"],
        className: json["className"] == null ? null : json["className"],
        errors: json["errors"] == null ? null : Errors.fromJson(json["errors"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "message": message == null ? null : message,
        "code": code == null ? null : code,
        "className": className == null ? null : className,
        "errors": errors == null ? null : errors.toJson(),
      };
}

class Errors {
  Errors({
    this.email,
  });

  String email;

  factory Errors.fromRawJson(String str) => Errors.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Errors.fromJson(Map<String, dynamic> json) => Errors(
        email: json["email"] == null ? null : json["email"],
      );

  Map<String, dynamic> toJson() => {
        "email": email == null ? null : email,
      };
}
