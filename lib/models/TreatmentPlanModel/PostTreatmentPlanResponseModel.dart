// To parse this JSON data, do
//
//     final postTreatmentPlanResponseModel = postTreatmentPlanResponseModelFromJson(jsonString);

import 'dart:convert';

class PostTreatmentPlanResponseModel {
  PostTreatmentPlanResponseModel({
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
    this.trackingDefaults,
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
  List<TreatmentPlan> treatmentPlans;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  dynamic trackingDefaults;

  factory PostTreatmentPlanResponseModel.fromRawJson(String str) =>
      PostTreatmentPlanResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PostTreatmentPlanResponseModel.fromJson(Map<String, dynamic> json) =>
      PostTreatmentPlanResponseModel(
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
            : List<TreatmentPlan>.from(
                json["treatmentPlans"].map((x) => TreatmentPlan.fromJson(x))),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"] == null ? null : json["__v"],
        trackingDefaults: json["trackingDefaults"],
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
            : List<dynamic>.from(treatmentPlans.map((x) => x.toJson())),
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "__v": v == null ? null : v,
        "trackingDefaults": trackingDefaults,
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
  });

  List<dynamic> breakfast;
  List<dynamic> lunch;
  List<dynamic> dinner;
  List<dynamic> snacks;
  List<RelaxationTechnique> relaxationTechniques;

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
            : List<RelaxationTechnique>.from(json["relaxationTechniques"]
                .map((x) => RelaxationTechnique.fromJson(x))),
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
            : List<dynamic>.from(relaxationTechniques.map((x) => x.toJson())),
      };
}

class RelaxationTechnique {
  RelaxationTechnique({
    this.required,
    this.userAdded,
    this.id,
    this.category,
    this.value,
    this.tid,
  });

  bool required;
  bool userAdded;
  String id;
  String category;
  String value;
  String tid;

  factory RelaxationTechnique.fromRawJson(String str) =>
      RelaxationTechnique.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RelaxationTechnique.fromJson(Map<String, dynamic> json) =>
      RelaxationTechnique(
        required: json["required"] == null ? null : json["required"],
        userAdded: json["userAdded"] == null ? null : json["userAdded"],
        id: json["_id"] == null ? null : json["_id"],
        category: json["category"] == null ? null : json["category"],
        value: json["value"] == null ? null : json["value"],
        tid: json["tid"] == null ? null : json["tid"],
      );

  Map<String, dynamic> toJson() => {
        "required": required == null ? null : required,
        "userAdded": userAdded == null ? null : userAdded,
        "_id": id == null ? null : id,
        "category": category == null ? null : category,
        "value": value == null ? null : value,
        "tid": tid == null ? null : tid,
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

  List<RelaxationTechnique> symptoms;
  List<RelaxationTechnique> bowelMovements;
  dynamic medications;
  List<RelaxationTechnique> healthWellness;
  List<dynamic> foods;

  factory Tracking.fromRawJson(String str) =>
      Tracking.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Tracking.fromJson(Map<String, dynamic> json) => Tracking(
        symptoms: json["symptoms"] == null
            ? null
            : List<RelaxationTechnique>.from(
                json["symptoms"].map((x) => RelaxationTechnique.fromJson(x))),
        bowelMovements: json["bowelMovements"] == null
            ? null
            : List<RelaxationTechnique>.from(json["bowelMovements"]
                .map((x) => RelaxationTechnique.fromJson(x))),
        medications: json["medications"],
        healthWellness: json["healthWellness"] == null
            ? null
            : List<RelaxationTechnique>.from(json["healthWellness"]
                .map((x) => RelaxationTechnique.fromJson(x))),
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
            : List<dynamic>.from(healthWellness.map((x) => x.toJson())),
        "foods": foods == null ? null : List<dynamic>.from(foods.map((x) => x)),
      };
}

class TreatmentPlan {
  TreatmentPlan({
    this.id,
    this.pid,
    this.category,
    this.trackables,
    this.trackingDefaults,
    this.tags,
    this.reminders,
    this.updatedAt,
    this.createdAt,
  });

  String id;
  String pid;
  String category;
  List<RelaxationTechnique> trackables;
  List<dynamic> trackingDefaults;
  List<RelaxationTechnique> tags;
  List<ReminderResponseData> reminders;
  DateTime updatedAt;
  DateTime createdAt;

  factory TreatmentPlan.fromRawJson(String str) =>
      TreatmentPlan.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TreatmentPlan.fromJson(Map<String, dynamic> json) => TreatmentPlan(
        id: json["_id"] == null ? null : json["_id"],
        pid: json["pid"] == null ? null : json["pid"],
        category: json["category"] == null ? null : json["category"],
        trackables: json["trackables"] == null
            ? null
            : List<RelaxationTechnique>.from(
                json["trackables"].map((x) => RelaxationTechnique.fromJson(x))),
        trackingDefaults: json["trackingDefaults"] == null
            ? null
            : List<dynamic>.from(json["trackingDefaults"].map((x) => x)),
        tags: json["tags"] == null
            ? null
            : List<RelaxationTechnique>.from(
                json["tags"].map((x) => RelaxationTechnique.fromJson(x))),
        reminders: json["reminders"] == null
            ? null
            : List<ReminderResponseData>.from(
                json["reminders"].map((x) => ReminderResponseData.fromJson(x))),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "pid": pid == null ? null : pid,
        "category": category == null ? null : category,
        "trackables": trackables == null
            ? null
            : List<dynamic>.from(trackables.map((x) => x.toJson())),
        "trackingDefaults": trackingDefaults == null
            ? null
            : List<dynamic>.from(trackingDefaults.map((x) => x)),
        "tags": tags == null
            ? null
            : List<dynamic>.from(tags.map((x) => x.toJson())),
        "reminders": reminders == null
            ? null
            : List<dynamic>.from(reminders.map((x) => x.toJson())),
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
      };
}

class ReminderResponseData {
  ReminderResponseData({
    this.id,
    this.day,
    this.hour,
    this.minute,
    this.message,
    this.enabled,
  });

  String id;
  String day;
  int hour;
  int minute;
  String message;
  bool enabled;

  factory ReminderResponseData.fromRawJson(String str) =>
      ReminderResponseData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ReminderResponseData.fromJson(Map<String, dynamic> json) => ReminderResponseData(
        id: json["_id"] == null ? null : json["_id"],
        day: json["day"] == null ? null : json["day"],
        hour: json["hour"] == null ? null : json["hour"],
        minute: json["minute"] == null ? null : json["minute"],
        message: json["message"] == null ? null : json["message"],
        enabled: json["enabled"] == null ? null : json["enabled"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "day": day == null ? null : day,
        "hour": hour == null ? null : hour,
        "minute": minute == null ? null : minute,
        "message": message == null ? null : message,
        "enabled": enabled == null ? null : enabled,
      };
}
