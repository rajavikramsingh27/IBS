// To parse this JSON data, do
//
//     final signupResponseModel = signupResponseModelFromJson(jsonString);

import 'dart:convert';

SignupResponseModel signupResponseModelFromJson(String str) => SignupResponseModel.fromJson(json.decode(str));

String signupResponseModelToJson(SignupResponseModel data) => json.encode(data.toJson());

class SignupResponseModel {
    SignupResponseModel({
        this.email,
        this.tracking,
        this.onboarding,
        this.id,
        this.loginId,
        this.profile,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    String? email;
    List<dynamic>? tracking;
    List<dynamic>? onboarding;
    String? id;
    String? loginId;
    Profile? profile;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    factory SignupResponseModel.fromJson(Map<String, dynamic> json) => SignupResponseModel(
        email: json["email"],
        tracking: List<dynamic>.from(json["tracking"].map((x) => x)),
        onboarding: List<dynamic>.from(json["onboarding"].map((x) => x)),
        id: json["_id"],
        loginId: json["loginId"],
        profile: Profile.fromJson(json["profile"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "tracking": List<dynamic>.from(tracking!.map((x) => x)),
        "onboarding": List<dynamic>.from(onboarding!.map((x) => x)),
        "_id": id,
        "loginId": loginId,
        "profile": profile!.toJson(),
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
    };
}

class Profile {
    Profile({
        this.sex,
        this.age,
        this.diagnosedIbs,
    });

    String? sex;
    String? age;
    DiagnosedIbs? diagnosedIbs;

    factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        sex: json["sex"],
        age: json["age"],
        diagnosedIbs: DiagnosedIbs.fromJson(json["diagnosedIbs"]),
    );

    Map<String, dynamic> toJson() => {
        "sex": sex,
        "age": age,
        "diagnosedIbs": diagnosedIbs!.toJson(),
    };
}

class DiagnosedIbs {
    DiagnosedIbs({
        this.isDiagnosed,
        this.id,
        this.ibsType,
    });

    bool? isDiagnosed;
    String? id;
    String? ibsType;

    factory DiagnosedIbs.fromJson(Map<String, dynamic> json) => DiagnosedIbs(
        isDiagnosed: json["isDiagnosed"],
        id: json["_id"],
        ibsType: json["ibsType"],
    );

    Map<String, dynamic> toJson() => {
        "isDiagnosed": isDiagnosed,
        "_id": id,
        "ibsType": ibsType,
    };
}
