// To parse this JSON data, do
//
//     final loginResponseModel = loginResponseModelFromJson(jsonString);

import 'dart:convert';

class LoginResponseModel {
  LoginResponseModel({
    this.accessToken,
    this.authentication,
    this.user,
  });

  String accessToken;
  Authentication authentication;
  User user;

  factory LoginResponseModel.fromRawJson(String str) =>
      LoginResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        accessToken: json["accessToken"] == null ? null : json["accessToken"],
        authentication: json["authentication"] == null
            ? null
            : Authentication.fromJson(json["authentication"]),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "accessToken": accessToken == null ? null : accessToken,
        "authentication":
            authentication == null ? null : authentication.toJson(),
        "user": user == null ? null : user.toJson(),
      };
}

class Authentication {
  Authentication({
    this.strategy,
    this.accessToken,
    this.payload,
  });

  String strategy;
  String accessToken;
  Payload payload;

  factory Authentication.fromRawJson(String str) =>
      Authentication.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Authentication.fromJson(Map<String, dynamic> json) => Authentication(
        strategy: json["strategy"] == null ? null : json["strategy"],
        accessToken: json["accessToken"] == null ? null : json["accessToken"],
        payload:
            json["payload"] == null ? null : Payload.fromJson(json["payload"]),
      );

  Map<String, dynamic> toJson() => {
        "strategy": strategy == null ? null : strategy,
        "accessToken": accessToken == null ? null : accessToken,
        "payload": payload == null ? null : payload.toJson(),
      };
}

class Payload {
  Payload({
    this.iat,
    this.exp,
    this.aud,
    this.iss,
    this.sub,
    this.jti,
  });

  int iat;
  int exp;
  String aud;
  String iss;
  String sub;
  String jti;

  factory Payload.fromRawJson(String str) => Payload.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        iat: json["iat"] == null ? null : json["iat"],
        exp: json["exp"] == null ? null : json["exp"],
        aud: json["aud"] == null ? null : json["aud"],
        iss: json["iss"] == null ? null : json["iss"],
        sub: json["sub"] == null ? null : json["sub"],
        jti: json["jti"] == null ? null : json["jti"],
      );

  Map<String, dynamic> toJson() => {
        "iat": iat == null ? null : iat,
        "exp": exp == null ? null : exp,
        "aud": aud == null ? null : aud,
        "iss": iss == null ? null : iss,
        "sub": sub == null ? null : sub,
        "jti": jti == null ? null : jti,
      };
}

class User {
  User({
    this.id,
    this.profile,
    this.tags,
    this.treatmentPlans,
    this.email,
    this.agreeTos,
    this.tracking,
    this.loginId,
    this.results,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String id;
  Profile profile;
  Tags tags;
  List<dynamic> treatmentPlans;
  String email;
  bool agreeTos;
  Tracking tracking;
  String loginId;
  Results results;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"] == null ? null : json["_id"],
        profile:
            json["profile"] == null ? null : Profile.fromJson(json["profile"]),
        tags: json["tags"] == null ? null : Tags.fromJson(json["tags"]),
        treatmentPlans: json["treatmentPlans"] == null
            ? null
            : List<dynamic>.from(json["treatmentPlans"].map((x) => x)),
        email: json["email"] == null ? null : json["email"],
        agreeTos: json["agreeTos"] == null ? null : json["agreeTos"],
        tracking: json["tracking"] == null
            ? null
            : Tracking.fromJson(json["tracking"]),
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
        "_id": id == null ? null : id,
        "profile": profile == null ? null : profile.toJson(),
        "tags": tags == null ? null : tags.toJson(),
        "treatmentPlans": treatmentPlans == null
            ? null
            : List<dynamic>.from(treatmentPlans.map((x) => x)),
        "email": email == null ? null : email,
        "agreeTos": agreeTos == null ? null : agreeTos,
        "tracking": tracking == null ? null : tracking.toJson(),
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

  factory Profile.fromRawJson(String str) => Profile.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

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

  factory DiagnosedIbs.fromRawJson(String str) =>
      DiagnosedIbs.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

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

  factory Romeiv.fromRawJson(String str) => Romeiv.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

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

  factory Results.fromRawJson(String str) => Results.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

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

  factory Tags.fromRawJson(String str) => Tags.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

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

  List<Symptom> symptoms;
  List<dynamic> bowelMovements;
  List<dynamic> medications;
  List<dynamic> healthWelleness;
  List<dynamic> foods;

  factory Tracking.fromRawJson(String str) =>
      Tracking.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Tracking.fromJson(Map<String, dynamic> json) => Tracking(
        symptoms: json["symptoms"] == null
            ? null
            : List<Symptom>.from(
                json["symptoms"].map((x) => Symptom.fromJson(x))),
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
            : List<dynamic>.from(symptoms.map((x) => x.toJson())),
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

class Symptom {
  Symptom({
    this.required,
    this.id,
    this.tid,
  });

  bool required;
  String id;
  String tid;

  factory Symptom.fromRawJson(String str) => Symptom.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Symptom.fromJson(Map<String, dynamic> json) => Symptom(
        required: json["required"] == null ? null : json["required"],
        id: json["_id"] == null ? null : json["_id"],
        tid: json["tid"] == null ? null : json["tid"],
      );

  Map<String, dynamic> toJson() => {
        "required": required == null ? null : required,
        "_id": id == null ? null : id,
        "tid": tid == null ? null : tid,
      };
}
