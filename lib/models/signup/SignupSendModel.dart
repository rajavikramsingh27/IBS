// To parse this JSON data, do
//
//     final signupSendModel = signupSendModelFromJson(jsonString);

import 'dart:convert';

SignupSendModel signupSendModelFromJson(String str) =>
    SignupSendModel.fromJson(json.decode(str));

String signupSendModelToJson(SignupSendModel data) =>
    json.encode(data.toJson());

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
  ProfileSendModel profile;
  TrackingSendModel tracking;

  factory SignupSendModel.fromJson(Map<String, dynamic> json) =>
      SignupSendModel(
        label: json["label"] == null ? null : json["label"],
        email: json["email"] == null ? null : json["email"],
        password: json["password"] == null ? null : json["password"],
        agreeTos: json["agreeTos"] == null ? null : json["agreeTos"],
        profile: json["profile"] == null
            ? null
            : ProfileSendModel.fromJson(json["profile"]),
        tracking: json["tracking"] == null
            ? null
            : TrackingSendModel.fromJson(json["tracking"]),
      );

  Map<String, dynamic> toJson() => {
        "label": label == null ? null : label,
        "email": email == null ? null : email,
        "password": password == null ? null : password,
        "agreeTos": agreeTos == null ? null : agreeTos,
        "profile": profile == null ? null : profile.toJson(),
        "tracking": tracking == null ? null : tracking.toJson(),
      };
}

class ProfileSendModel {
  ProfileSendModel({
    this.sex,
    this.age,
    this.familyHistory,
    this.diagnosedIbs,
    this.romeiv,
  });

  String sex;
  String age;
  String familyHistory;
  DiagnosedIbsSendModel diagnosedIbs;
  RomeivSendModel romeiv;

  factory ProfileSendModel.fromJson(Map<String, dynamic> json) =>
      ProfileSendModel(
        sex: json["sex"] == null ? null : json["sex"],
        age: json["age"] == null ? null : json["age"],
        familyHistory:
            json["familyHistory"] == null ? null : json["familyHistory"],
        diagnosedIbs: json["diagnosedIbs"] == null
            ? null
            : DiagnosedIbsSendModel.fromJson(json["diagnosedIbs"]),
        romeiv: json["romeiv"] == null
            ? null
            : RomeivSendModel.fromJson(json["romeiv"]),
      );

  Map<String, dynamic> toJson() => {
        "sex": sex == null ? null : sex,
        "age": age == null ? null : age,
        "familyHistory": familyHistory == null ? null : familyHistory,
        "diagnosedIbs": diagnosedIbs == null ? null : diagnosedIbs.toJson(),
        "romeiv": romeiv == null ? null : romeiv.toJson(),
      };
}

class DiagnosedIbsSendModel {
  DiagnosedIbsSendModel({
    this.isDiagnosed,
    this.ibsType,
  });

  bool isDiagnosed;
  String ibsType;

  factory DiagnosedIbsSendModel.fromJson(Map<String, dynamic> json) =>
      DiagnosedIbsSendModel(
        isDiagnosed: json["isDiagnosed"] == null ? null : json["isDiagnosed"],
        ibsType: json["ibsType"] == null ? null : json["ibsType"],
      );

  Map<String, dynamic> toJson() => {
        "isDiagnosed": isDiagnosed == null ? null : isDiagnosed,
        "ibsType": ibsType == null ? null : ibsType,
      };
}

class RomeivSendModel {
  RomeivSendModel({
    this.abdominalPain,
    this.abdominalPainTimeBowel,
    this.abdominalPainBowelMoreLess,
    this.abdominalPainBowelAppearDifferent,
    this.stool,
  });

  bool abdominalPain;
  bool abdominalPainTimeBowel;
  bool abdominalPainBowelMoreLess;
  bool abdominalPainBowelAppearDifferent;
  String stool;

  factory RomeivSendModel.fromJson(Map<String, dynamic> json) =>
      RomeivSendModel(
        abdominalPain:
            json["abdominalPain"] == null ? null : json["abdominalPain"],
        abdominalPainTimeBowel: json["abdominalPainTimeBowel"] == null
            ? null
            : json["abdominalPainTimeBowel"],
        abdominalPainBowelMoreLess: json["abdominalPainBowelMoreLess"] == null
            ? null
            : json["abdominalPainBowelMoreLess"],
        abdominalPainBowelAppearDifferent:
            json["abdominalPainBowelAppearDifferent"] == null
                ? null
                : json["abdominalPainBowelAppearDifferent"],
        stool: json["stool"] == null ? null : json["stool"],
      );

  Map<String, dynamic> toJson() => {
        "abdominalPain": abdominalPain == null ? null : abdominalPain,
        "abdominalPainTimeBowel":
            abdominalPainTimeBowel == null ? null : abdominalPainTimeBowel,
        "abdominalPainBowelMoreLess": abdominalPainBowelMoreLess == null
            ? null
            : abdominalPainBowelMoreLess,
        "abdominalPainBowelAppearDifferent":
            abdominalPainBowelAppearDifferent == null
                ? null
                : abdominalPainBowelAppearDifferent,
        "stool": stool == null ? null : stool,
      };
}

class TrackingSendModel {
  TrackingSendModel({
    this.symptoms,
    this.bowelMovements,
    this.medications,
    this.healthWelleness,
    this.foods,
    this.journal,
  });

  List<String> symptoms;
  List<String> bowelMovements;
  List<String> medications;
  List<String> healthWelleness;
  List<String> foods;
  List<String> journal;

  factory TrackingSendModel.fromJson(Map<String, dynamic> json) =>
      TrackingSendModel(
        symptoms: json["symptoms"] == null
            ? null
            : List<String>.from(json["symptoms"].map((x) => x)),
        bowelMovements: json["bowelMovements"] == null
            ? null
            : List<String>.from(json["bowelMovements"].map((x) => x)),
        medications: json["medications"] == null
            ? null
            : List<String>.from(json["medications"].map((x) => x)),
        healthWelleness: json["healthWelleness"] == null
            ? null
            : List<String>.from(json["healthWelleness"].map((x) => x)),
        foods: json["foods"] == null
            ? null
            : List<String>.from(json["foods"].map((x) => x)),
        journal: json["journal"] == null
            ? null
            : List<String>.from(json["journal"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "symptoms": symptoms == null
            ? null
            : List<dynamic>.from(symptoms.map((x) => x)),
        "bowelMovements": bowelMovements == null
            ? null
            : List<dynamic>.from(bowelMovements.map((x) => x)),
        "medications": medications == null
            ? null
            : List<dynamic>.from(medications.map((x) => x)),
        "healthWelleness": healthWelleness == null
            ? null
            : List<dynamic>.from(healthWelleness.map((x) => x)),
        "foods": foods == null ? null : List<dynamic>.from(foods.map((x) => x)),
        "journal":
            journal == null ? null : List<dynamic>.from(journal.map((x) => x)),
      };
}
