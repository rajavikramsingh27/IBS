// To parse this JSON data, do
//
//     final trackablesListModel = trackablesListModelFromJson(jsonString);

import 'dart:convert';

TrackablesListModel trackablesListModelFromJson(String str) => TrackablesListModel.fromJson(json.decode(str));

String trackablesListModelToJson(TrackablesListModel data) => json.encode(data.toJson());

class TrackablesListModel {
  TrackablesListModel({
    this.total,
    this.limit,
    this.skip,
    this.data,
  });

  int total;
  int limit;
  int skip;
  List<Datum> data;

  factory TrackablesListModel.fromJson(Map<String, dynamic> json) => TrackablesListModel(
    total: json["total"],
    limit: json["limit"],
    skip: json["skip"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "limit": limit,
    "skip": skip,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.id,
    this.tid,
    this.service,
    this.kind,
    this.category,
    this.image,
    this.items,
    this.version,
    this.enabled,
  });

  String id;
  String tid;
  String service;
  String kind;
  String category;
  ModelImage image;
  List<DatumItem> items;
  int version;
  bool enabled;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["_id"],
    tid: json["tid"],
    service: json["service"],
    kind: json["kind"],
    category: json["category"],
    image: ModelImage.fromJson(json["image"]),
    items: List<DatumItem>.from(json["items"].map((x) => DatumItem.fromJson(x))),
    version: json["version"] == null ? null : json["version"],
    enabled: json["enabled"] == null ? false : json["enabled"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "tid": tid,
    "service": service,
    "kind": kind,
    "category": category,
    "image": image.toJson(),
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
    "version": version == null ? null : version,
    "enabled": enabled == null ? null : enabled,
  };
}

class ModelImage {
  ModelImage({
    this.normal,
    this.active,
  });

  String normal;
  String active;

  factory ModelImage.fromJson(Map<String, dynamic> json) => ModelImage(
    normal: json["normal"],
    active: json["active"],
  );

  Map<String, dynamic> toJson() => {
    "normal": normal,
    "active": active,
  };
}

class DatumItem {
  DatumItem({
    this.tid,
    this.name,
    this.description,
    this.category,
    this.style,
    this.kind,
    this.enabledDefault,
    this.rating,
    this.children,
    this.textInput,
    this.validation,
    this.color,
    this.list,
    this.tags,
    this.type,
    this.value,
    this.condition,
    this.boolList,
  });

  String tid;
  String name;
  String description;
  String category;
  FluffyStyle style;
  String kind;
  bool enabledDefault;
  FluffyRating rating;
  List<ItemChild> children;
  TextInput textInput;
  ListValidation validation;
  ModelColor color;
  FluffyList list;
  FluffyTags tags;
  String type;
  String value;
  ItemCondition condition;
  BoolList boolList;

  factory DatumItem.fromJson(Map<String, dynamic> json) => DatumItem(
    tid: json["tid"] == null ? null : json["tid"],
    name: json["name"] == null ? null : json["name"],
    description: json["description"] == null ? null : json["description"],
    category: json["category"] == null ? null : json["category"],
    style: json["style"] == null ? null : fluffyStyleValues.map[json["style"]],
    kind: json["kind"] == null ? null : json["kind"],
    enabledDefault: json["enabledDefault"] == null ? false : json["enabledDefault"],
    rating: json["rating"] == null ? null : FluffyRating.fromJson(json["rating"]),
    children: json["children"] == null ? null : List<ItemChild>.from(json["children"].map((x) => ItemChild.fromJson(x))),
    textInput: json["textInput"] == null ? null : TextInput.fromJson(json["textInput"]),
    validation: json["validation"] == null ? null : ListValidation.fromJson(json["validation"]),
    color: json["color"] == null ? null : ModelColor.fromJson(json["color"]),
    list: json["list"] == null ? null : FluffyList.fromJson(json["list"]),
    tags: json["tags"] == null ? null : FluffyTags.fromJson(json["tags"]),
    type: json["type"] == null ? null : json["type"],
    value: json["value"] == null ? null : json["value"],
    condition: json["condition"] == null ? null : ItemCondition.fromJson(json["condition"]),
    boolList: json["boolList"] == null ? null : BoolList.fromJson(json["boolList"]),
  );

  Map<String, dynamic> toJson() => {
    "tid": tid == null ? null : tid,
    "name": name == null ? null : name,
    "description": description == null ? null : description,
    "category": category == null ? null : category,
    "style": style == null ? null : fluffyStyleValues.reverse[style],
    "kind": kind == null ? null : kind,
    "enabledDefault": enabledDefault == null ? null : enabledDefault,
    "rating": rating == null ? null : rating.toJson(),
    "children": children == null ? null : List<dynamic>.from(children.map((x) => x.toJson())),
    "textInput": textInput == null ? null : textInput.toJson(),
    "validation": validation == null ? null : validation.toJson(),
    "color": color == null ? null : color.toJson(),
    "list": list == null ? null : list.toJson(),
    "tags": tags == null ? null : tags.toJson(),
    "type": type == null ? null : type,
    "value": value == null ? null : value,
    "condition": condition == null ? null : condition.toJson(),
    "boolList": boolList == null ? null : boolList.toJson(),
  };
}

class BoolList {
  BoolList({
    this.boolListDefault,
    this.source,
    this.relation,
  });

  List<BoolListDefault> boolListDefault;
  String source;
  BoolListRelation relation;

  factory BoolList.fromJson(Map<String, dynamic> json) => BoolList(
    boolListDefault: List<BoolListDefault>.from(json["default"].map((x) => BoolListDefault.fromJson(x))),
    source: json["source"],
    relation: BoolListRelation.fromJson(json["relation"]),
  );

  Map<String, dynamic> toJson() => {
    "default": List<dynamic>.from(boolListDefault.map((x) => x.toJson())),
    "source": source,
    "relation": relation.toJson(),
  };
}

class BoolListDefault {
  BoolListDefault({
    this.value,
    this.required,
  });

  String value;
  bool required;

  factory BoolListDefault.fromJson(Map<String, dynamic> json) => BoolListDefault(
    value: json["value"],
    required: json["required"],
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "required": required,
  };
}

class BoolListRelation {
  BoolListRelation({
    this.related,
    this.property,
  });

  String related;
  String property;

  factory BoolListRelation.fromJson(Map<String, dynamic> json) => BoolListRelation(
    related: json["related"],
    property: json["property"],
  );

  Map<String, dynamic> toJson() => {
    "related": related,
    "property": property,
  };
}

class ItemChild {
  ItemChild({
    this.condition,
    this.items,
    this.validation,
  });

  PurpleCondition condition;
  List<PurpleItem> items;
  ListValidation validation;

  factory ItemChild.fromJson(Map<String, dynamic> json) => ItemChild(
    condition: PurpleCondition.fromJson(json["condition"]),
    items: List<PurpleItem>.from(json["items"].map((x) => PurpleItem.fromJson(x))),
    validation: json["validation"] == null ? null : ListValidation.fromJson(json["validation"]),
  );

  Map<String, dynamic> toJson() => {
    "condition": condition.toJson(),
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
    "validation": validation == null ? null : validation.toJson(),
  };
}

class PurpleCondition {
  PurpleCondition({
    this.conditionOperator,
    this.value,
  });

  String conditionOperator;
  dynamic value;

  factory PurpleCondition.fromJson(Map<String, dynamic> json) => PurpleCondition(
    conditionOperator: json["operator"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "operator": conditionOperator,
    "value": value,
  };
}

class PurpleItem {
  PurpleItem({
    this.tid,
    this.name,
    this.description,
    this.category,
    this.style,
    this.kind,
    this.enabledDefault,
    this.list,
    this.select,
    this.toggle,
    this.type,
    this.value,
    this.tags,
    this.sum,
    this.textInput,
    this.rating,
    this.numberInput,
    this.timePicker,
    this.children,
  });

  String tid;
  String name;
  String description;
  Category category;
  PurpleStyle style;
  String kind;
  bool enabledDefault;
  PurpleList list;
  Select select;
  Toggle toggle;
  String type;
  String value;
  PurpleTags tags;
  Sum sum;
  TextInput textInput;
  PurpleRating rating;
  NumberInput numberInput;
  NumberInput timePicker;
  List<dynamic> children;

  factory PurpleItem.fromJson(Map<String, dynamic> json) => PurpleItem(
    tid: json["tid"] == null ? null : json["tid"],
    name: json["name"] == null ? null : json["name"],
    description: json["description"] == null ? null : json["description"],
    category: json["category"] == null ? null : categoryValues.map[json["category"]],
    style: json["style"] == null ? null : purpleStyleValues.map[json["style"]],
    kind: json["kind"] == null ? null : json["kind"],
    enabledDefault: json["enabledDefault"] == null ? null : json["enabledDefault"],
    list: json["list"] == null ? null : PurpleList.fromJson(json["list"]),
    select: json["select"] == null ? null : Select.fromJson(json["select"]),
    toggle: json["toggle"] == null ? null : Toggle.fromJson(json["toggle"]),
    type: json["type"] == null ? null : json["type"],
    value: json["value"] == null ? null : json["value"],
    tags: json["tags"] == null ? null : PurpleTags.fromJson(json["tags"]),
    sum: json["sum"] == null ? null : Sum.fromJson(json["sum"]),
    textInput: json["textInput"] == null ? null : TextInput.fromJson(json["textInput"]),
    rating: json["rating"] == null ? null : PurpleRating.fromJson(json["rating"]),
    numberInput: json["numberInput"] == null ? null : NumberInput.fromJson(json["numberInput"]),
    timePicker: json["timePicker"] == null ? null : NumberInput.fromJson(json["timePicker"]),
    children: json["children"] == null ? null : List<dynamic>.from(json["children"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "tid": tid == null ? null : tid,
    "name": name == null ? null : name,
    "description": description == null ? null : description,
    "category": category == null ? null : categoryValues.reverse[category],
    "style": style == null ? null : purpleStyleValues.reverse[style],
    "kind": kind == null ? null : kind,
    "enabledDefault": enabledDefault == null ? null : enabledDefault,
    "list": list == null ? null : list.toJson(),
    "select": select == null ? null : select.toJson(),
    "toggle": toggle == null ? null : toggle.toJson(),
    "type": type == null ? null : type,
    "value": value == null ? null : value,
    "tags": tags == null ? null : tags.toJson(),
    "sum": sum == null ? null : sum.toJson(),
    "textInput": textInput == null ? null : textInput.toJson(),
    "rating": rating == null ? null : rating.toJson(),
    "numberInput": numberInput == null ? null : numberInput.toJson(),
    "timePicker": timePicker == null ? null : timePicker.toJson(),
    "children": children == null ? null : List<dynamic>.from(children.map((x) => x)),
  };
}

enum Category { SYMPTOMS, BOWEL_RELIEF, FOOD, WELLNESS }

final categoryValues = EnumValues({
  "bowel_relief": Category.BOWEL_RELIEF,
  "food": Category.FOOD,
  "symptoms": Category.SYMPTOMS,
  "wellness": Category.WELLNESS
});

class PurpleList {
  PurpleList({
    this.options,
    this.validation,
  });

  List<ListOption> options;
  ListValidation validation;

  factory PurpleList.fromJson(Map<String, dynamic> json) => PurpleList(
    options: List<ListOption>.from(json["options"].map((x) => ListOption.fromJson(x))),
    validation: ListValidation.fromJson(json["validation"]),
  );

  Map<String, dynamic> toJson() => {
    "options": List<dynamic>.from(options.map((x) => x.toJson())),
    "validation": validation.toJson(),
  };
}

class ListOption {
  ListOption({
    this.value,
    this.label,
    this.image,
    this.optionDefault,
    this.conditionalDefault,
  });

  String value;
  String label;
  ModelImage image;
  bool optionDefault;
  ConditionalDefault conditionalDefault;

  factory ListOption.fromJson(Map<String, dynamic> json) => ListOption(
    value: json["value"],
    label: json["label"],
    image: ModelImage.fromJson(json["image"]),
    optionDefault: json["default"],
    conditionalDefault: json["conditionalDefault"] == null ? null : ConditionalDefault.fromJson(json["conditionalDefault"]),
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "label": label,
    "image": image.toJson(),
    "default": optionDefault,
    "conditionalDefault": conditionalDefault == null ? null : conditionalDefault.toJson(),
  };
}

class ConditionalDefault {
  ConditionalDefault({
    this.time,
  });

  Time time;

  factory ConditionalDefault.fromJson(Map<String, dynamic> json) => ConditionalDefault(
    time: Time.fromJson(json["time"]),
  );

  Map<String, dynamic> toJson() => {
    "time": time.toJson(),
  };
}

class Time {
  Time({
    this.startTime,
    this.endTime,
  });

  String startTime;
  String endTime;

  factory Time.fromJson(Map<String, dynamic> json) => Time(
    startTime: json["startTime"],
    endTime: json["endTime"],
  );

  Map<String, dynamic> toJson() => {
    "startTime": startTime,
    "endTime": endTime,
  };
}

class ListValidation {
  ListValidation({
    this.required,
  });

  RequiredClass required;

  factory ListValidation.fromJson(Map<String, dynamic> json) => ListValidation(
    required: RequiredClass.fromJson(json["required"]),
  );

  Map<String, dynamic> toJson() => {
    "required": required.toJson(),
  };
}

class RequiredClass {
  RequiredClass({
    this.required,
    this.copy,
  });

  bool required;
  Copy copy;

  factory RequiredClass.fromJson(Map<String, dynamic> json) => RequiredClass(
    required: json["required"],
    copy: copyValues.map[json["copy"]],
  );

  Map<String, dynamic> toJson() => {
    "required": required,
    "copy": copyValues.reverse[copy],
  };
}

enum Copy { EMPTY, JOURNAL_ENTRY_REQUIRED }

final copyValues = EnumValues({
  "": Copy.EMPTY,
  "journal-entry_required": Copy.JOURNAL_ENTRY_REQUIRED
});

class NumberInput {
  NumberInput({
    this.numberInputDefault,
    this.validation,
  });

  dynamic numberInputDefault;
  ListValidation validation;

  factory NumberInput.fromJson(Map<String, dynamic> json) => NumberInput(
    numberInputDefault: json["default"],
    validation: ListValidation.fromJson(json["validation"]),
  );

  Map<String, dynamic> toJson() => {
    "default": numberInputDefault,
    "validation": validation.toJson(),
  };
}

class PurpleRating {
  PurpleRating({
    this.range,
    this.ratingDefault,
    this.options,
    this.validation,
  });

  int range;
  int ratingDefault;
  List<PurpleOption> options;
  PurpleValidation validation;

  factory PurpleRating.fromJson(Map<String, dynamic> json) => PurpleRating(
    range: json["range"],
    ratingDefault: json["default"],
    options: List<PurpleOption>.from(json["options"].map((x) => PurpleOption.fromJson(x))),
    validation: PurpleValidation.fromJson(json["validation"]),
  );

  Map<String, dynamic> toJson() => {
    "range": range,
    "default": ratingDefault,
    "options": List<dynamic>.from(options.map((x) => x.toJson())),
    "validation": validation.toJson(),
  };
}

class PurpleOption {
  PurpleOption({
    this.value,
    this.description,
  });

  int value;
  String description;

  factory PurpleOption.fromJson(Map<String, dynamic> json) => PurpleOption(
    value: json["value"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "description": description,
  };
}

class PurpleValidation {
  PurpleValidation({
    this.required,
    this.requiredCopy,
  });

  bool required;
  String requiredCopy;

  factory PurpleValidation.fromJson(Map<String, dynamic> json) => PurpleValidation(
    required: json["required"],
    requiredCopy: json["requiredCopy"],
  );

  Map<String, dynamic> toJson() => {
    "required": required,
    "requiredCopy": requiredCopy,
  };
}

class Select {
  Select({
    this.selectDefault,
    this.options,
    this.validation,
  });

  String selectDefault;
  List<SelectOption> options;
  ListValidation validation;

  factory Select.fromJson(Map<String, dynamic> json) => Select(
    selectDefault: json["default"],
    options: List<SelectOption>.from(json["options"].map((x) => SelectOption.fromJson(x))),
    validation: ListValidation.fromJson(json["validation"]),
  );

  Map<String, dynamic> toJson() => {
    "default": selectDefault,
    "options": List<dynamic>.from(options.map((x) => x.toJson())),
    "validation": validation.toJson(),
  };
}

class SelectOption {
  SelectOption({
    this.value,
    this.label,
  });

  String value;
  String label;

  factory SelectOption.fromJson(Map<String, dynamic> json) => SelectOption(
    value: json["value"],
    label: json["label"],
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "label": label,
  };
}

enum PurpleStyle { PURPLE_BLUE, GREY_PURPLE, BLUE_BLUE }

final purpleStyleValues = EnumValues({
  "BLUE_BLUE": PurpleStyle.BLUE_BLUE,
  "GREY_PURPLE": PurpleStyle.GREY_PURPLE,
  "PURPLE_BLUE": PurpleStyle.PURPLE_BLUE
});

class Sum {
  Sum({
    this.range,
    this.sumDefault,
    this.image,
  });

  int range;
  int sumDefault;
  ModelImage image;

  factory Sum.fromJson(Map<String, dynamic> json) => Sum(
    range: json["range"],
    sumDefault: json["default"],
    image: ModelImage.fromJson(json["image"]),
  );

  Map<String, dynamic> toJson() => {
    "range": range,
    "default": sumDefault,
    "image": image.toJson(),
  };
}

class PurpleTags {
  PurpleTags({
    this.tagsDefault,
    this.autocompleteId,
    this.children,
  });

  List<TagsDefault> tagsDefault;
  String autocompleteId;
  List<TagsChild> children;

  factory PurpleTags.fromJson(Map<String, dynamic> json) => PurpleTags(
    tagsDefault: List<TagsDefault>.from(json["default"].map((x) => TagsDefault.fromJson(x))),
    autocompleteId: json["autocompleteId"],
    children: List<TagsChild>.from(json["children"].map((x) => TagsChild.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "default": List<dynamic>.from(tagsDefault.map((x) => x.toJson())),
    "autocompleteId": autocompleteId,
    "children": List<dynamic>.from(children.map((x) => x.toJson())),
  };
}

class TagsChild {
  TagsChild({
    this.condition,
    this.items,
  });

  FluffyCondition condition;
  List<FluffyItem> items;

  factory TagsChild.fromJson(Map<String, dynamic> json) => TagsChild(
    condition: FluffyCondition.fromJson(json["condition"]),
    items: List<FluffyItem>.from(json["items"].map((x) => FluffyItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "condition": condition.toJson(),
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
  };
}

class FluffyCondition {
  FluffyCondition({
    this.conditionOperator,
    this.value,
    this.relation,
  });

  String conditionOperator;
  dynamic value;
  ConditionRelation relation;

  factory FluffyCondition.fromJson(Map<String, dynamic> json) => FluffyCondition(
    conditionOperator: json["operator"],
    value: json["value"],
    relation: json["relation"] == null ? null : ConditionRelation.fromJson(json["relation"]),
  );

  Map<String, dynamic> toJson() => {
    "operator": conditionOperator,
    "value": value,
    "relation": relation == null ? null : relation.toJson(),
  };
}

class ConditionRelation {
  ConditionRelation({
    this.related,
    this.property,
    this.contains,
  });

  String related;
  String property;
  String contains;

  factory ConditionRelation.fromJson(Map<String, dynamic> json) => ConditionRelation(
    related: json["related"],
    property: json["property"],
    contains: json["contains"],
  );

  Map<String, dynamic> toJson() => {
    "related": related,
    "property": property,
    "contains": contains,
  };
}

class FluffyItem {
  FluffyItem({
    this.tid,
    this.name,
    this.description,
    this.category,
    this.style,
    this.kind,
    this.tags,
  });

  String tid;
  String name;
  String description;
  Category category;
  PurpleStyle style;
  String kind;
  FluffyTags tags;

  factory FluffyItem.fromJson(Map<String, dynamic> json) => FluffyItem(
    tid: json["tid"],
    name: json["name"],
    description: json["description"],
    category: categoryValues.map[json["category"]],
    style: purpleStyleValues.map[json["style"]],
    kind: json["kind"],
    tags: FluffyTags.fromJson(json["tags"]),
  );

  Map<String, dynamic> toJson() => {
    "tid": tid,
    "name": name,
    "description": description,
    "category": categoryValues.reverse[category],
    "style": purpleStyleValues.reverse[style],
    "kind": kind,
    "tags": tags.toJson(),
  };
}

class FluffyTags {
  FluffyTags({
    this.tagsDefault,
    this.source,
    this.relation,
    this.limit,
    this.autocompleteId,
  });

  List<TagsDefault> tagsDefault;
  String source;
  BoolListRelation relation;
  int limit;
  String autocompleteId;

  factory FluffyTags.fromJson(Map<String, dynamic> json) => FluffyTags(
    tagsDefault: List<TagsDefault>.from(json["default"].map((x) => TagsDefault.fromJson(x))),
    source: json["source"] == null ? null : json["source"],
    relation: json["relation"] == null ? null : BoolListRelation.fromJson(json["relation"]),
    limit: json["limit"] == null ? null : json["limit"],
    autocompleteId: json["autocompleteId"] == null ? null : json["autocompleteId"],
  );

  Map<String, dynamic> toJson() => {
    "default": List<dynamic>.from(tagsDefault.map((x) => x.toJson())),
    "source": source == null ? null : source,
    "relation": relation == null ? null : relation.toJson(),
    "limit": limit == null ? null : limit,
    "autocompleteId": autocompleteId == null ? null : autocompleteId,
  };
}

class TagsDefault {
  TagsDefault({
    this.key,
    this.value,
    this.required,
  });

  String key;
  String value;
  bool required;

  factory TagsDefault.fromJson(Map<String, dynamic> json) => TagsDefault(
    key: json["key"],
    value: json["value"],
    required: json["required"],
  );

  Map<String, dynamic> toJson() => {
    "key": key,
    "value": value,
    "required": required,
  };
}

class TextInput {
  TextInput({
    this.textInputDefault,
    this.validation,
  });

  String textInputDefault;
  TextInputValidation validation;

  factory TextInput.fromJson(Map<String, dynamic> json) => TextInput(
    textInputDefault: json["default"],
    validation: TextInputValidation.fromJson(json["validation"]),
  );

  Map<String, dynamic> toJson() => {
    "default": textInputDefault,
    "validation": validation.toJson(),
  };
}

class TextInputValidation {
  TextInputValidation({
    this.required,
    this.min,
    this.max,
  });

  RequiredClass required;
  Min min;
  Max max;

  factory TextInputValidation.fromJson(Map<String, dynamic> json) => TextInputValidation(
    required: RequiredClass.fromJson(json["required"]),
    min: Min.fromJson(json["min"]),
    max: Max.fromJson(json["max"]),
  );

  Map<String, dynamic> toJson() => {
    "required": required.toJson(),
    "min": min.toJson(),
    "max": max.toJson(),
  };
}

class Max {
  Max({
    this.max,
    this.copy,
  });

  int max;
  String copy;

  factory Max.fromJson(Map<String, dynamic> json) => Max(
    max: json["max"],
    copy: json["copy"],
  );

  Map<String, dynamic> toJson() => {
    "max": max,
    "copy": copy,
  };
}

class Min {
  Min({
    this.min,
    this.copy,
  });

  int min;
  String copy;

  factory Min.fromJson(Map<String, dynamic> json) => Min(
    min: json["min"],
    copy: json["copy"],
  );

  Map<String, dynamic> toJson() => {
    "min": min,
    "copy": copy,
  };
}

class Toggle {
  Toggle({
    this.toggleDefault,
    this.options,
    this.validation,
  });

  bool toggleDefault;
  Options options;
  ListValidation validation;

  factory Toggle.fromJson(Map<String, dynamic> json) => Toggle(
    toggleDefault: json["default"],
    options: Options.fromJson(json["options"]),
    validation: ListValidation.fromJson(json["validation"]),
  );

  Map<String, dynamic> toJson() => {
    "default": toggleDefault,
    "options": options.toJson(),
    "validation": validation.toJson(),
  };
}

class Options {
  Options({
    this.optionsTrue,
    this.optionsFalse,
  });

  False optionsTrue;
  False optionsFalse;

  factory Options.fromJson(Map<String, dynamic> json) => Options(
    optionsTrue: False.fromJson(json["true"]),
    optionsFalse: False.fromJson(json["false"]),
  );

  Map<String, dynamic> toJson() => {
    "true": optionsTrue.toJson(),
    "false": optionsFalse.toJson(),
  };
}

class False {
  False({
    this.label,
  });

  String label;

  factory False.fromJson(Map<String, dynamic> json) => False(
    label: json["label"],
  );

  Map<String, dynamic> toJson() => {
    "label": label,
  };
}

class ModelColor {
  ModelColor({
    this.colorDefault,
    this.options,
  });

  dynamic colorDefault;
  List<ColorOption> options;

  factory ModelColor.fromJson(Map<String, dynamic> json) => ModelColor(
    colorDefault: json["default"],
    options: List<ColorOption>.from(json["options"].map((x) => ColorOption.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "default": colorDefault,
    "options": List<dynamic>.from(options.map((x) => x.toJson())),
  };
}

class ColorOption {
  ColorOption({
    this.value,
    this.description,
    this.hex,
  });

  String value;
  String description;
  String hex;

  factory ColorOption.fromJson(Map<String, dynamic> json) => ColorOption(
    value: json["value"],
    description: json["description"],
    hex: json["hex"],
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "description": description,
    "hex": hex,
  };
}

class ItemCondition {
  ItemCondition({
    this.conditionOperator,
    this.relation,
  });

  String conditionOperator;
  ConditionRelation relation;

  factory ItemCondition.fromJson(Map<String, dynamic> json) => ItemCondition(
    conditionOperator: json["operator"],
    relation: ConditionRelation.fromJson(json["relation"]),
  );

  Map<String, dynamic> toJson() => {
    "operator": conditionOperator,
    "relation": relation.toJson(),
  };
}

class FluffyList {
  FluffyList({
    this.options,
  });

  List<ListOption> options;

  factory FluffyList.fromJson(Map<String, dynamic> json) => FluffyList(
    options: List<ListOption>.from(json["options"].map((x) => ListOption.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "options": List<dynamic>.from(options.map((x) => x.toJson())),
  };
}

class FluffyRating {
  FluffyRating({
    this.range,
    this.ratingDefault,
    this.options,
    this.validation,
  });

  num range;
  num ratingDefault;
  List<FluffyOption> options;
  FluffyValidation validation;

  factory FluffyRating.fromJson(Map<String, dynamic> json) => FluffyRating(
    range: json["range"],
    ratingDefault: json["default"],
    options: List<FluffyOption>.from(json["options"].map((x) => FluffyOption.fromJson(x))),
    validation: json["validation"] == null ? null : FluffyValidation.fromJson(json["validation"]),
  );

  Map<String, dynamic> toJson() => {
    "range": range,
    "default": ratingDefault,
    "options": List<dynamic>.from(options.map((x) => x.toJson())),
    "validation": validation == null ? null : validation.toJson(),
  };
}

class FluffyOption {
  FluffyOption({
    this.value,
    this.label,
    this.description,
    this.image,
  });

  int value;
  String label;
  String description;
  ModelImage image;

  factory FluffyOption.fromJson(Map<String, dynamic> json) => FluffyOption(
    value: json["value"],
    label: json["label"] == null ? null : json["label"],
    description: json["description"] == null ? null : json["description"],
    image: json["image"] == null ? null : ModelImage.fromJson(json["image"]),
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "label": label == null ? null : label,
    "description": description == null ? null : description,
    "image": image == null ? null : image.toJson(),
  };
}

class FluffyValidation {
  FluffyValidation({
    this.required,
    this.requiredCopy,
  });

  dynamic required;
  String requiredCopy;

  factory FluffyValidation.fromJson(Map<String, dynamic> json) => FluffyValidation(
    required: json["required"],
    requiredCopy: json["requiredCopy"] == null ? null : json["requiredCopy"],
  );

  Map<String, dynamic> toJson() => {
    "required": required,
    "requiredCopy": requiredCopy == null ? null : requiredCopy,
  };
}

enum FluffyStyle { PURPLE_BLUE, WHITE_WHITE }

final fluffyStyleValues = EnumValues({
  "PURPLE_BLUE": FluffyStyle.PURPLE_BLUE,
  "WHITE_WHITE": FluffyStyle.WHITE_WHITE
});

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
