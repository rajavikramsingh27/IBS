// To parse this JSON data, do
//
//     final signupResponseModel = signupResponseModelFromJson(jsonString);

import 'dart:convert';

SignupResponseModel signupResponseModelFromJson(String str) =>
    SignupResponseModel.fromJson(json.decode(str));

String signupResponseModelToJson(SignupResponseModel data) =>
    json.encode(data.toJson());

class SignupResponseModel {
  SignupResponseModel({
    this.profile,
    this.tracking,
    this.tags,
    this.treatmentPlans,
    this.id,
    this.email,
    this.agreeTos,
    this.loginId,
    this.results,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  Profile profile;
  Tracking tracking;
  Tags tags;
  List<dynamic> treatmentPlans;
  String id;
  String email;
  bool agreeTos;
  String loginId;
  Results results;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory SignupResponseModel.fromJson(Map<String, dynamic> json) =>
      SignupResponseModel(
        profile:
            json["profile"] == null ? null : Profile?.fromJson(json["profile"]),
        tracking: json["tracking"] == null
            ? null
            : Tracking.fromJson(json["tracking"]),
        tags: json["tags"] == null ? null : Tags.fromJson(json["tags"]),
        treatmentPlans: json["treatmentPlans"] == null
            ? null
            : List<dynamic>.from(json["treatmentPlans"].map((x) => x)),
        id: json["_id"] == null ? null : json["_id"],
        email: json["email"] == null ? null : json["email"],
        agreeTos: json["agreeTos"] == null ? null : json["agreeTos"],
        loginId: json["loginId"] == null ? null : json["loginId"],
        results:
            json["results"] == null ? null : Results.fromJson(json["results"]),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"] == null ? null : json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "profile": profile == null ? null : profile.toJson(),
        "tracking": tracking == null ? null : tracking.toJson(),
        "tags": tags == null ? null : tags.toJson(),
        "treatmentPlans": treatmentPlans == null
            ? null
            : List<dynamic>.from(treatmentPlans.map((x) => x)),
        "_id": id == null ? null : id,
        "email": email == null ? null : email,
        "agreeTos": agreeTos == null ? null : agreeTos,
        "loginId": loginId == null ? null : loginId,
        "results": results == null ? null : results.toJson(),
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "__v": v == null ? null : v,
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

  Romeiv romeiv;
  String sex;
  String age;
  String familyHistory;
  DiagnosedIbs diagnosedIbs;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        romeiv: json["romeiv"] == null ? null : Romeiv.fromJson(json["romeiv"]),
        sex: json["sex"] == null ? null : json["sex"],
        age: json["age"] == null ? null : json["age"],
        familyHistory:
            json["familyHistory"] == null ? null : json["familyHistory"],
        diagnosedIbs: json["diagnosedIbs"] == null
            ? null
            : DiagnosedIbs.fromJson(json["diagnosedIbs"]),
      );

  Map<String, dynamic> toJson() => {
        "romeiv": romeiv == null ? null : romeiv.toJson(),
        "sex": sex == null ? null : sex,
        "age": age == null ? null : age,
        "familyHistory": familyHistory == null ? null : familyHistory,
        "diagnosedIbs": diagnosedIbs == null ? null : diagnosedIbs.toJson(),
      };
}

class DiagnosedIbs {
  DiagnosedIbs({
    this.isDiagnosed,
    this.id,
    this.ibsType,
  });

  bool isDiagnosed;
  String id;
  String ibsType;

  factory DiagnosedIbs.fromJson(Map<String, dynamic> json) => DiagnosedIbs(
        isDiagnosed: json["isDiagnosed"] == null ? null : json["isDiagnosed"],
        id: json["_id"] == null ? null : json["_id"],
        ibsType: json["ibsType"] == null ? null : json["ibsType"],
      );

  Map<String, dynamic> toJson() => {
        "isDiagnosed": isDiagnosed == null ? null : isDiagnosed,
        "_id": id == null ? null : id,
        "ibsType": ibsType == null ? null : ibsType,
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

  bool abdominalPain;
  bool abdominalPainTimeBowel;
  bool abdominalPainBowelMoreLess;
  bool abdominalPainBowelAppearDifferent;
  String stool;

  factory Romeiv.fromJson(Map<String, dynamic> json) => Romeiv(
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

class Results {
  Results({
    this.romeiv,
  });

  String romeiv;

  factory Results.fromJson(Map<String, dynamic> json) => Results(
        romeiv: json["romeiv"] == null ? null : json["romeiv"],
      );

  Map<String, dynamic> toJson() => {
        "romeiv": romeiv == null ? null : romeiv,
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
        breakfast: json["breakfast"] == null
            ? null
            : List<dynamic>.from(json["breakfast"].map((x) => x)),
        lunch: json["lunch"] == null
            ? null
            : List<dynamic>.from(json["lunch"].map((x) => x)),
        dinner: json["dinner"] == null
            ? null
            : List<dynamic>.from(json["dinner"].map((x) => x)),
        snacks: json["snacks"] == null
            ? null
            : List<dynamic>.from(json["snacks"].map((x) => x)),
        relaxationTechniques: json["relaxationTechniques"] == null
            ? null
            : List<dynamic>.from(json["relaxationTechniques"].map((x) => x)),
        prescriptionMedications: json["prescriptionMedications"] == null
            ? null
            : List<dynamic>.from(json["prescriptionMedications"].map((x) => x)),
        otherMedications: json["otherMedications"] == null
            ? null
            : List<dynamic>.from(json["otherMedications"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "breakfast": breakfast == null
            ? null
            : List<dynamic>.from(breakfast.map((x) => x)),
        "lunch": lunch == null ? null : List<dynamic>.from(lunch.map((x) => x)),
        "dinner":
            dinner == null ? null : List<dynamic>.from(dinner.map((x) => x)),
        "snacks":
            snacks == null ? null : List<dynamic>.from(snacks.map((x) => x)),
        "relaxationTechniques": relaxationTechniques == null
            ? null
            : List<dynamic>.from(relaxationTechniques.map((x) => x)),
        "prescriptionMedications": prescriptionMedications == null
            ? null
            : List<dynamic>.from(prescriptionMedications.map((x) => x)),
        "otherMedications": otherMedications == null
            ? null
            : List<dynamic>.from(otherMedications.map((x) => x)),
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

  List<dynamic> symptoms;
  List<dynamic> bowelMovements;
  List<dynamic> medications;
  List<dynamic> healthWelleness;
  List<dynamic> foods;

  factory Tracking.fromJson(Map<String, dynamic> json) => Tracking(
        symptoms: json["symptoms"] == null
            ? null
            : List<dynamic>.from(json["symptoms"].map((x) => x)),
        bowelMovements: json["bowelMovements"] == null
            ? null
            : List<dynamic>.from(json["bowelMovements"].map((x) => x)),
        medications: json["medications"] == null
            ? null
            : List<dynamic>.from(json["medications"].map((x) => x)),
        healthWelleness: json["healthWelleness"] == null
            ? null
            : List<dynamic>.from(json["healthWelleness"].map((x) => x)),
        foods: json["foods"] == null
            ? null
            : List<dynamic>.from(json["foods"].map((x) => x)),
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
      };
}
