// To parse this JSON data, do
//
//     final loginResponseModel = loginResponseModelFromJson(jsonString);

import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) =>
    json.encode(data.toJson());

class LoginResponseModel {
  LoginResponseModel({
    this.id,
    this.profile,
    this.tags,
    this.label,
    this.email,
    this.agreeTos,
    this.tracking,
    this.loginId,
    this.results,
    this.treatmentPlans,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String id;
  Profile profile;
  Tags tags;
  dynamic label;
  String email;
  bool agreeTos;
  Tracking tracking;
  String loginId;
  Results results;
  List<dynamic> treatmentPlans;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        id: json["_id"] == null ? null : json["_id"],
        profile:
            json["profile"] == null ? null : Profile.fromJson(json["profile"]),
        tags: json["tags"] == null ? null : Tags.fromJson(json["tags"]),
        label: json["label"],
        email: json["email"] == null ? null : json["email"],
        agreeTos: json["agreeTos"] == null ? null : json["agreeTos"],
        tracking: json["tracking"] == null
            ? null
            : Tracking.fromJson(json["tracking"]),
        loginId: json["loginId"] == null ? null : json["loginId"],
        results:
            json["results"] == null ? null : Results.fromJson(json["results"]),
        treatmentPlans: json["treatmentPlans"] == null
            ? null
            : List<dynamic>.from(json["treatmentPlans"].map((x) => x)),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"] == null ? null : json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "profile": profile == null ? null : profile.toJson(),
        "tags": tags == null ? null : tags.toJson(),
        "label": label,
        "email": email == null ? null : email,
        "agreeTos": agreeTos == null ? null : agreeTos,
        "tracking": tracking == null ? null : tracking.toJson(),
        "loginId": loginId == null ? null : loginId,
        "results": results == null ? null : results.toJson(),
        "treatmentPlans": treatmentPlans == null
            ? null
            : List<dynamic>.from(treatmentPlans.map((x) => x)),
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
    this.healthWellness,
    this.foods,
  });

  List<BowelMovement> symptoms;
  List<BowelMovement> bowelMovements;
  dynamic medications;
  List<dynamic> healthWellness;
  List<dynamic> foods;

  factory Tracking.fromJson(Map<String, dynamic> json) => Tracking(
        symptoms: json["symptoms"] == null
            ? null
            : List<BowelMovement>.from(
                json["symptoms"].map((x) => BowelMovement.fromJson(x))),
        bowelMovements: json["bowelMovements"] == null
            ? null
            : List<BowelMovement>.from(
                json["bowelMovements"].map((x) => BowelMovement.fromJson(x))),
        medications: json["medications"],
        healthWellness: json["healthWellness"] == null
            ? null
            : List<dynamic>.from(json["healthWellness"].map((x) => x)),
        foods: json["foods"] == null
            ? null
            : List<dynamic>.from(json["foods"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "symptoms": symptoms == null
            ? null
            : List<dynamic>.from(symptoms.map((x) => x.toJson())),
        "bowelMovements": bowelMovements == null
            ? null
            : List<dynamic>.from(bowelMovements.map((x) => x.toJson())),
        "medications": medications,
        "healthWellness": healthWellness == null
            ? null
            : List<dynamic>.from(healthWellness.map((x) => x)),
        "foods": foods == null ? null : List<dynamic>.from(foods.map((x) => x)),
      };
}

class BowelMovement {
  BowelMovement({
    this.required,
    this.userAdded,
    this.id,
    this.tid,
    this.category,
  });

  bool required;
  bool userAdded;
  String id;
  String tid;
  Category category;

  factory BowelMovement.fromJson(Map<String, dynamic> json) => BowelMovement(
        required: json["required"] == null ? null : json["required"],
        userAdded: json["userAdded"] == null ? null : json["userAdded"],
        id: json["_id"] == null ? null : json["_id"],
        tid: json["tid"] == null ? null : json["tid"],
        category: json["category"] == null
            ? null
            : categoryValues.map[json["category"]],
      );

  Map<String, dynamic> toJson() => {
        "required": required == null ? null : required,
        "userAdded": userAdded == null ? null : userAdded,
        "_id": id == null ? null : id,
        "tid": tid == null ? null : tid,
        "category": category == null ? null : categoryValues.reverse[category],
      };
}

enum Category { MEDICATIONS, SYMPTOMS }

final categoryValues = EnumValues(
    {"medications": Category.MEDICATIONS, "symptoms": Category.SYMPTOMS});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
