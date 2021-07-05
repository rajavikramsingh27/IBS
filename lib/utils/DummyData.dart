import 'package:flutter_ibs/utils/Assets.dart';

class DummyData {
  static List<IBSTypeModel> ibsType = [
    IBSTypeModel(text: "IBS - C (Constipation)", image: Assets.ibTypeC),
    IBSTypeModel(text: "IBS - D (Diarrhea)", image: Assets.ibTypeD),
    IBSTypeModel(text: "IBS - M (Mixed)", image: Assets.ibTypeM),
    IBSTypeModel(text: "IBS - U (Untyped)", image: Assets.ibTypeU),
  ];
  static List<IBSTypeModel> ibsTypemedium = [
    IBSTypeModel(text: "Constipated (Types 1 and 2)", image: Assets.ibTypeC),
    IBSTypeModel(text: "Diarrhea (Types 6 and 7)", image: Assets.ibTypeD),
    IBSTypeModel(text: "Normal (Types 3 and 4)", image: Assets.ibTypeM),
    IBSTypeModel(text: "Constipated and Diarrhea", image: Assets.ibTypeU),
  ];
  static List<StoolChartModel> stoolChart = [
    StoolChartModel(
        text: "Separate hard lumps, like nuts ",
        image: Assets.hard_lump,
        type: "Type 1"),
    StoolChartModel(
        text: "Lumpy and sausage-Like", image: Assets.lumpy, type: "Type 2"),
    StoolChartModel(
        text: "Sausage shape with cracks",
        image: Assets.crack_lump,
        type: "Type 3"),
    StoolChartModel(
        text: "Like a smooth soft sausage and snake",
        image: Assets.soft_lump,
        type: "Type 4"),
    StoolChartModel(
        text: "Soft blobs with clear-cut edges",
        image: Assets.cut_lump,
        type: "Type 5"),
    StoolChartModel(
        text: "Mushy consistency with rugged edges",
        image: Assets.rugged_lump,
        type: "Type 6"),
    StoolChartModel(
        text: "Liquid consistency with no solid pieces",
        image: Assets.liquid_lump,
        type: "Type 7"),
  ];
  static List<TrackingOptionsModel> symptomsList = [
    TrackingOptionsModel(title: "Abdominal Pain/Bloating/Cramps"),
    TrackingOptionsModel(title: "Intensity of Symptoms"),
    TrackingOptionsModel(title: "Describe how you Feel"),
    TrackingOptionsModel(title: "Duration of Symptoms"),
  ];
   static List<TrackingOptionsModel> healthList = [
    TrackingOptionsModel(title: "Stress level"),
    TrackingOptionsModel(title: "Fatigue"),
    TrackingOptionsModel(title: "Describe how you Feel"),
    TrackingOptionsModel(title: "Duration of Symptoms"),
  ];

  static List<IBSTypeModel> trackFlow = [
    IBSTypeModel(text: "Symptoms", image: Assets.symptoms),
    IBSTypeModel(text: "Bowel Movements", image: Assets.bowel),
    IBSTypeModel(text: "Medication & Supplements", image: Assets.medication),
    IBSTypeModel(text: "Health & Wellness", image: Assets.health),
    IBSTypeModel(text: "Food & Drink", image: Assets.food),

  ];
}

class IBSTypeModel {
  IBSTypeModel({this.image, this.text});
  String image;
  String text;
}

class StoolChartModel {
  StoolChartModel({this.image, this.text, this.type});
  String image;
  String text;
  String type;
}

class CheckBoxListTileModel {
  int userId;

  String title;
  bool isCheck;

  CheckBoxListTileModel({this.userId, this.title, this.isCheck});

  static List<CheckBoxListTileModel> getUsers() {
    return <CheckBoxListTileModel>[
      CheckBoxListTileModel(userId: 1, title: "Female", isCheck: true),
      CheckBoxListTileModel(userId: 2, title: "Male", isCheck: false),
      CheckBoxListTileModel(
          userId: 3, title: "Prefer Not to Respond", isCheck: false),
    ];
  }
}

class TrackingOptionsModel {
  String title;

  TrackingOptionsModel({
    this.title,
  });
}
