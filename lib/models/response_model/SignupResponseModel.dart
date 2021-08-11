// To parse this JSON data, do
//
//     final loginResponseModel = loginResponseModelFromJson(jsonString);

import 'dart:convert';

SignupResponseModel loginResponseModelFromJson(String str) =>
    SignupResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(SignupResponseModel data) =>
    json.encode(data.toJson());

class SignupResponseModel {
  SignupResponseModel({
    this.profile,
    this.tracking,
    this.tags,
    this.treatmentPlans,
    this.id,
    this.label,
    this.email,
    this.agreeTos,
    this.loginId,
    this.results,
    this.v,
  });

  Profile? profile;
  Tracking? tracking;
  Tags? tags;
  List<dynamic>? treatmentPlans;
  String? id;
  String? label;
  String? email;
  bool? agreeTos;
  String? loginId;
  Results? results;

  int? v;

  factory SignupResponseModel.fromJson(Map<String, dynamic> json) =>
      SignupResponseModel(
        profile: Profile.fromJson(json["profile"]),
        tracking: Tracking.fromJson(json["tracking"]),
        tags: Tags.fromJson(json["tags"]),
        treatmentPlans:
            List<dynamic>.from(json["treatmentPlans"].map((x) => x)),
        id: json["_id"],
        label: json["label"],
        email: json["email"],
        agreeTos: json["agreeTos"],
        loginId: json["loginId"],
        results: Results.fromJson(json["results"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "profile": profile?.toJson(),
        "tracking": tracking?.toJson(),
        "tags": tags?.toJson(),
        "treatmentPlans": List<dynamic>.from(treatmentPlans!.map((x) => x)),
        "_id": id,
        "label": label,
        "email": email,
        "agreeTos": agreeTos,
        "loginId": loginId,
        "results": results?.toJson(),
        "__v": v,
      };
}

class Profile {
  Profile({
    this.romeiv,
    this.sex,
    this.age,
    this.familyHistory,
    this.diagnosedIbs,
  });

  Romeiv? romeiv;
  String? sex;
  String? age;
  String? familyHistory;
  DiagnosedIbs? diagnosedIbs;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        romeiv: Romeiv.fromJson(json["romeiv"]),
        sex: json["sex"],
        age: json["age"],
        familyHistory: json["familyHistory"],
        diagnosedIbs: DiagnosedIbs.fromJson(json["diagnosedIbs"]),
      );

  Map<String, dynamic> toJson() => {
        "romeiv": romeiv?.toJson(),
        "sex": sex,
        "age": age,
        "familyHistory": familyHistory,
        "diagnosedIbs": diagnosedIbs?.toJson(),
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

class Romeiv {
  Romeiv({
    this.abdominalPain,
    this.abdominalPainTimeBowel,
    this.abdominalPainBowelMoreLess,
    this.abdominalPainBowelAppearDifferent,
    this.stool,
  });

  bool? abdominalPain;
  bool? abdominalPainTimeBowel;
  bool? abdominalPainBowelMoreLess;
  bool? abdominalPainBowelAppearDifferent;
  String? stool;

  factory Romeiv.fromJson(Map<String, dynamic> json) => Romeiv(
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

class Results {
  Results({
    this.romeiv,
  });

  String? romeiv;

  factory Results.fromJson(Map<String, dynamic> json) => Results(
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

  List<dynamic>? breakfast;
  List<dynamic>? lunch;
  List<dynamic>? dinner;
  List<dynamic>? snacks;
  List<dynamic>? relaxationTechniques;
  List<dynamic>? prescriptionMedications;
  List<dynamic>? otherMedications;

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
        "breakfast": List<dynamic>.from(breakfast!.map((x) => x)),
        "lunch": List<dynamic>.from(lunch!.map((x) => x)),
        "dinner": List<dynamic>.from(dinner!.map((x) => x)),
        "snacks": List<dynamic>.from(snacks!.map((x) => x)),
        "relaxationTechniques":
            List<dynamic>.from(relaxationTechniques!.map((x) => x)),
        "prescriptionMedications":
            List<dynamic>.from(prescriptionMedications!.map((x) => x)),
        "otherMedications": List<dynamic>.from(otherMedications!.map((x) => x)),
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

  List<String>? symptoms;
  List<String>? bowelMovements;
  List<dynamic>? medications;
  List<dynamic>? healthWelleness;
  List<dynamic>? foods;

  factory Tracking.fromJson(Map<String, dynamic> json) => Tracking(
        symptoms: List<String>.from(json["symptoms"].map((x) => x)),
        bowelMovements: List<String>.from(json["bowelMovements"].map((x) => x)),
        medications: List<dynamic>.from(json["medications"].map((x) => x)),
        healthWelleness:
            List<dynamic>.from(json["healthWelleness"].map((x) => x)),
        foods: List<dynamic>.from(json["foods"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "symptoms": List<dynamic>.from(symptoms!.map((x) => x)),
        "bowelMovements": List<dynamic>.from(bowelMovements!.map((x) => x)),
        "medications": List<dynamic>.from(medications!.map((x) => x)),
        "healthWelleness": List<dynamic>.from(healthWelleness!.map((x) => x)),
        "foods": List<dynamic>.from(foods!.map((x) => x)),
      };
}
