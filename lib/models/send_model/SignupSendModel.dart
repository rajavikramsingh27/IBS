// To parse this JSON data, do
//
//     final signupSendModel = signupSendModelFromJson(jsonString);

import 'dart:convert';

SignupSendModel signupSendModelFromJson(String str) => SignupSendModel.fromJson(json.decode(str));

String signupSendModelToJson(SignupSendModel data) => json.encode(data.toJson());

class SignupSendModel {
    SignupSendModel({
        this.label,
        this.email,
        this.password,
        this.agreeTos,
        this.profile,
        this.tracking,
    });

    String label;
    String email;
    String password;
    bool agreeTos;
    Profile profile;
    Tracking tracking;

    factory SignupSendModel.fromJson(Map<String, dynamic> json) => SignupSendModel(
        label: json["label"],
        email: json["email"],
        password: json["password"],
        agreeTos: json["agreeTos"],
        profile: Profile.fromJson(json["profile"]),
        tracking: Tracking.fromJson(json["tracking"]),
    );

    Map<String, dynamic> toJson() => {
        "label": label,
        "email": email,
        "password": password,
        "agreeTos": agreeTos,
        "profile": profile.toJson(),
        "tracking": tracking.toJson(),
    };
}

class Profile {
    Profile({
        this.sex,
        this.age,
        this.familyHistory,
        this.diagnosedIbs,
    });

    String sex;
    String age;
    String familyHistory;
    DiagnosedIbs diagnosedIbs;

    factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        sex: json["sex"],
        age: json["age"],
        familyHistory: json["familyHistory"],
        diagnosedIbs: DiagnosedIbs.fromJson(json["diagnosedIbs"]),
    );

    Map<String, dynamic> toJson() => {
        "sex": sex,
        "age": age,
        "familyHistory": familyHistory,
        "diagnosedIbs": diagnosedIbs.toJson(),
    };
}

class DiagnosedIbs {
    DiagnosedIbs({
        this.isDiagnosed,
        this.ibsType,
    });

    bool isDiagnosed;
    String ibsType;

    factory DiagnosedIbs.fromJson(Map<String, dynamic> json) => DiagnosedIbs(
        isDiagnosed: json["isDiagnosed"],
        ibsType: json["ibsType"],
    );

    Map<String, dynamic> toJson() => {
        "isDiagnosed": isDiagnosed,
        "ibsType": ibsType,
    };
}

class Tracking {
    Tracking({
        this.symptoms,
        this.bowelMovements,
    });

    List<String> symptoms;
    List<String> bowelMovements;

    factory Tracking.fromJson(Map<String, dynamic> json) => Tracking(
        symptoms: List<String>.from(json["symptoms"].map((x) => x)),
        bowelMovements: List<String>.from(json["bowelMovements"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "symptoms": List<dynamic>.from(symptoms.map((x) => x)),
        "bowelMovements": List<dynamic>.from(bowelMovements.map((x) => x)),
    };
}
