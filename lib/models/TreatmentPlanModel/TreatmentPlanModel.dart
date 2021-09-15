// To parse this JSON data, do
//
//     final treatmentPlanModel = treatmentPlanModelFromJson(jsonString);

import 'dart:convert';

TreatmentPlanModel treatmentPlanModelFromJson(String str) => TreatmentPlanModel.fromJson(json.decode(str));

String treatmentPlanModelToJson(TreatmentPlanModel data) => json.encode(data.toJson());

class TreatmentPlanModel {
  TreatmentPlanModel({
    this.pid,
    this.category,
    this.trackingDefaults,
    this.tags,
    this.reminders,
  });

  String pid;
  String category;
  List<TrackingDefault> trackingDefaults;
  List<dynamic> tags;
  List<Reminder> reminders;

  factory TreatmentPlanModel.fromJson(Map<String, dynamic> json) => TreatmentPlanModel(
    pid: json["pid"] == null ? null : json["pid"],
    category: json["category"] == null ? null : json["category"],
    trackingDefaults: json["trackingDefaults"] == null ? null : List<TrackingDefault>.from(json["trackingDefaults"].map((x) => TrackingDefault.fromJson(x))),
    tags: json["tags"] == null ? null : List<dynamic>.from(json["tags"].map((x) => x)),
    reminders: json["reminders"] == null ? null : List<Reminder>.from(json["reminders"].map((x) => Reminder.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "pid": pid == null ? null : pid,
    "category": category == null ? null : category,
    "trackingDefaults": trackingDefaults == null ? null : List<dynamic>.from(trackingDefaults.map((x) => x.toJson())),
    "tags": tags == null ? null : List<dynamic>.from(tags.map((x) => x)),
    "reminders": reminders == null ? null : List<dynamic>.from(reminders.map((x) => x.toJson())),
  };
}

class Reminder {
  Reminder({
    this.day,
    this.hour,
    this.minute,
    this.message,
    this.enabled,
  });

  String day;
  int hour;
  int minute;
  String message;
  bool enabled;

  factory Reminder.fromJson(Map<String, dynamic> json) => Reminder(
    day: json["day"] == null ? null : json["day"],
    hour: json["hour"] == null ? null : json["hour"],
    minute: json["minute"] == null ? null : json["minute"],
    message: json["message"] == null ? null : json["message"],
    enabled: json["enabled"] == null ? null : json["enabled"],
  );

  Map<String, dynamic> toJson() => {
    "day": day == null ? null : day,
    "hour": hour == null ? null : hour,
    "minute": minute == null ? null : minute,
    "message": message == null ? null : message,
    "enabled": enabled == null ? null : enabled,
  };
}

class TrackingDefault {
  TrackingDefault({
    this.tid,
    this.category,
    this.kind,
    this.dtype,
    this.value,
  });

  String tid;
  String category;
  String kind;
  String dtype;
  Value value;

  factory TrackingDefault.fromJson(Map<String, dynamic> json) => TrackingDefault(
    tid: json["tid"] == null ? null : json["tid"],
    category: json["category"] == null ? null : json["category"],
    kind: json["kind"] == null ? null : json["kind"],
    dtype: json["dtype"] == null ? null : json["dtype"],
    value: json["value"] == null ? null : Value.fromJson(json["value"]),
  );

  Map<String, dynamic> toJson() => {
    "tid": tid == null ? null : tid,
    "category": category == null ? null : category,
    "kind": kind == null ? null : kind,
    "dtype": dtype == null ? null : dtype,
    "value": value == null ? null : value.toJson(),
  };
}

class Value {
  Value({
    this.str,
    this.arr,
  });

  String str;
  String arr;

  factory Value.fromJson(Map<String, dynamic> json) => Value(
    str: json["str"] == null ? null : json["str"],
    arr: json["arr"] == null ? null : json["arr"],
  );

  Map<String, dynamic> toJson() => {
    "str": str == null ? null : str,
    "arr": arr == null ? null : arr,
  };
}
