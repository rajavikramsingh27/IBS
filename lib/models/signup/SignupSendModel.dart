// To parse this JSON data, do
//
//     final loginResponseModel = loginResponseModelFromJson(jsonString);

import 'dart:convert';

SignupSendModel loginResponseModelFromJson(String str) =>
    SignupSendModel.fromJson(json.decode(str));

String loginResponseModelToJson(SignupSendModel data) =>
    json.encode(data.toJson());

class SignupSendModel {
  SignupSendModel({
    this.profile,
    this.tracking,
    this.tags,
    this.treatmentPlans,
    this.id,
    this.label,
    this.email,
    this.password,
    this.agreeTos,
    this.loginId,
    this.results,
    this.v,
  });

  ProfileSendModel profile;
  Tracking tracking;
  Tags tags;
  List<dynamic> treatmentPlans;
  String id;
  String label;
  String email;
  String password;
  bool agreeTos;
  String loginId;
  ResultsSendModel results;

  int v;

  factory SignupSendModel.fromJson(Map<String, dynamic> json) =>
      SignupSendModel(
        profile: ProfileSendModel.fromJson(json["profile"]),
        tracking: Tracking.fromJson(json["tracking"]),
        tags: Tags.fromJson(json["tags"]),
        treatmentPlans:
            List<dynamic>.from(json["treatmentPlans"].map((x) => x)),
        id: json["_id"],
        label: json["label"],
        email: json["email"],
        password: json["password"],

        agreeTos: json["agreeTos"],
        loginId: json["loginId"],
        results: ResultsSendModel.fromJson(json["results"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "profile": profile?.toJson(),
        "tracking": tracking?.toJson(),
        "tags": tags?.toJson(),
        "treatmentPlans": List<dynamic>.from(treatmentPlans.map((x) => x)),
        "_id": id,
        "label": label,
        "email": email,
         "password": password,
        "agreeTos": agreeTos,
        "loginId": loginId,
        "results": results?.toJson(),
        "__v": v,
      };
}

class ProfileSendModel {
  ProfileSendModel({
    this.romeiv,
    this.sex,
    this.age,
    this.familyHistory,
    this.diagnosedIbs,
  });

  RomeivSendModel romeiv;
  String sex;
  String age;
  String familyHistory;
  DiagnosedIbsSendModel diagnosedIbs;

  factory ProfileSendModel.fromJson(Map<String, dynamic> json) => ProfileSendModel(
        romeiv: RomeivSendModel.fromJson(json["romeiv"]),
        sex: json["sex"],
        age: json["age"],
        familyHistory: json["familyHistory"],
        diagnosedIbs: DiagnosedIbsSendModel.fromJson(json["diagnosedIbs"]),
      );

  Map<String, dynamic> toJson() => {
        "romeiv": romeiv?.toJson(),
        "sex": sex,
        "age": age,
        "familyHistory": familyHistory,
        "diagnosedIbs": diagnosedIbs?.toJson(),
      };
}

class DiagnosedIbsSendModel {
  DiagnosedIbsSendModel({
    this.isDiagnosed,
    this.id,
    this.ibsType,
  });

  bool isDiagnosed;
  String id;
  String ibsType;

  factory DiagnosedIbsSendModel.fromJson(Map<String, dynamic> json) => DiagnosedIbsSendModel(
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

  factory RomeivSendModel.fromJson(Map<String, dynamic> json) => RomeivSendModel(
        abdominalPain: json["abdominalPain"],
        abdominalPainTimeBowel: json["abdominalPainTimeBowel"],
        abdominalPainBowelMoreLess: json["abdominalPainBowelMoreLess"],
        abdominalPainBowelAppearDifferent:
            json["abdominalPainBowelAppearDifferent"],
        stool: json["stool"],
      );

  Map<String, dynamic> toJson() => {
        "abdominalPain": abdominalPain,
        "abdominalPainTimeBowel": abdominalPainTimeBowel,
        "abdominalPainBowelMoreLess": abdominalPainBowelMoreLess,
        "abdominalPainBowelAppearDifferent": abdominalPainBowelAppearDifferent,
        "stool": stool,
      };
}

class ResultsSendModel {
  ResultsSendModel({
    this.romeiv,
  });

  String romeiv;

  factory ResultsSendModel.fromJson(Map<String, dynamic> json) => ResultsSendModel(
        romeiv: json["romeiv"],
      );

  Map<String, dynamic> toJson() => {
        "romeiv": romeiv,
      };
}

class Tags {
  Tags({
    this.breakfast,
    this.lunch,
    this.dinner,
    this.snacks,
    this.relaxationTechniques,
    this.prescriptionMedications,
    this.otherMedications,
  });

  List<dynamic> breakfast;
  List<dynamic> lunch;
  List<dynamic> dinner;
  List<dynamic> snacks;
  List<dynamic> relaxationTechniques;
  List<dynamic> prescriptionMedications;
  List<dynamic> otherMedications;

  factory Tags.fromJson(Map<String, dynamic> json) => Tags(
        breakfast: List<dynamic>.from(json["breakfast"].map((x) => x)),
        lunch: List<dynamic>.from(json["lunch"].map((x) => x)),
        dinner: List<dynamic>.from(json["dinner"].map((x) => x)),
        snacks: List<dynamic>.from(json["snacks"].map((x) => x)),
        relaxationTechniques:
            List<dynamic>.from(json["relaxationTechniques"].map((x) => x)),
        prescriptionMedications:
            List<dynamic>.from(json["prescriptionMedications"].map((x) => x)),
        otherMedications:
            List<dynamic>.from(json["otherMedications"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "breakfast": List<dynamic>.from(breakfast.map((x) => x)),
        "lunch": List<dynamic>.from(lunch.map((x) => x)),
        "dinner": List<dynamic>.from(dinner.map((x) => x)),
        "snacks": List<dynamic>.from(snacks.map((x) => x)),
        "relaxationTechniques":
            List<dynamic>.from(relaxationTechniques.map((x) => x)),
        "prescriptionMedications":
            List<dynamic>.from(prescriptionMedications.map((x) => x)),
        "otherMedications": List<dynamic>.from(otherMedications.map((x) => x)),
      };
}

class Tracking {
  Tracking({
    this.symptoms,
    this.bowelMovements,
    this.medications,
    this.healthWelleness,
    this.foods,
  });

  List<String> symptoms;
  List<String> bowelMovements;
  List<dynamic> medications;
  List<dynamic> healthWelleness;
  List<dynamic> foods;

  factory Tracking.fromJson(Map<String, dynamic> json) => Tracking(
        symptoms: List<String>.from(json["symptoms"].map((x) => x)),
        bowelMovements: List<String>.from(json["bowelMovements"].map((x) => x)),
        medications: List<dynamic>.from(json["medications"].map((x) => x)),
        healthWelleness:
            List<dynamic>.from(json["healthWelleness"].map((x) => x)),
        foods: List<dynamic>.from(json["foods"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "symptoms": List<dynamic>.from(symptoms.map((x) => x)),
        "bowelMovements": List<dynamic>.from(bowelMovements.map((x) => x)),
        "medications": List<dynamic>.from(medications.map((x) => x)),
        "healthWelleness": List<dynamic>.from(healthWelleness.map((x) => x)),
        "foods": List<dynamic>.from(foods.map((x) => x)),
      };
}
