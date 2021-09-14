// To parse this JSON data, do
//
//     final treatmentPlanResponseModel = treatmentPlanResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:flutter_ibs/services/url.dart';

import 'TrackablesListModel/TrackablesListModel.dart';

class TreatmentPlanResponseModel {
  TreatmentPlanResponseModel({
    this.total,
    this.limit,
    this.skip,
    this.data,
  });

  int total;
  int limit;
  int skip;
  List<TreatmentPlanItemData> data;

  factory TreatmentPlanResponseModel.fromRawJson(String str) =>
      TreatmentPlanResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TreatmentPlanResponseModel.fromJson(Map<String, dynamic> json) =>
      TreatmentPlanResponseModel(
        total: json["total"] == null ? null : json["total"],
        limit: json["limit"] == null ? null : json["limit"],
        skip: json["skip"] == null ? null : json["skip"],
        data: json["data"] == null
            ? null
            : List<TreatmentPlanItemData>.from(
                json["data"].map((x) => TreatmentPlanItemData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total == null ? null : total,
        "limit": limit == null ? null : limit,
        "skip": skip == null ? null : skip,
        "data": data == null
            ? null
            : List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class TreatmentPlanItemData {
  TreatmentPlanItemData({
    this.id,
    this.pid,
    this.service,
    this.kind,
    this.category,
    this.planName,
    this.planDescription,
    this.image,
    this.startButton,
    this.planDetails,
    this.trackables,
    this.reminders,
    this.additionalResourcesButton,
    this.additionalResources,
    this.version,
    this.enabled,
  });

  String id;
  String pid;
  String service;
  String kind;
  String category;
  String planName;
  String planDescription;
  DatumImage image;
  String startButton;
  PlanDetails planDetails;
  List<Trackable> trackables;
  Reminders reminders;
  String additionalResourcesButton;
  List<PlanDetails> additionalResources;
  int version;
  bool enabled;

  factory TreatmentPlanItemData.fromRawJson(String str) =>
      TreatmentPlanItemData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TreatmentPlanItemData.fromJson(Map<String, dynamic> json) =>
      TreatmentPlanItemData(
        id: json["_id"] == null ? null : json["_id"],
        pid: json["pid"] == null ? null : json["pid"],
        service: json["service"] == null ? null : json["service"],
        kind: json["kind"] == null ? null : json["kind"],
        category: json["category"] == null ? null : json["category"],
        planName: json["planName"] == null ? null : json["planName"],
        planDescription:
            json["planDescription"] == null ? null : json["planDescription"],
        image:
            json["image"] == null ? null : DatumImage.fromJson(json["image"]),
        startButton: json["startButton"] == null ? null : json["startButton"],
        planDetails: json["planDetails"] == null
            ? null
            : PlanDetails.fromJson(json["planDetails"]),
        trackables: json["trackables"] == null
            ? null
            : List<Trackable>.from(
                json["trackables"].map((x) => Trackable.fromJson(x))),
        reminders: json["reminders"] == null
            ? null
            : Reminders.fromJson(json["reminders"]),
        additionalResourcesButton: json["additionalResourcesButton"] == null
            ? null
            : json["additionalResourcesButton"],
        additionalResources: json["additionalResources"] == null
            ? null
            : List<PlanDetails>.from(json["additionalResources"]
                .map((x) => PlanDetails.fromJson(x))),
        version: json["version"] == null ? null : json["version"],
        enabled: json["enabled"] == null ? null : json["enabled"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "pid": pid == null ? null : pid,
        "service": service == null ? null : service,
        "kind": kind == null ? null : kind,
        "category": category == null ? null : category,
        "planName": planName == null ? null : planName,
        "planDescription": planDescription == null ? null : planDescription,
        "image": image == null ? null : image.toJson(),
        "startButton": startButton == null ? null : startButton,
        "planDetails": planDetails == null ? null : planDetails.toJson(),
        "trackables": trackables == null
            ? null
            : List<dynamic>.from(trackables.map((x) => x.toJson())),
        "reminders": reminders == null ? null : reminders.toJson(),
        "additionalResourcesButton": additionalResourcesButton == null
            ? null
            : additionalResourcesButton,
        "additionalResources": additionalResources == null
            ? null
            : List<dynamic>.from(additionalResources.map((x) => x.toJson())),
        "version": version == null ? null : version,
        "enabled": enabled == null ? null : enabled,
      };
}

class PlanDetails {
  PlanDetails({
    this.name,
    this.details,
  });

  String name;
  List<Detail> details;

  factory PlanDetails.fromRawJson(String str) =>
      PlanDetails.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PlanDetails.fromJson(Map<String, dynamic> json) => PlanDetails(
        name: json["name"] == null ? null : json["name"],
        details: json["details"] == null
            ? null
            : List<Detail>.from(json["details"].map((x) => Detail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "details": details == null
            ? null
            : List<dynamic>.from(details.map((x) => x.toJson())),
      };
}

class Detail {
  Detail({
    this.image,
    this.heading,
    this.body,
  });

  DetailImage image;
  String heading;
  String body;

  factory Detail.fromRawJson(String str) => Detail.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        image:
            json["image"] == null ? null : DetailImage.fromJson(json["image"]),
        heading: json["heading"] == null ? null : json["heading"],
        body: json["body"] == null ? null : json["body"],
      );

  Map<String, dynamic> toJson() => {
        "image": image == null ? null : image.toJson(),
        "heading": heading == null ? null : heading,
        "body": body == null ? null : body,
      };
}

class DetailImage {
  DetailImage({
    this.filename,
  });

  String filename;

  factory DetailImage.fromRawJson(String str) =>
      DetailImage.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DetailImage.fromJson(Map<String, dynamic> json) => DetailImage(
        filename: json["filename"] == null
            ? BLANK_PLACEHOLDER
            : "$BASE_URL/${json["filename"]}",
      );

  Map<String, dynamic> toJson() => {
        "filename": filename == null ? null : filename,
      };
}

class DatumImage {
  DatumImage({
    this.normal,
    this.active,
  });

  String normal;
  String active;

  factory DatumImage.fromRawJson(String str) =>
      DatumImage.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DatumImage.fromJson(Map<String, dynamic> json) => DatumImage(
        normal: json["normal"] == null
            ? BLANK_PLACEHOLDER
            : "$BASE_URL/${json["normal"]}",
        active: json["active"] == null
            ? BLANK_PLACEHOLDER
            : "$BASE_URL/${json["active"]}",
      );

  Map<String, dynamic> toJson() => {
        "normal": normal == null ? null : normal,
        "active": active == null ? null : active,
      };
}

class Reminders {
  Reminders({
    this.tid,
    this.name,
    this.description,
    this.category,
    this.style,
    this.kind,
    this.children,
  });

  String tid;
  String name;
  String description;
  String category;
  Style style;
  String kind;
  List<Trackable> children;

  factory Reminders.fromRawJson(String str) =>
      Reminders.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Reminders.fromJson(Map<String, dynamic> json) => Reminders(
        tid: json["tid"] == null ? null : json["tid"],
        name: json["name"] == null ? null : json["name"],
        description: json["description"] == null ? null : json["description"],
        category: json["category"] == null ? null : json["category"],
        style: json["style"] == null ? null : styleValues.map[json["style"]],
        kind: json["kind"] == null ? null : json["kind"],
        children: json["children"] == null
            ? null
            : List<Trackable>.from(
                json["children"].map((x) => Trackable.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "tid": tid == null ? null : tid,
        "name": name == null ? null : name,
        "description": description == null ? null : description,
        "category": category == null ? null : category,
        "style": style == null ? null : styleValues.reverse[style],
        "kind": kind == null ? null : kind,
        "children": children == null
            ? null
            : List<dynamic>.from(children.map((x) => x.toJson())),
      };
}

class Trackable {
  Trackable({
    this.tid,
    this.name,
    this.description,
    this.category,
    this.style,
    this.kind,
    this.select,
    this.enabledDefault,
    this.timePicker,
    this.textInput,
    this.tags,
    this.children,
    this.rating,
  });

  String tid;
  String name;
  String description;
  String category;
  Style style;
  String kind;
  Select select;
  bool enabledDefault;
  TimePicker timePicker;
  TextInput textInput;
  Tags tags;
  List<dynamic> children;
  Rating rating;

  factory Trackable.fromRawJson(String str) =>
      Trackable.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Trackable.fromJson(Map<String, dynamic> json) => Trackable(
        tid: json["tid"] == null ? null : json["tid"],
        name: json["name"] == null ? null : json["name"],
        description: json["description"] == null ? null : json["description"],
        category: json["category"] == null ? null : json["category"],
        style: json["style"] == null ? null : styleValues.map[json["style"]],
        kind: json["kind"] == null ? null : json["kind"],
        select: json["select"] == null ? null : Select.fromJson(json["select"]),
        enabledDefault:
            json["enabledDefault"] == null ? null : json["enabledDefault"],
        timePicker: json["timePicker"] == null
            ? null
            : TimePicker.fromJson(json["timePicker"]),
        textInput: json["textInput"] == null
            ? null
            : TextInput.fromJson(json["textInput"]),
        tags: json["tags"] == null ? null : Tags.fromJson(json["tags"]),
        children: json["children"] == null
            ? null
            : List<dynamic>.from(json["children"].map((x) => x)),
        rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
      );

  Map<String, dynamic> toJson() => {
        "tid": tid == null ? null : tid,
        "name": name == null ? null : name,
        "description": description == null ? null : description,
        "category": category == null ? null : category,
        "style": style == null ? null : styleValues.reverse[style],
        "kind": kind == null ? null : kind,
        "select": select == null ? null : select.toJson(),
        "enabledDefault": enabledDefault == null ? null : enabledDefault,
        "timePicker": timePicker == null ? null : timePicker.toJson(),
        "textInput": textInput == null ? null : textInput.toJson(),
        "tags": tags == null ? null : tags.toJson(),
        "children": children == null
            ? null
            : List<dynamic>.from(children.map((x) => x)),
        "rating": rating == null ? null : rating.toJson(),
      };
}

class Rating {
  Rating({
    this.range,
    this.ratingDefault,
    this.options,
    this.labels,
    this.validation,
  });

  int range;
  int ratingDefault;
  List<RatingOption> options;
  Labels labels;
  RatingValidation validation;

  factory Rating.fromRawJson(String str) => Rating.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        range: json["range"] == null ? null : json["range"],
        ratingDefault: json["default"] == null ? null : json["default"],
        options: json["options"] == null
            ? null
            : List<RatingOption>.from(
                json["options"].map((x) => RatingOption.fromJson(x))),
        labels: json["labels"] == null ? null : Labels.fromJson(json["labels"]),
        validation: json["validation"] == null
            ? null
            : RatingValidation.fromJson(json["validation"]),
      );

  Map<String, dynamic> toJson() => {
        "range": range == null ? null : range,
        "default": ratingDefault == null ? null : ratingDefault,
        "options": options == null
            ? null
            : List<dynamic>.from(options.map((x) => x.toJson())),
        "labels": labels == null ? null : labels.toJson(),
        "validation": validation == null ? null : validation.toJson(),
      };
}

class Labels {
  Labels({
    this.min,
    this.max,
  });

  String min;
  String max;

  factory Labels.fromRawJson(String str) => Labels.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Labels.fromJson(Map<String, dynamic> json) => Labels(
        min: json["min"] == null ? null : json["min"],
        max: json["max"] == null ? null : json["max"],
      );

  Map<String, dynamic> toJson() => {
        "min": min == null ? null : min,
        "max": max == null ? null : max,
      };
}

class RatingOption {
  RatingOption({
    this.value,
    this.description,
  });

  int value;
  String description;

  factory RatingOption.fromRawJson(String str) =>
      RatingOption.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RatingOption.fromJson(Map<String, dynamic> json) => RatingOption(
        value: json["value"] == null ? null : json["value"],
        description: json["description"] == null ? null : json["description"],
      );

  Map<String, dynamic> toJson() => {
        "value": value == null ? null : value,
        "description": description == null ? null : description,
      };
}

class RatingValidation {
  RatingValidation({
    this.required,
    this.requiredCopy,
  });

  bool required;
  String requiredCopy;

  factory RatingValidation.fromRawJson(String str) =>
      RatingValidation.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RatingValidation.fromJson(Map<String, dynamic> json) =>
      RatingValidation(
        required: json["required"] == null ? null : json["required"],
        requiredCopy:
            json["requiredCopy"] == null ? null : json["requiredCopy"],
      );

  Map<String, dynamic> toJson() => {
        "required": required == null ? null : required,
        "requiredCopy": requiredCopy == null ? null : requiredCopy,
      };
}




class Required {
  Required({
    this.required,
    this.copy,
  });

  bool required;
  Copy copy;

  factory Required.fromRawJson(String str) =>
      Required.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Required.fromJson(Map<String, dynamic> json) => Required(
        required: json["required"] == null ? null : json["required"],
        copy: json["copy"] == null ? null : copyValues.map[json["copy"]],
      );

  Map<String, dynamic> toJson() => {
        "required": required == null ? null : required,
        "copy": copy == null ? null : copyValues.reverse[copy],
      };
}

enum Copy { EMPTY, REQUIRED_TIME }

final copyValues =
    EnumValues({"": Copy.EMPTY, "required_time": Copy.REQUIRED_TIME});

enum Style { PURPLE_BLUE }

final styleValues = EnumValues({"PURPLE_BLUE": Style.PURPLE_BLUE});

class Tags {
  Tags({
    this.userAddable,
    this.limit,
    this.tagsDefault,
    this.autocompleteId,
    this.source,
    this.relation,
  });

  bool userAddable;
  int limit;
  List<Default> tagsDefault;
  String autocompleteId;
  String source;
  Relation relation;

  factory Tags.fromRawJson(String str) => Tags.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Tags.fromJson(Map<String, dynamic> json) => Tags(
        userAddable: json["userAddable"] == null ? null : json["userAddable"],
        limit: json["limit"] == null ? null : json["limit"],
        tagsDefault: json["default"] == null
            ? null
            : List<Default>.from(
                json["default"].map((x) => Default.fromJson(x))),
        autocompleteId:
            json["autocompleteId"] == null ? null : json["autocompleteId"],
        source: json["source"] == null ? null : json["source"],
        relation: json["relation"] == null
            ? null
            : Relation.fromJson(json["relation"]),
      );

  Map<String, dynamic> toJson() => {
        "userAddable": userAddable == null ? null : userAddable,
        "limit": limit == null ? null : limit,
        "default": tagsDefault == null
            ? null
            : List<dynamic>.from(tagsDefault.map((x) => x.toJson())),
        "autocompleteId": autocompleteId == null ? null : autocompleteId,
        "source": source == null ? null : source,
        "relation": relation == null ? null : relation.toJson(),
      };
}

class Relation {
  Relation({
    this.related,
    this.property,
  });

  String related;
  String property;

  factory Relation.fromRawJson(String str) =>
      Relation.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Relation.fromJson(Map<String, dynamic> json) => Relation(
        related: json["related"] == null ? null : json["related"],
        property: json["property"] == null ? null : json["property"],
      );

  Map<String, dynamic> toJson() => {
        "related": related == null ? null : related,
        "property": property == null ? null : property,
      };
}

class Default {
  Default({
    this.category,
    this.key,
    this.value,
    this.required,
  });

  Category category;
  String key;
  String value;
  bool required;

  factory Default.fromRawJson(String str) => Default.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Default.fromJson(Map<String, dynamic> json) => Default(
        category: json["category"] == null
            ? null
            : categoryValues.map[json["category"]],
        key: json["key"] == null ? null : json["key"],
        value: json["value"] == null ? null : json["value"],
        required: json["required"] == null ? null : json["required"],
      );

  Map<String, dynamic> toJson() => {
        "category": category == null ? null : categoryValues.reverse[category],
        "key": key == null ? null : key,
        "value": value == null ? null : value,
        "required": required == null ? null : required,
      };
}

enum Category { RELAXATION_TECHNIQUES, LOW_FODMAP }

final categoryValues = EnumValues({
  "lowFodmap": Category.LOW_FODMAP,
  "relaxationTechniques": Category.RELAXATION_TECHNIQUES
});

class TextInput {
  TextInput({
    this.textInputDefault,
    this.validation,
  });

  String textInputDefault;
  TextInputValidation validation;

  factory TextInput.fromRawJson(String str) =>
      TextInput.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TextInput.fromJson(Map<String, dynamic> json) => TextInput(
        textInputDefault: json["default"] == null ? null : json["default"],
        validation: json["validation"] == null
            ? null
            : TextInputValidation.fromJson(json["validation"]),
      );

  Map<String, dynamic> toJson() => {
        "default": textInputDefault == null ? null : textInputDefault,
        "validation": validation == null ? null : validation.toJson(),
      };
}

class TextInputValidation {
  TextInputValidation({
    this.required,
    this.min,
    this.max,
  });

  Required required;
  Min min;
  Max max;

  factory TextInputValidation.fromRawJson(String str) =>
      TextInputValidation.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TextInputValidation.fromJson(Map<String, dynamic> json) =>
      TextInputValidation(
        required: json["required"] == null
            ? null
            : Required.fromJson(json["required"]),
        min: json["min"] == null ? null : Min.fromJson(json["min"]),
        max: json["max"] == null ? null : Max.fromJson(json["max"]),
      );

  Map<String, dynamic> toJson() => {
        "required": required == null ? null : required.toJson(),
        "min": min == null ? null : min.toJson(),
        "max": max == null ? null : max.toJson(),
      };
}

class Max {
  Max({
    this.max,
    this.copy,
  });

  int max;
  String copy;

  factory Max.fromRawJson(String str) => Max.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Max.fromJson(Map<String, dynamic> json) => Max(
        max: json["max"] == null ? null : json["max"],
        copy: json["copy"] == null ? null : json["copy"],
      );

  Map<String, dynamic> toJson() => {
        "max": max == null ? null : max,
        "copy": copy == null ? null : copy,
      };
}

class Min {
  Min({
    this.min,
    this.copy,
  });

  int min;
  String copy;

  factory Min.fromRawJson(String str) => Min.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Min.fromJson(Map<String, dynamic> json) => Min(
        min: json["min"] == null ? null : json["min"],
        copy: json["copy"] == null ? null : json["copy"],
      );

  Map<String, dynamic> toJson() => {
        "min": min == null ? null : min,
        "copy": copy == null ? null : copy,
      };
}

class TimePicker {
  TimePicker({
    this.timePickerDefault,
    this.validation,
  });

  dynamic timePickerDefault;
  ListValidation validation;

  factory TimePicker.fromRawJson(String str) =>
      TimePicker.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TimePicker.fromJson(Map<String, dynamic> json) => TimePicker(
        timePickerDefault: json["default"],
        validation: json["validation"] == null
            ? null
            : ListValidation.fromJson(json["validation"]),
      );

  Map<String, dynamic> toJson() => {
        "default": timePickerDefault,
        "validation": validation == null ? null : validation.toJson(),
      };
}

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
