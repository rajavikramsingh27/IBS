// To parse this JSON data, do
//
//     final trackablesListModel = trackablesListModelFromJson(jsonString);

import 'dart:convert';

TrackablesListModel trackablesListModelFromJson(String str) =>
    TrackablesListModel.fromJson(json.decode(str));

String trackablesListModelToJson(TrackablesListModel data) =>
    json.encode(data.toJson());

class TrackablesListModel {
  TrackablesListModel({
    this.total,
    this.limit,
    this.skip,
    this.data,
  });

  int? total;
  int? limit;
  int? skip;
  List<Trackables1Model>? data;

  factory TrackablesListModel.fromJson(Map<String, dynamic> json) =>
      TrackablesListModel(
        total: json["total"],
        limit: json["limit"],
        skip: json["skip"],
        data: List<Trackables1Model>.from(
            json["data"].map((x) => Trackables1Model.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "limit": limit,
        "skip": skip,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Trackables1Model {
  Trackables1Model({
    this.id,
    this.tid,
    this.service,
    this.kind,
    this.category,
    this.items,
    this.version,
    this.enabled,
  });

  String? id;
  String? tid;
  String? service;
  String? kind;
  String? category;
  List<Trackables2Model>? items;
  int? version;
  bool? enabled;

  factory Trackables1Model.fromJson(Map<String, dynamic> json) =>
      Trackables1Model(
        id: json["_id"],
        tid: json["tid"],
        service: json["service"],
        kind: json["kind"],
        category: json["category"],
        items: List<Trackables2Model>.from(
            json["items"].map((x) => Trackables2Model.fromJson(x))),
        version: json["version"] == null ? null : json["version"],
        enabled: json["enabled"] == null ? null : json["enabled"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "tid": tid,
        "service": service,
        "kind": kind,
        "category": category,
        "items": List<dynamic>.from(items!.map((x) => x.toJson())),
        "version": version == null ? null : version,
        "enabled": enabled == null ? null : enabled,
      };
}

class Trackables2Model {
  Trackables2Model({
    this.tid,
    this.name,
    this.description,
    this.category,
    this.style,
    this.kind,
    this.enabledDefault,
    this.children,
    this.textInput,
    this.color,
    this.list,
    this.tags,
    this.type,
    this.value,
  });

  String? tid;
  String? name;
  String? description;
  String? category;
  String? style;
  String? kind;
  bool? enabledDefault;
  List<Trackables3Model>? children;
  String? textInput;
  String? color;
  OptionModel? list;
  String? tags;
  String? type;
  String? value;

  factory Trackables2Model.fromJson(Map<String, dynamic> json) =>
      Trackables2Model(
        tid: json["tid"] == null ? null : json["tid"],
        name: json["name"] == null ? null : json["name"],
        description: json["description"] == null ? null : json["description"],
        category: json["category"] == null ? null : json["category"],
        style: json["style"] == null ? null : json["style"],
        kind: json["kind"] == null ? null : json["kind"],
        enabledDefault:
            json["enabledDefault"] == null ? null : json["enabledDefault"],
        children: json["children"] == null
            ? null
            : List<Trackables3Model>.from(
                json["children"].map((x) => Trackables3Model.fromJson(x))),
        textInput: json["textInput"] == null ? null : json["textInput"],
        color: json["color"] == null ? null : json["color"],
        list: json["list"] == null ? null : OptionModel.fromJson(json["list"]),
        tags: json["tags"] == null ? null : json["tags"],
        type: json["type"] == null ? null : json["type"],
        value: json["value"] == null ? null : json["value"],
      );

  Map<String, dynamic> toJson() => {
        "tid": tid == null ? null : tid,
        "name": name == null ? null : name,
        "description": description == null ? null : description,
        "category": category == null ? null : category,
        "kind": kind == null ? null : kind,
        "enabledDefault": enabledDefault == null ? null : enabledDefault,
        "children": children == null
            ? null
            : List<dynamic>.from(children!.map((x) => x.toJson())),
        "textInput": textInput == null ? null : textInput,
        "color": color == null ? null : color,
        "list": list == null ? null : list,
        "tags": tags == null ? null : tags,
        "type": type == null ? null : type,
        "value": value == null ? null : value,
      };
}

class Trackables3Model {
  Trackables3Model({
    this.condition,
    this.items,
  });

  ConditionSlider? condition;
  List<Trackables4Model>? items;

  factory Trackables3Model.fromJson(Map<String, dynamic> json) =>
      Trackables3Model(
        condition: ConditionSlider.fromJson(json["condition"]),
        items: List<Trackables4Model>.from(
            json["items"].map((x) => Trackables4Model.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "condition": condition!.toJson(),
        "items": List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}

class ConditionSlider {
  ConditionSlider({
    this.conditionOperator,
    this.value,
  });

  String? conditionOperator;
  int? value;

  factory ConditionSlider.fromJson(Map<String, dynamic> json) =>
      ConditionSlider(
        conditionOperator: json["operator"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "operator": conditionOperator,
        "value": value,
      };
}

class Trackables4Model {
  Trackables4Model({
    this.tid,
    this.name,
    this.description,
    this.category,
    this.kind,
    this.enabledDefault,
    this.type,
    this.value,
    this.tags,
  });

  String? tid;
  String? name;
  String? description;
  String? category;
  String? kind;
  bool? enabledDefault;

  String? select;

  String? type;
  String? value;
  TagsModel? tags;

  factory Trackables4Model.fromJson(Map<String, dynamic> json) =>
      Trackables4Model(
        tid: json["tid"] == null ? null : json["tid"],
        name: json["name"] == null ? null : json["name"],
        description: json["description"] == null ? null : json["description"],
        category: json["category"] == null ? null : json["category"],
        kind: json["kind"] == null ? null : json["kind"],
        enabledDefault:
            json["enabledDefault"] == null ? null : json["enabledDefault"],
        type: json["type"] == null ? null : json["type"],
        value: json["value"] == null ? null : json["value"],
        tags: json["tags"] == null ? null : TagsModel.fromJson(json["tags"]),
      );

  Map<String, dynamic> toJson() => {
        "tid": tid == null ? null : tid,
        "name": name == null ? null : name,
        "description": description == null ? null : description,
        "kind": kind == null ? null : kind,
        "enabledDefault": enabledDefault == null ? null : enabledDefault,
        "type": type == null ? null : type,
        "value": value == null ? null : value,
        "tags": tags == null ? null : tags!.toJson(),
      };
}

class OptionModel {
  OptionModel({
    this.value,
    this.label,
    this.image,
    this.description,
    this.optionDefault,
  });

  String? value;
  String? label;
  ImageList? image;
  String? description;
  bool? optionDefault;

  factory OptionModel.fromJson(Map<String, dynamic> json) => OptionModel(
        value: json["value"],
        label: json["label"],
        image: ImageList.fromJson(json["image"]),
        optionDefault: json["default"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "label": label,
        "image": image!.toJson(),
        "default": optionDefault,
      };
}

class ImageList {
  ImageList({
    this.normal,
    this.active,
  });

  String? normal;
  String? active;

  factory ImageList.fromJson(Map<String, dynamic> json) => ImageList(
        normal: json["normal"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "normal": normal,
        "active": active,
      };
}

class TagsModel {
  TagsModel({
    this.tagsDefault,
    this.autocompleteId,
    this.children,
  });

  List<String>? tagsDefault;
  String? autocompleteId;
  List<TagsChild>? children;

  factory TagsModel.fromJson(Map<String, dynamic> json) => TagsModel(
        tagsDefault: List<String>.from(json["default"].map((x) => x)),
        autocompleteId: json["autocompleteId"],
        children: List<TagsChild>.from(
            json["children"].map((x) => TagsChild.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "default": List<dynamic>.from(tagsDefault!.map((x) => x)),
        "autocompleteId": autocompleteId,
        "children": List<dynamic>.from(children!.map((x) => x.toJson())),
      };
}

class TagsChild {
  TagsChild({
    this.tid,
    this.name,
    this.description,
    this.category,
    this.kind,
  });

  String? tid;
  String? name;
  String? description;
  String? category;
  String? kind;

  factory TagsChild.fromJson(Map<String, dynamic> json) => TagsChild(
        tid: json["tid"],
        name: json["name"],
        description: json["description"],
        category: json["category"],
        kind: json["kind"],
      );

  Map<String, dynamic> toJson() => {
        "tid": tid,
        "name": name,
        "description": description,
        "category": category,
        "kind": kind,
      };
}
