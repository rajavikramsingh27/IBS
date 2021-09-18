
import 'dart:convert';

MyAccountModel myAccountModelFromJson(String str) => MyAccountModel.fromJson(json.decode(str));

String myAccountModelToJson(MyAccountModel data) => json.encode(data.toJson());

class MyAccountModel {
  MyAccountModel({
    this.id,
    this.profile,
    this.tags,
    this.trackingDefaults,
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
  Tracking trackingDefaults;
  String label;
  String email;
  bool agreeTos;
  Tracking tracking;
  String loginId;
  Results results;
  List<dynamic> treatmentPlans;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory MyAccountModel.fromJson(Map<String, dynamic> json) => MyAccountModel(
    id: json["_id"],
    profile: Profile.fromJson(json["profile"]),
    tags: Tags.fromJson(json["tags"]),
    trackingDefaults: Tracking.fromJson(json["trackingDefaults"]),
    label: json["label"],
    email: json["email"],
    agreeTos: json["agreeTos"],
    tracking: Tracking.fromJson(json["tracking"]),
    loginId: json["loginId"],
    results: Results.fromJson(json["results"]),
    treatmentPlans: List<dynamic>.from(json["treatmentPlans"].map((x) => x)),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "profile": profile.toJson(),
    "tags": tags.toJson(),
    "trackingDefaults": trackingDefaults.toJson(),
    "label": label,
    "email": email,
    "agreeTos": agreeTos,
    "tracking": tracking.toJson(),
    "loginId": loginId,
    "results": results.toJson(),
    "treatmentPlans": List<dynamic>.from(treatmentPlans.map((x) => x)),
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}

class Profile {
  Profile({
    this.sex,
    this.age,
    this.familyHistory,
    this.diagnosedIbs,
    this.romeiv,
  });

  String sex;
  String age;
  String familyHistory;
  DiagnosedIbs diagnosedIbs;
  Romeiv romeiv;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
    sex: json["sex"],
    age: json["age"],
    familyHistory: json["familyHistory"],
    diagnosedIbs: DiagnosedIbs.fromJson(json["diagnosedIbs"]),
    romeiv: Romeiv.fromJson(json["romeiv"]),
  );

  Map<String, dynamic> toJson() => {
    "sex": sex,
    "age": age,
    "familyHistory": familyHistory,
    "diagnosedIbs": diagnosedIbs.toJson(),
    "romeiv": romeiv.toJson(),
  };
}

class DiagnosedIbs {
  DiagnosedIbs({
    this.isDiagnosed,
    // this.id,
    this.ibsType,
  });

  bool isDiagnosed;
  // String id;
  String ibsType;

  factory DiagnosedIbs.fromJson(Map<String, dynamic> json) => DiagnosedIbs(
    isDiagnosed: json["isDiagnosed"],
    // id: json["_id"],
    ibsType: json["ibsType"],
  );

  Map<String, dynamic> toJson() => {
    "isDiagnosed": isDiagnosed,
    // "_id": id,
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

  bool abdominalPain;
  bool abdominalPainTimeBowel;
  bool abdominalPainBowelMoreLess;
  bool abdominalPainBowelAppearDifferent;
  String stool;

  factory Romeiv.fromJson(Map<String, dynamic> json) => Romeiv(
    abdominalPain: json["abdominalPain"],
    abdominalPainTimeBowel: json["abdominalPainTimeBowel"],
    abdominalPainBowelMoreLess: json["abdominalPainBowelMoreLess"],
    abdominalPainBowelAppearDifferent: json["abdominalPainBowelAppearDifferent"],
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

  String romeiv;

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
    this.medicationsPrescription,
    this.medicationsOther,
  });

  List<dynamic> breakfast;
  List<dynamic> lunch;
  List<dynamic> dinner;
  List<dynamic> snacks;
  List<dynamic> relaxationTechniques;
  List<dynamic> medicationsPrescription;
  List<dynamic> medicationsOther;

  factory Tags.fromJson(Map<String, dynamic> json) => Tags(
    breakfast: List<dynamic>.from(json["breakfast"].map((x) => x)),
    lunch: List<dynamic>.from(json["lunch"].map((x) => x)),
    dinner: List<dynamic>.from(json["dinner"].map((x) => x)),
    snacks: List<dynamic>.from(json["snacks"].map((x) => x)),
    relaxationTechniques: List<dynamic>.from(json["relaxationTechniques"].map((x) => x)),
    medicationsPrescription: List<dynamic>.from(json["medicationsPrescription"].map((x) => x)),
    medicationsOther: List<dynamic>.from(json["medicationsOther"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "breakfast": List<dynamic>.from(breakfast.map((x) => x)),
    "lunch": List<dynamic>.from(lunch.map((x) => x)),
    "dinner": List<dynamic>.from(dinner.map((x) => x)),
    "snacks": List<dynamic>.from(snacks.map((x) => x)),
    "relaxationTechniques": List<dynamic>.from(relaxationTechniques.map((x) => x)),
    "medicationsPrescription": List<dynamic>.from(medicationsPrescription.map((x) => x)),
    "medicationsOther": List<dynamic>.from(medicationsOther.map((x) => x)),
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

  List<dynamic> symptoms;
  List<dynamic> bowelMovements;
  List<dynamic> medications;
  List<dynamic> healthWellness;
  List<dynamic> foods;

  factory Tracking.fromJson(Map<String, dynamic> json) => Tracking(
    symptoms: List<dynamic>.from(json["symptoms"].map((x) => x)),
    bowelMovements: List<dynamic>.from(json["bowelMovements"].map((x) => x)),
    medications: json["medications"] == null ? null : List<dynamic>.from(json["medications"].map((x) => x)),
    healthWellness: List<dynamic>.from(json["healthWellness"].map((x) => x)),
    foods: List<dynamic>.from(json["foods"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "symptoms": List<dynamic>.from(symptoms.map((x) => x)),
    "bowelMovements": List<dynamic>.from(bowelMovements.map((x) => x)),
    "medications": medications == null ? null : List<dynamic>.from(medications.map((x) => x)),
    "healthWellness": List<dynamic>.from(healthWellness.map((x) => x)),
    "foods": List<dynamic>.from(foods.map((x) => x)),
  };
}
