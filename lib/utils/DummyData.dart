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

  static List<IbsModel> iBsType = [
    IbsModel(title: "IBS - C", description: "(Constipation)"),
    IbsModel(title: "IBS - D", description: "(Diarrhea)"),
    IbsModel(title: "IBS - M", description: "(Mixed)"),
    IbsModel(title: "IBS - U", description: "(Untyped)"),
  ];
  static List<IbsModel> iBsTypeReference = [
    IbsModel(title: "Constipated (Types 1 and 2)"),
    IbsModel(title: "Diarrhea (Types 6 and 7)"),
    IbsModel(title: "Normal (Types 3 and 4)"),
    IbsModel(title: "Constipated and Diarrhea")
  ];
  static List<IBSTypeModel> symptoms = [
    IBSTypeModel(text: "Gassy Gut", image: Assets.gassyGut),
    IBSTypeModel(text: "Punch to the Stomach", image: Assets.punchStomach),
    IBSTypeModel(text: "Heavy Feeling", image: Assets.heavy_feeling),
    IBSTypeModel(text: "Clogged Up", image: Assets.clogged),
    IBSTypeModel(
        text: "Volcano in the Stomach", image: Assets.volcanoInStomach),
    IBSTypeModel(text: "Pain like Razors", image: Assets.painrazors),
    IBSTypeModel(text: "Burning Sensation", image: Assets.burningSensation),
    IBSTypeModel(text: "Gut Wringing", image: Assets.gutWring),
    IBSTypeModel(text: "Stomach in Knots", image: Assets.stomachKnots),
    IBSTypeModel(text: "Sharp/Stabbing Pains", image: Assets.sharpStabbing),
    IBSTypeModel(text: "Rolling Sensation", image: Assets.rollingSensation),
    IBSTypeModel(text: "Nausea", image: Assets.nausea),
  ];
  static List<TrackingOptionsModel> medicationList = [
    TrackingOptionsModel(title: "Immodium"),
    TrackingOptionsModel(title: "Milk of Magnesia"),
    TrackingOptionsModel(title: "Rifaximin"),
    TrackingOptionsModel(title: "Eluxadoline"),
    TrackingOptionsModel(title: "Peppermint Oil"),
    TrackingOptionsModel(title: "Metamucil"),
  ];
  static List<IBSTypeModel> trackFoodList = [
    IBSTypeModel(text: "Breakfast", image: Assets.breakfast),
    IBSTypeModel(text: "Lunch", image: Assets.lunch),
    IBSTypeModel(text: "Dinner", image: Assets.dinner),
    IBSTypeModel(text: "Snacks", image: Assets.snacks),
  ];
  static List<TrackingOptionsModel> additionalResourcesList = [
    TrackingOptionsModel(title: "Understand the gut-brain connection"),
    TrackingOptionsModel(title: "Strategies for managing stress"),
    TrackingOptionsModel(title: "What to expect"),
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

class IbsModel {
  IbsModel({this.title, this.description});

  String title;
  String description;
}

class TrackModel {
  TrackModel({this.image, this.text, this.onTap});

  String image;
  String text;
  Function onTap;
}
