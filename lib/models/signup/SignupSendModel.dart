// To parse this JSON data, do
//
//     final signupResponseModel = signupResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';

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

  factory SignupSendModel.fromRawJson(String str) =>
      SignupSendModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

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

  factory ProfileSendModel.fromRawJson(String str) =>
      ProfileSendModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

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

  factory DiagnosedIbsSendModel.fromRawJson(String str) =>
      DiagnosedIbsSendModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

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

  factory RomeivSendModel.fromRawJson(String str) =>
      RomeivSendModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

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
    this.food,
    this.healthWellness,
    this.medications,
    this.journal,
  });

  List<TrackableItem> symptoms;
  List<TrackableItem> bowelMovements;
  List<TrackableItem> food;
  List<TrackableItem> healthWellness;
  List<TrackableItem> medications;
  List<TrackableItem> journal;

  factory TrackingSendModel.fromRawJson(String str) =>
      TrackingSendModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TrackingSendModel.fromJson(Map<String, dynamic> json) =>
      TrackingSendModel(
        symptoms: json["symptoms"] == null
            ? null
            : List<TrackableItem>.from(
                json["symptoms"].map((x) => TrackableItem.fromJson(x))),
        bowelMovements: json["bowelMovements"] == null
            ? null
            : List<TrackableItem>.from(json["bowelMovements"].map((x) => x)),
        food: json["food"] == null
            ? null
            : List<TrackableItem>.from(json["food"].map((x) => x)),
        healthWellness: json["healthWellness"] == null
            ? null
            : List<TrackableItem>.from(
                json["healthWellness"].map((x) => TrackableItem.fromJson(x))),
        medications: json["medications"] == null
            ? null
            : List<TrackableItem>.from(json["medications"].map((x) => x)),
        journal: json["journal"] == null
            ? null
            : List<TrackableItem>.from(json["journal"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "symptoms": symptoms == null
            ? null
            : List<dynamic>.from(symptoms.map((x) => x.toJson())),
        "bowelMovements": bowelMovements == null
            ? null
            : List<dynamic>.from(bowelMovements.map((x) => x.toJson())),
        "foods": food == null
            ? null
            : List<dynamic>.from(food.map((x) => x.toJson())),
        "healthWellness": healthWellness == null
            ? null
            : List<dynamic>.from(healthWellness.map((x) => x.toJson())),
        "medications": medications == null
            ? null
            : List<dynamic>.from(medications.map((x) => x.toJson())),
        "journal": journal == null
            ? null
            : List<dynamic>.from(journal.map((x) => x.toJson())),
      };
}
