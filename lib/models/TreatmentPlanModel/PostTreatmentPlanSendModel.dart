// To parse this JSON data, do
//
//     final postTreatmentPlanSendModel = postTreatmentPlanSendModelFromJson(jsonString);

import 'dart:convert';

class PostTreatmentPlanSendModel {
  PostTreatmentPlanSendModel({
    this.pid,
    this.category,
    this.trackingDefaults,
    this.tags,
    this.reminders,
  });

  String pid;
  String category;
  List<dynamic> trackingDefaults;
  List<Tag> tags;
  List<Reminder> reminders;

  factory PostTreatmentPlanSendModel.fromRawJson(String str) =>
      PostTreatmentPlanSendModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PostTreatmentPlanSendModel.fromJson(Map<String, dynamic> json) =>
      PostTreatmentPlanSendModel(
        pid: json["pid"] == null ? null : json["pid"],
        category: json["category"] == null ? null : json["category"],
        trackingDefaults: json["trackingDefaults"] == null
            ? null
            : List<dynamic>.from(json["trackingDefaults"].map((x) => x)),
        tags: json["tags"] == null
            ? null
            : List<Tag>.from(json["tags"].map((x) => Tag.fromJson(x))),
        reminders: json["reminders"] == null
            ? null
            : List<Reminder>.from(
                json["reminders"].map((x) => Reminder.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pid": pid == null ? null : pid,
        "category": category == null ? null : category,
        "trackingDefaults": trackingDefaults == null
            ? null
            : List<dynamic>.from(trackingDefaults.map((x) => x)),
        "tags": tags == null
            ? null
            : List<dynamic>.from(tags.map((x) => x.toJson())),
        "reminders": reminders == null
            ? null
            : List<dynamic>.from(reminders.map((x) => x.toJson())),
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

  factory Reminder.fromRawJson(String str) =>
      Reminder.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

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

class Tag {
  Tag({
    this.category,
    this.value,
    this.required,
  });

  String category;
  String value;
  String required;

  factory Tag.fromRawJson(String str) => Tag.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
        category: json["category"] == null ? null : json["category"],
        value: json["value"] == null ? null : json["value"],
        required: json["required"] == null ? null : json["required"],
      );

  Map<String, dynamic> toJson() => {
        "category": category == null ? null : category,
        "value": value == null ? null : value,
        "required": required == null ? null : required,
      };
}
