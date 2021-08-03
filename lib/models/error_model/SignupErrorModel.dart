// To parse this JSON data, do
//
//     final signupErrorModel = signupErrorModelFromJson(jsonString);

import 'dart:convert';

SignupErrorModel signupErrorModelFromJson(String str) => SignupErrorModel.fromJson(json.decode(str));

String signupErrorModelToJson(SignupErrorModel data) => json.encode(data.toJson());

class SignupErrorModel {
    SignupErrorModel({
        this.name,
        this.message,
        this.code,
        this.className,
        this.data,
        this.errors,
    });

    String name;
    String message;
    int code;
    String className;
    Data data;
    Errors errors;

    factory SignupErrorModel.fromJson(Map<String, dynamic> json) => SignupErrorModel(
        name: json["name"],
        message: json["message"],
        code: json["code"],
        className: json["className"],
        data: Data.fromJson(json["data"]),
        errors: Errors.fromJson(json["errors"]),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "message": message,
        "code": code,
        "className": className,
        "data": data.toJson(),
        "errors": errors.toJson(),
    };
}

class Data {
    Data();

    factory Data.fromJson(Map<String, dynamic> json) => Data(
    );

    Map<String, dynamic> toJson() => {
    };
}

class Errors {
    Errors({
        this.agreeTos,
    });

    AgreeTos agreeTos;

    factory Errors.fromJson(Map<String, dynamic> json) => Errors(
        agreeTos: AgreeTos.fromJson(json["agreeTos"]),
    );

    Map<String, dynamic> toJson() => {
        "agreeTos": agreeTos.toJson(),
    };
}

class AgreeTos {
    AgreeTos({
        this.name,
        this.message,
    });

    String name;
    String message;

    factory AgreeTos.fromJson(Map<String, dynamic> json) => AgreeTos(
        name: json["name"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "message": message,
    };
}
