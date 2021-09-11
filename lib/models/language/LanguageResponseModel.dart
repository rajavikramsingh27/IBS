// To parse this JSON data, do
//
//     final languageResponseModel = languageResponseModelFromJson(jsonString);

import 'dart:convert';

LanguageResponseModel languageResponseModelFromJson(String str) => LanguageResponseModel.fromJson(json.decode(str));

String languageResponseModelToJson(LanguageResponseModel data) => json.encode(data.toJson());

class LanguageResponseModel {
  LanguageResponseModel({
    this.total,
    this.limit,
    this.skip,
    this.data,
  });

  int total;
  int limit;
  int skip;
  List<Datum> data;

  factory LanguageResponseModel.fromJson(Map<String, dynamic> json) => LanguageResponseModel(
    total: json["total"] == null ? null : json["total"],
    limit: json["limit"] == null ? null : json["limit"],
    skip: json["skip"] == null ? null : json["skip"],
    data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "total": total == null ? null : total,
    "limit": limit == null ? null : limit,
    "skip": skip == null ? null : skip,
    "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.id,
    this.lang,
    this.symptomsName,
    this.symptomsHeader,
    this.symptomsAbdominalPainName,
    this.symptomsAbdominalPainDescription,
    this.abdominalPainRating1,
    this.abdominalPainRating2,
    this.abdominalPainRating3,
    this.abdominalPainRating4,
    this.symptomsAbdominalPainMin,
    this.symptomsAbdominalPainMax,
    this.symptomsAbdominalPainDescribeFeelName,
    this.symptomsAbdominalPainDescribeFeelDescription,
    this.optionGassyGut,
    this.optionPunchStomach,
    this.optionHeavyFeeling,
    this.optionCloggedUp,
    this.optionVolcanoStomach,
    this.optionPainRazors,
    this.optionBurningSensation,
    this.optionGutWringing,
    this.optionStomachKnots,
    this.optionSharpPains,
    this.optionRollingSensation,
    this.optionNausea,
    this.symptomsAbdominalPainDurationName,
    this.symptomsAbdominalPainDescribeFeelingDescription,
    this.optionLessThan1Hr,
    this.option12Hrs,
    this.optionMoreThan2Hrs,
    this.symptomsBloatingName,
    this.symptomsBloatingDescription,
    this.bloatingRating1,
    this.bloatingRating2,
    this.bloatingRating3,
    this.bloatingRating4,
    this.symptomsBloatingMin,
    this.symptomsBloatingMax,
    this.symptomsBloatingDescribeFeelName,
    this.symptomsBloatigDescribeFeelDescription,
    this.symptomsBloatingBloatingDurationName,
    this.symptomsBloatingBloatingDurationDescription,
    this.symptomsNotesName,
    this.symptomsNotesDescription,
    this.bowelMovementsName,
    this.bowelMovementsHeader,
    this.bowelMovementsConsistencyName,
    this.bowelMovementsConsistencyMin,
    this.bowelMovementsConsistencyMax,
    this.bristolRating1,
    this.bristolRating2,
    this.bristolRating3,
    this.bristolRating4,
    this.bristolRating5,
    this.bristolRating6,
    this.bristolRating7,
    this.bowelMovementsUrgencyName,
    this.bowelMovementsDescription,
    this.bowelMovementsUrgencyMin,
    this.bowelMovementsUrgencyMax,
    this.bowelUrgencyRating1,
    this.bowelUrgencyRating2,
    this.bowelUrgencyRating3,
    this.bowelUrgencyRating4,
    this.bowelMovementsColorName,
    this.bowelMovementsColorDescription,
    this.bowelColorGreenBlack,
    this.brightGreen,
    this.peanutButter,
    this.bowelColorRed,
    this.bowelColorDarkGreen,
    this.bowelColorBrown,
    this.bowelColorMediumBrown,
    this.bowelColorStreaksRed,
    this.bowelColorYellowGreen,
    this.bowelColorChalkGrey,
    this.bowelMovementsReliefName,
    this.bowelMovementsReliefDescription,
    this.bowelReliefRating1,
    this.bowelReliefRating2,
    this.bowelReliefRating3,
    this.bowelReliefRating4,
    this.bowelMovementsReliefMin,
    this.bowelMovementsReliefMax,
    this.bowelMovementsReliefStrainingName,
    this.bowelMovementsReliefStrainingDescription,
    this.strainingAtDefecationTrue,
    this.strainingAtDefecationFalse,
    this.bowelMovementsNotesName,
    this.bowelMovementsNotesDescription,
    this.healthWellnessName,
    this.healthWellnessHeader,
    this.healthWellnessStressLevelName,
    this.healthWellnessStressLevelDescription,
    this.healthWellnessStressLevelRating1,
    this.healthWellnessStressLevelRating2,
    this.healthWellnessStressLevelRating3,
    this.healthWellnessStressLevelRating4,
    this.healthWellnessStressLevelMin,
    this.healthWellnessStressLevelMax,
    this.healthWellnessAnxietyLevelName,
    this.healthWellnessAnxietyLevelDescription,
    this.healthWellnessAnxietyLevelRating1,
    this.healthWellnessAnxietyLevelRating2,
    this.healthWellnessAnxietyLevelRating3,
    this.healthWellnessAnxietyLevelRating4,
    this.healthWellnessAnxietyLevelMin,
    this.healthWellnessAnxietyLevelMax,
    this.healthWellnessDepressionName,
    this.healthWellnessDepressionDescription,
    this.healthWellnessDepressionRating1,
    this.healthWellnessDepressionRating2,
    this.healthWellnessDepressionRating3,
    this.healthWellnessDepressionRating4,
    this.healthWellnessDepressionMin,
    this.healthWellnessDepressionMax,
    this.healthWellnessFatigueName,
    this.healthWellnessFatigueDescription,
    this.healthWellnessFatigueRating1,
    this.healthWellnessFatigueRating2,
    this.healthWellnessFatigueRating3,
    this.healthWellnessFatigueRating4,
    this.healthWellnessFatigueMin,
    this.healthWellnessFatigueMax,
    this.healthWellnessActivityLevelName,
    this.healthWellnessActivityLevelDescription,
    this.healthWellnessActivityLevelRating1,
    this.healthWellnessActivityLevelRating2,
    this.healthWellnessActivityLevelRating3,
    this.healthWellnessActivityLevelRating4,
    this.healthWellnessActivityLevelMin,
    this.healthWellnessActivityLevelMax,
    this.healthWellnessExerciseName,
    this.healthWellnessExerciseDescription,
    this.optionWalking,
    this.aerobicsDancing,
    this.optionRunning,
    this.optionCycling,
    this.hiking,
    this.optionTreadmill,
    this.optionSwimming,
    this.optionSports,
    this.optionWeightLifting,
    this.optionYoga,
    this.optionStationaryBike,
    this.optionEquipmentTraining,
    this.healthWellnessExerciseDurationName,
    this.healthWellnessExerciseDurationDescription,
    this.healthWellnessExerciseDurationLabel,
    this.healthWellnessRelaxationTechniquesName,
    this.healthWellnessRelaxationTechniquesDescription,
    this.healthWellnessSleepImprovementName,
    this.healthWellnessSleepImprovementDescription,
    this.healthWellnessSleepImprovementBedTimeName,
    this.healthWellnessSleepImprovementBedTimeDescription,
    this.healthWellnessSleepImprovementWakeTimeName,
    this.healthWellnessSleepImprovementWakeTimeDescription,
    this.healthWellnessSleepImprovementQualityName,
    this.healthWellnessSleepImprovementQualityDescription,
    this.optionSleptThrough,
    this.fewWakeups,
    this.optionRestless,
    this.healthWellnessSleepImprovementTirednessWakingName,
    this.healthWellnessSleepImprovementTirednessWakingDescription,
    this.healthWellnessTirednessWakingRating1,
    this.healthWellnessTirednessWakingRating2,
    this.healthWellnessTirednessWakingRating3,
    this.healthWellnessTirednessWakingRating4,
    this.healthWellnessSleepImprovementTirednessWakingMin,
    this.healthWellnessSleepImprovementTirednessWakingMax,
    this.healthWellnessNotesName,
    this.healthWellnessNotesDescription,
    this.foodName,
    this.foodHeader,
    this.foodMealName,
    this.optionBreakfast,
    this.optionLunch,
    this.optionDinner,
    this.optionSnacks,
    this.foodBreakfastEatName,
    this.foodBreakfastEatDescription,
    this.foodLunchEatName,
    this.foodLunchEatDescription,
    this.foodDinnerEatName,
    this.foodDinnerEatDescription,
    this.foodSnacksEatName,
    this.foodSnacksEatDescription,
    this.foodTagsMyBreakfastFoods,
    this.foodTagsMyLunchFood,
    this.foodTagsMyDinnerFood,
    this.foodTagsMySnacksFood,
    this.foodTagsLowFodmapName,
    this.foodTagsLowFodmapDescription,
    this.foodTagsPlaceholder,
    this.footTagsFodmapPlaceholder,
    this.foodHydrationName,
    this.foodHydrationDescription,
    this.foodNotesName,
    this.foodNotesDescription,
    this.tagDairy,
    this.tagGreasyFood,
    this.tagCaffeine,
    this.tagGluten,
    this.tagChocolate,
    this.tagAlcohol,
    this.tagMeat,
    this.tagWheat,
    this.tagBambooShoots,
    this.tagBeanSprouts,
    this.tagBroccoli,
    this.tagCabbage,
    this.tagRedCabbage,
    this.foodAddThis,
    this.medicationsName,
    this.medicationsHeader,
    this.medicationsPrescriptionName,
    this.medicationsPrescriptionDescription,
    this.medicationsPrescriptionMedicationName,
    this.medicationsPrescriptionMedicationDescription,
    this.medicationsOtherName,
    this.medicationsOtherDescription,
    this.medicationsOtherMyMedications,
    this.medicationsAddThis,
    this.medicationsTagsPlaceholder,
    this.medicationsNoteName,
    this.medicationsNoteDescription,
    this.journalName,
    this.journalHeader,
    this.journalEntryName,
    this.journalEntryDescription,
    this.errCharacterLimit,
    this.version,
  });

  String id;
  String lang;
  String symptomsName;
  String symptomsHeader;
  String symptomsAbdominalPainName;
  String symptomsAbdominalPainDescription;
  String abdominalPainRating1;
  String abdominalPainRating2;
  String abdominalPainRating3;
  String abdominalPainRating4;
  String symptomsAbdominalPainMin;
  String symptomsAbdominalPainMax;
  String symptomsAbdominalPainDescribeFeelName;
  String symptomsAbdominalPainDescribeFeelDescription;
  String optionGassyGut;
  String optionPunchStomach;
  String optionHeavyFeeling;
  String optionCloggedUp;
  String optionVolcanoStomach;
  String optionPainRazors;
  String optionBurningSensation;
  String optionGutWringing;
  String optionStomachKnots;
  String optionSharpPains;
  String optionRollingSensation;
  String optionNausea;
  String symptomsAbdominalPainDurationName;
  String symptomsAbdominalPainDescribeFeelingDescription;
  String optionLessThan1Hr;
  String option12Hrs;
  String optionMoreThan2Hrs;
  String symptomsBloatingName;
  String symptomsBloatingDescription;
  String bloatingRating1;
  String bloatingRating2;
  String bloatingRating3;
  String bloatingRating4;
  String symptomsBloatingMin;
  String symptomsBloatingMax;
  String symptomsBloatingDescribeFeelName;
  String symptomsBloatigDescribeFeelDescription;
  String symptomsBloatingBloatingDurationName;
  String symptomsBloatingBloatingDurationDescription;
  String symptomsNotesName;
  String symptomsNotesDescription;
  String bowelMovementsName;
  String bowelMovementsHeader;
  String bowelMovementsConsistencyName;
  String bowelMovementsConsistencyMin;
  String bowelMovementsConsistencyMax;
  String bristolRating1;
  String bristolRating2;
  String bristolRating3;
  String bristolRating4;
  String bristolRating5;
  String bristolRating6;
  String bristolRating7;
  String bowelMovementsUrgencyName;
  String bowelMovementsDescription;
  String bowelMovementsUrgencyMin;
  String bowelMovementsUrgencyMax;
  String bowelUrgencyRating1;
  String bowelUrgencyRating2;
  String bowelUrgencyRating3;
  String bowelUrgencyRating4;
  String bowelMovementsColorName;
  String bowelMovementsColorDescription;
  String bowelColorGreenBlack;
  String brightGreen;
  String peanutButter;
  String bowelColorRed;
  String bowelColorDarkGreen;
  String bowelColorBrown;
  String bowelColorMediumBrown;
  String bowelColorStreaksRed;
  String bowelColorYellowGreen;
  String bowelColorChalkGrey;
  String bowelMovementsReliefName;
  String bowelMovementsReliefDescription;
  String bowelReliefRating1;
  String bowelReliefRating2;
  String bowelReliefRating3;
  String bowelReliefRating4;
  String bowelMovementsReliefMin;
  String bowelMovementsReliefMax;
  String bowelMovementsReliefStrainingName;
  String bowelMovementsReliefStrainingDescription;
  String strainingAtDefecationTrue;
  String strainingAtDefecationFalse;
  String bowelMovementsNotesName;
  String bowelMovementsNotesDescription;
  String healthWellnessName;
  String healthWellnessHeader;
  String healthWellnessStressLevelName;
  String healthWellnessStressLevelDescription;
  String healthWellnessStressLevelRating1;
  String healthWellnessStressLevelRating2;
  String healthWellnessStressLevelRating3;
  String healthWellnessStressLevelRating4;
  String healthWellnessStressLevelMin;
  String healthWellnessStressLevelMax;
  String healthWellnessAnxietyLevelName;
  String healthWellnessAnxietyLevelDescription;
  String healthWellnessAnxietyLevelRating1;
  String healthWellnessAnxietyLevelRating2;
  String healthWellnessAnxietyLevelRating3;
  String healthWellnessAnxietyLevelRating4;
  String healthWellnessAnxietyLevelMin;
  String healthWellnessAnxietyLevelMax;
  String healthWellnessDepressionName;
  String healthWellnessDepressionDescription;
  String healthWellnessDepressionRating1;
  String healthWellnessDepressionRating2;
  String healthWellnessDepressionRating3;
  String healthWellnessDepressionRating4;
  String healthWellnessDepressionMin;
  String healthWellnessDepressionMax;
  String healthWellnessFatigueName;
  String healthWellnessFatigueDescription;
  String healthWellnessFatigueRating1;
  String healthWellnessFatigueRating2;
  String healthWellnessFatigueRating3;
  String healthWellnessFatigueRating4;
  String healthWellnessFatigueMin;
  String healthWellnessFatigueMax;
  String healthWellnessActivityLevelName;
  String healthWellnessActivityLevelDescription;
  String healthWellnessActivityLevelRating1;
  String healthWellnessActivityLevelRating2;
  String healthWellnessActivityLevelRating3;
  String healthWellnessActivityLevelRating4;
  String healthWellnessActivityLevelMin;
  String healthWellnessActivityLevelMax;
  String healthWellnessExerciseName;
  String healthWellnessExerciseDescription;
  String optionWalking;
  String aerobicsDancing;
  String optionRunning;
  String optionCycling;
  String hiking;
  String optionTreadmill;
  String optionSwimming;
  String optionSports;
  String optionWeightLifting;
  String optionYoga;
  String optionStationaryBike;
  String optionEquipmentTraining;
  String healthWellnessExerciseDurationName;
  String healthWellnessExerciseDurationDescription;
  String healthWellnessExerciseDurationLabel;
  String healthWellnessRelaxationTechniquesName;
  String healthWellnessRelaxationTechniquesDescription;
  String healthWellnessSleepImprovementName;
  String healthWellnessSleepImprovementDescription;
  String healthWellnessSleepImprovementBedTimeName;
  String healthWellnessSleepImprovementBedTimeDescription;
  String healthWellnessSleepImprovementWakeTimeName;
  String healthWellnessSleepImprovementWakeTimeDescription;
  String healthWellnessSleepImprovementQualityName;
  String healthWellnessSleepImprovementQualityDescription;
  String optionSleptThrough;
  String fewWakeups;
  String optionRestless;
  String healthWellnessSleepImprovementTirednessWakingName;
  String healthWellnessSleepImprovementTirednessWakingDescription;
  String healthWellnessTirednessWakingRating1;
  String healthWellnessTirednessWakingRating2;
  String healthWellnessTirednessWakingRating3;
  String healthWellnessTirednessWakingRating4;
  String healthWellnessSleepImprovementTirednessWakingMin;
  String healthWellnessSleepImprovementTirednessWakingMax;
  String healthWellnessNotesName;
  String healthWellnessNotesDescription;
  String foodName;
  String foodHeader;
  String foodMealName;
  String optionBreakfast;
  String optionLunch;
  String optionDinner;
  String optionSnacks;
  String foodBreakfastEatName;
  String foodBreakfastEatDescription;
  String foodLunchEatName;
  String foodLunchEatDescription;
  String foodDinnerEatName;
  String foodDinnerEatDescription;
  String foodSnacksEatName;
  String foodSnacksEatDescription;
  String foodTagsMyBreakfastFoods;
  String foodTagsMyLunchFood;
  String foodTagsMyDinnerFood;
  String foodTagsMySnacksFood;
  String foodTagsLowFodmapName;
  String foodTagsLowFodmapDescription;
  String foodTagsPlaceholder;
  String footTagsFodmapPlaceholder;
  String foodHydrationName;
  String foodHydrationDescription;
  String foodNotesName;
  String foodNotesDescription;
  String tagDairy;
  String tagGreasyFood;
  String tagCaffeine;
  String tagGluten;
  String tagChocolate;
  String tagAlcohol;
  String tagMeat;
  String tagWheat;
  String tagBambooShoots;
  String tagBeanSprouts;
  String tagBroccoli;
  String tagCabbage;
  String tagRedCabbage;
  String foodAddThis;
  String medicationsName;
  String medicationsHeader;
  String medicationsPrescriptionName;
  String medicationsPrescriptionDescription;
  String medicationsPrescriptionMedicationName;
  String medicationsPrescriptionMedicationDescription;
  String medicationsOtherName;
  String medicationsOtherDescription;
  String medicationsOtherMyMedications;
  String medicationsAddThis;
  String medicationsTagsPlaceholder;
  String medicationsNoteName;
  String medicationsNoteDescription;
  String journalName;
  String journalHeader;
  String journalEntryName;
  String journalEntryDescription;
  String errCharacterLimit;
  int version;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["_id"] == null ? null : json["_id"],
    lang: json["lang"] == null ? null : json["lang"],
    symptomsName: json["symptoms_name"] == null ? null : json["symptoms_name"],
    symptomsHeader: json["symptoms_header"] == null ? null : json["symptoms_header"],
    symptomsAbdominalPainName: json["symptoms-abdominal_pain_name"] == null ? null : json["symptoms-abdominal_pain_name"],
    symptomsAbdominalPainDescription: json["symptoms-abdominal_pain_description"] == null ? null : json["symptoms-abdominal_pain_description"],
    abdominalPainRating1: json["abdominal_pain_rating_1"] == null ? null : json["abdominal_pain_rating_1"],
    abdominalPainRating2: json["abdominal_pain_rating_2"] == null ? null : json["abdominal_pain_rating_2"],
    abdominalPainRating3: json["abdominal_pain_rating_3"] == null ? null : json["abdominal_pain_rating_3"],
    abdominalPainRating4: json["abdominal_pain_rating_4"] == null ? null : json["abdominal_pain_rating_4"],
    symptomsAbdominalPainMin: json["symptoms-abdominal_pain_min"] == null ? null : json["symptoms-abdominal_pain_min"],
    symptomsAbdominalPainMax: json["symptoms-abdominal_pain_max"] == null ? null : json["symptoms-abdominal_pain_max"],
    symptomsAbdominalPainDescribeFeelName: json["symptoms-abdominal_pain-describe_feel_name"] == null ? null : json["symptoms-abdominal_pain-describe_feel_name"],
    symptomsAbdominalPainDescribeFeelDescription: json["symptoms-abdominal_pain-describe_feel_description"] == null ? null : json["symptoms-abdominal_pain-describe_feel_description"],
    optionGassyGut: json["option_gassy_gut"] == null ? null : json["option_gassy_gut"],
    optionPunchStomach: json["option_punch_stomach"] == null ? null : json["option_punch_stomach"],
    optionHeavyFeeling: json["option_heavy_feeling"] == null ? null : json["option_heavy_feeling"],
    optionCloggedUp: json["option_clogged_up"] == null ? null : json["option_clogged_up"],
    optionVolcanoStomach: json["option_volcano_stomach"] == null ? null : json["option_volcano_stomach"],
    optionPainRazors: json["option_pain_razors"] == null ? null : json["option_pain_razors"],
    optionBurningSensation: json["option_burning_sensation"] == null ? null : json["option_burning_sensation"],
    optionGutWringing: json["option_gut_wringing"] == null ? null : json["option_gut_wringing"],
    optionStomachKnots: json["option_stomach_knots"] == null ? null : json["option_stomach_knots"],
    optionSharpPains: json["option_sharp_pains"] == null ? null : json["option_sharp_pains"],
    optionRollingSensation: json["option_rolling_sensation"] == null ? null : json["option_rolling_sensation"],
    optionNausea: json["option_nausea"] == null ? null : json["option_nausea"],
    symptomsAbdominalPainDurationName: json["symptoms-abdominal_pain-duration_name"] == null ? null : json["symptoms-abdominal_pain-duration_name"],
    symptomsAbdominalPainDescribeFeelingDescription: json["symptoms-abdominal_pain_describe_feeling_description"] == null ? null : json["symptoms-abdominal_pain_describe_feeling_description"],
    optionLessThan1Hr: json["option_less_than_1hr"] == null ? null : json["option_less_than_1hr"],
    option12Hrs: json["option_1_2hrs"] == null ? null : json["option_1_2hrs"],
    optionMoreThan2Hrs: json["option_more_than_2hrs"] == null ? null : json["option_more_than_2hrs"],
    symptomsBloatingName: json["symptoms-bloating_name"] == null ? null : json["symptoms-bloating_name"],
    symptomsBloatingDescription: json["symptoms-bloating_description"] == null ? null : json["symptoms-bloating_description"],
    bloatingRating1: json["bloating_rating_1"] == null ? null : json["bloating_rating_1"],
    bloatingRating2: json["bloating_rating_2"] == null ? null : json["bloating_rating_2"],
    bloatingRating3: json["bloating_rating_3"] == null ? null : json["bloating_rating_3"],
    bloatingRating4: json["bloating_rating_4"] == null ? null : json["bloating_rating_4"],
    symptomsBloatingMin: json["symptoms-bloating_min"] == null ? null : json["symptoms-bloating_min"],
    symptomsBloatingMax: json["symptoms-bloating_max"] == null ? null : json["symptoms-bloating_max"],
    symptomsBloatingDescribeFeelName: json["symptoms-bloating-describe_feel_name"] == null ? null : json["symptoms-bloating-describe_feel_name"],
    symptomsBloatigDescribeFeelDescription: json["symptoms-bloatig-describe_feel_description"] == null ? null : json["symptoms-bloatig-describe_feel_description"],
    symptomsBloatingBloatingDurationName: json["symptoms-bloating-bloating_duration_name"] == null ? null : json["symptoms-bloating-bloating_duration_name"],
    symptomsBloatingBloatingDurationDescription: json["symptoms-bloating-bloating_duration_description"] == null ? null : json["symptoms-bloating-bloating_duration_description"],
    symptomsNotesName: json["symptoms-notes_name"] == null ? null : json["symptoms-notes_name"],
    symptomsNotesDescription: json["symptoms-notes_description"] == null ? null : json["symptoms-notes_description"],
    bowelMovementsName: json["bowelMovements_name"] == null ? null : json["bowelMovements_name"],
    bowelMovementsHeader: json["bowelMovements_header"] == null ? null : json["bowelMovements_header"],
    bowelMovementsConsistencyName: json["bowelMovements-consistency_name"] == null ? null : json["bowelMovements-consistency_name"],
    bowelMovementsConsistencyMin: json["bowelMovements-consistency_min"] == null ? null : json["bowelMovements-consistency_min"],
    bowelMovementsConsistencyMax: json["bowelMovements-consistency_max"] == null ? null : json["bowelMovements-consistency_max"],
    bristolRating1: json["bristol_rating_1"] == null ? null : json["bristol_rating_1"],
    bristolRating2: json["bristol_rating_2"] == null ? null : json["bristol_rating_2"],
    bristolRating3: json["bristol_rating_3"] == null ? null : json["bristol_rating_3"],
    bristolRating4: json["bristol_rating_4"] == null ? null : json["bristol_rating_4"],
    bristolRating5: json["bristol_rating_5"] == null ? null : json["bristol_rating_5"],
    bristolRating6: json["bristol_rating_6"] == null ? null : json["bristol_rating_6"],
    bristolRating7: json["bristol_rating_7"] == null ? null : json["bristol_rating_7"],
    bowelMovementsUrgencyName: json["bowelMovements-urgency_name"] == null ? null : json["bowelMovements-urgency_name"],
    bowelMovementsDescription: json["bowelMovements-description"] == null ? null : json["bowelMovements-description"],
    bowelMovementsUrgencyMin: json["bowelMovements-urgency_min"] == null ? null : json["bowelMovements-urgency_min"],
    bowelMovementsUrgencyMax: json["bowelMovements-urgency_max"] == null ? null : json["bowelMovements-urgency_max"],
    bowelUrgencyRating1: json["bowel_urgency_rating_1"] == null ? null : json["bowel_urgency_rating_1"],
    bowelUrgencyRating2: json["bowel_urgency_rating_2"] == null ? null : json["bowel_urgency_rating_2"],
    bowelUrgencyRating3: json["bowel_urgency_rating_3"] == null ? null : json["bowel_urgency_rating_3"],
    bowelUrgencyRating4: json["bowel_urgency_rating_4"] == null ? null : json["bowel_urgency_rating_4"],
    bowelMovementsColorName: json["bowelMovements-color_name"] == null ? null : json["bowelMovements-color_name"],
    bowelMovementsColorDescription: json["bowelMovements-color_description"] == null ? null : json["bowelMovements-color_description"],
    bowelColorGreenBlack: json["bowel_color_green_black"] == null ? null : json["bowel_color_green_black"],
    brightGreen: json["bright_green"] == null ? null : json["bright_green"],
    peanutButter: json["peanut_butter"] == null ? null : json["peanut_butter"],
    bowelColorRed: json["bowel_color_red"] == null ? null : json["bowel_color_red"],
    bowelColorDarkGreen: json["bowel_color_dark_green"] == null ? null : json["bowel_color_dark_green"],
    bowelColorBrown: json["bowel_color_brown"] == null ? null : json["bowel_color_brown"],
    bowelColorMediumBrown: json["bowel_color_medium_brown"] == null ? null : json["bowel_color_medium_brown"],
    bowelColorStreaksRed: json["bowel_color_streaks_red"] == null ? null : json["bowel_color_streaks_red"],
    bowelColorYellowGreen: json["bowel_color_yellow_green"] == null ? null : json["bowel_color_yellow_green"],
    bowelColorChalkGrey: json["bowel_color_chalk_grey"] == null ? null : json["bowel_color_chalk_grey"],
    bowelMovementsReliefName: json["bowelMovements-relief_name"] == null ? null : json["bowelMovements-relief_name"],
    bowelMovementsReliefDescription: json["bowelMovements-relief_description"] == null ? null : json["bowelMovements-relief_description"],
    bowelReliefRating1: json["bowel_relief_rating_1"] == null ? null : json["bowel_relief_rating_1"],
    bowelReliefRating2: json["bowel_relief_rating_2"] == null ? null : json["bowel_relief_rating_2"],
    bowelReliefRating3: json["bowel_relief_rating_3"] == null ? null : json["bowel_relief_rating_3"],
    bowelReliefRating4: json["bowel_relief_rating_4"] == null ? null : json["bowel_relief_rating_4"],
    bowelMovementsReliefMin: json["bowelMovements-relief_min"] == null ? null : json["bowelMovements-relief_min"],
    bowelMovementsReliefMax: json["bowelMovements-relief_max"] == null ? null : json["bowelMovements-relief_max"],
    bowelMovementsReliefStrainingName: json["bowelMovements-relief-straining_name"] == null ? null : json["bowelMovements-relief-straining_name"],
    bowelMovementsReliefStrainingDescription: json["bowelMovements-relief-straining_description"] == null ? null : json["bowelMovements-relief-straining_description"],
    strainingAtDefecationTrue: json["straining_at_defecation_true"] == null ? null : json["straining_at_defecation_true"],
    strainingAtDefecationFalse: json["straining_at_defecation_false"] == null ? null : json["straining_at_defecation_false"],
    bowelMovementsNotesName: json["bowelMovements-notes_name"] == null ? null : json["bowelMovements-notes_name"],
    bowelMovementsNotesDescription: json["bowelMovements-notes_description"] == null ? null : json["bowelMovements-notes_description"],
    healthWellnessName: json["healthWellness_name"] == null ? null : json["healthWellness_name"],
    healthWellnessHeader: json["healthWellness_header"] == null ? null : json["healthWellness_header"],
    healthWellnessStressLevelName: json["healthWellness-stress_level_name"] == null ? null : json["healthWellness-stress_level_name"],
    healthWellnessStressLevelDescription: json["healthWellness-stress_level_description"] == null ? null : json["healthWellness-stress_level_description"],
    healthWellnessStressLevelRating1: json["healthWellness_stress_level_rating_1"] == null ? null : json["healthWellness_stress_level_rating_1"],
    healthWellnessStressLevelRating2: json["healthWellness_stress_level_rating_2"] == null ? null : json["healthWellness_stress_level_rating_2"],
    healthWellnessStressLevelRating3: json["healthWellness_stress_level_rating_3"] == null ? null : json["healthWellness_stress_level_rating_3"],
    healthWellnessStressLevelRating4: json["healthWellness_stress_level_rating_4"] == null ? null : json["healthWellness_stress_level_rating_4"],
    healthWellnessStressLevelMin: json["healthWellness-stress_level_min"] == null ? null : json["healthWellness-stress_level_min"],
    healthWellnessStressLevelMax: json["healthWellness-stress_level_max"] == null ? null : json["healthWellness-stress_level_max"],
    healthWellnessAnxietyLevelName: json["healthWellness-anxiety_level_name"] == null ? null : json["healthWellness-anxiety_level_name"],
    healthWellnessAnxietyLevelDescription: json["healthWellness-anxiety_level_description"] == null ? null : json["healthWellness-anxiety_level_description"],
    healthWellnessAnxietyLevelRating1: json["healthWellness_anxiety_level_rating_1"] == null ? null : json["healthWellness_anxiety_level_rating_1"],
    healthWellnessAnxietyLevelRating2: json["healthWellness_anxiety_level_rating_2"] == null ? null : json["healthWellness_anxiety_level_rating_2"],
    healthWellnessAnxietyLevelRating3: json["healthWellness_anxiety_level_rating_3"] == null ? null : json["healthWellness_anxiety_level_rating_3"],
    healthWellnessAnxietyLevelRating4: json["healthWellness_anxiety_level_rating_4"] == null ? null : json["healthWellness_anxiety_level_rating_4"],
    healthWellnessAnxietyLevelMin: json["healthWellness-anxiety_level_min"] == null ? null : json["healthWellness-anxiety_level_min"],
    healthWellnessAnxietyLevelMax: json["healthWellness-anxiety_level_max"] == null ? null : json["healthWellness-anxiety_level_max"],
    healthWellnessDepressionName: json["healthWellness-depression_name"] == null ? null : json["healthWellness-depression_name"],
    healthWellnessDepressionDescription: json["healthWellness-depression_description"] == null ? null : json["healthWellness-depression_description"],
    healthWellnessDepressionRating1: json["healthWellness_depression_rating_1"] == null ? null : json["healthWellness_depression_rating_1"],
    healthWellnessDepressionRating2: json["healthWellness_depression_rating_2"] == null ? null : json["healthWellness_depression_rating_2"],
    healthWellnessDepressionRating3: json["healthWellness_depression_rating_3"] == null ? null : json["healthWellness_depression_rating_3"],
    healthWellnessDepressionRating4: json["healthWellness_depression_rating_4"] == null ? null : json["healthWellness_depression_rating_4"],
    healthWellnessDepressionMin: json["healthWellness-depression_min"] == null ? null : json["healthWellness-depression_min"],
    healthWellnessDepressionMax: json["healthWellness-depression_max"] == null ? null : json["healthWellness-depression_max"],
    healthWellnessFatigueName: json["healthWellness-fatigue_name"] == null ? null : json["healthWellness-fatigue_name"],
    healthWellnessFatigueDescription: json["healthWellness-fatigue_description"] == null ? null : json["healthWellness-fatigue_description"],
    healthWellnessFatigueRating1: json["healthWellness_fatigue_rating_1"] == null ? null : json["healthWellness_fatigue_rating_1"],
    healthWellnessFatigueRating2: json["healthWellness_fatigue_rating_2"] == null ? null : json["healthWellness_fatigue_rating_2"],
    healthWellnessFatigueRating3: json["healthWellness_fatigue_rating_3"] == null ? null : json["healthWellness_fatigue_rating_3"],
    healthWellnessFatigueRating4: json["healthWellness_fatigue_rating_4"] == null ? null : json["healthWellness_fatigue_rating_4"],
    healthWellnessFatigueMin: json["healthWellness-fatigue_min"] == null ? null : json["healthWellness-fatigue_min"],
    healthWellnessFatigueMax: json["healthWellness-fatigue_max"] == null ? null : json["healthWellness-fatigue_max"],
    healthWellnessActivityLevelName: json["healthWellness-activity_level_name"] == null ? null : json["healthWellness-activity_level_name"],
    healthWellnessActivityLevelDescription: json["healthWellness-activity_level_description"] == null ? null : json["healthWellness-activity_level_description"],
    healthWellnessActivityLevelRating1: json["healthWellness_activity_level_rating_1"] == null ? null : json["healthWellness_activity_level_rating_1"],
    healthWellnessActivityLevelRating2: json["healthWellness_activity_level_rating_2"] == null ? null : json["healthWellness_activity_level_rating_2"],
    healthWellnessActivityLevelRating3: json["healthWellness_activity_level_rating_3"] == null ? null : json["healthWellness_activity_level_rating_3"],
    healthWellnessActivityLevelRating4: json["healthWellness_activity_level_rating_4"] == null ? null : json["healthWellness_activity_level_rating_4"],
    healthWellnessActivityLevelMin: json["healthWellness-activity_level_min"] == null ? null : json["healthWellness-activity_level_min"],
    healthWellnessActivityLevelMax: json["healthWellness-activity_level_max"] == null ? null : json["healthWellness-activity_level_max"],
    healthWellnessExerciseName: json["healthWellness-exercise_name"] == null ? null : json["healthWellness-exercise_name"],
    healthWellnessExerciseDescription: json["healthWellness-exercise_description"] == null ? null : json["healthWellness-exercise_description"],
    optionWalking: json["option_walking"] == null ? null : json["option_walking"],
    aerobicsDancing: json["aerobics_dancing"] == null ? null : json["aerobics_dancing"],
    optionRunning: json["option_running"] == null ? null : json["option_running"],
    optionCycling: json["option_cycling"] == null ? null : json["option_cycling"],
    hiking: json["hiking"] == null ? null : json["hiking"],
    optionTreadmill: json["option_treadmill"] == null ? null : json["option_treadmill"],
    optionSwimming: json["option_swimming"] == null ? null : json["option_swimming"],
    optionSports: json["option_sports"] == null ? null : json["option_sports"],
    optionWeightLifting: json["option_weight_lifting"] == null ? null : json["option_weight_lifting"],
    optionYoga: json["option_yoga"] == null ? null : json["option_yoga"],
    optionStationaryBike: json["option_stationary_bike"] == null ? null : json["option_stationary_bike"],
    optionEquipmentTraining: json["option_equipment_training"] == null ? null : json["option_equipment_training"],
    healthWellnessExerciseDurationName: json["healthWellness-exercise-duration_name"] == null ? null : json["healthWellness-exercise-duration_name"],
    healthWellnessExerciseDurationDescription: json["healthWellness-exercise-duration_description"] == null ? null : json["healthWellness-exercise-duration_description"],
    healthWellnessExerciseDurationLabel: json["healthWellness-exercise-duration_label"] == null ? null : json["healthWellness-exercise-duration_label"],
    healthWellnessRelaxationTechniquesName: json["healthWellness-relaxation_techniques_name"] == null ? null : json["healthWellness-relaxation_techniques_name"],
    healthWellnessRelaxationTechniquesDescription: json["healthWellness-relaxation_techniques_description"] == null ? null : json["healthWellness-relaxation_techniques_description"],
    healthWellnessSleepImprovementName: json["healthWellness-sleepImprovement_name"] == null ? null : json["healthWellness-sleepImprovement_name"],
    healthWellnessSleepImprovementDescription: json["healthWellness-sleepImprovement_description"] == null ? null : json["healthWellness-sleepImprovement_description"],
    healthWellnessSleepImprovementBedTimeName: json["healthWellness-sleepImprovement-bed_time_name"] == null ? null : json["healthWellness-sleepImprovement-bed_time_name"],
    healthWellnessSleepImprovementBedTimeDescription: json["healthWellness-sleepImprovement-bed_time_description"] == null ? null : json["healthWellness-sleepImprovement-bed_time_description"],
    healthWellnessSleepImprovementWakeTimeName: json["healthWellness-sleepImprovement-wake_time_name"] == null ? null : json["healthWellness-sleepImprovement-wake_time_name"],
    healthWellnessSleepImprovementWakeTimeDescription: json["healthWellness-sleepImprovement-wake_time_description"] == null ? null : json["healthWellness-sleepImprovement-wake_time_description"],
    healthWellnessSleepImprovementQualityName: json["healthWellness-sleepImprovement-quality_name"] == null ? null : json["healthWellness-sleepImprovement-quality_name"],
    healthWellnessSleepImprovementQualityDescription: json["healthWellness-sleepImprovement-quality_description"] == null ? null : json["healthWellness-sleepImprovement-quality_description"],
    optionSleptThrough: json["option_slept_through"] == null ? null : json["option_slept_through"],
    fewWakeups: json["few_wakeups"] == null ? null : json["few_wakeups"],
    optionRestless: json["option_restless"] == null ? null : json["option_restless"],
    healthWellnessSleepImprovementTirednessWakingName: json["healthWellness-sleepImprovement-tiredness_waking_name"] == null ? null : json["healthWellness-sleepImprovement-tiredness_waking_name"],
    healthWellnessSleepImprovementTirednessWakingDescription: json["healthWellness-sleepImprovement-tiredness_waking_description"] == null ? null : json["healthWellness-sleepImprovement-tiredness_waking_description"],
    healthWellnessTirednessWakingRating1: json["healthWellness_tiredness_waking_rating_1"] == null ? null : json["healthWellness_tiredness_waking_rating_1"],
    healthWellnessTirednessWakingRating2: json["healthWellness_tiredness_waking_rating_2"] == null ? null : json["healthWellness_tiredness_waking_rating_2"],
    healthWellnessTirednessWakingRating3: json["healthWellness_tiredness_waking_rating_3"] == null ? null : json["healthWellness_tiredness_waking_rating_3"],
    healthWellnessTirednessWakingRating4: json["healthWellness_tiredness_waking_rating_4"] == null ? null : json["healthWellness_tiredness_waking_rating_4"],
    healthWellnessSleepImprovementTirednessWakingMin: json["healthWellness-sleepImprovement-tiredness_waking_min"] == null ? null : json["healthWellness-sleepImprovement-tiredness_waking_min"],
    healthWellnessSleepImprovementTirednessWakingMax: json["healthWellness-sleepImprovement-tiredness_waking_max"] == null ? null : json["healthWellness-sleepImprovement-tiredness_waking_max"],
    healthWellnessNotesName: json["healthWellness-notes_name"] == null ? null : json["healthWellness-notes_name"],
    healthWellnessNotesDescription: json["healthWellness-notes_description"] == null ? null : json["healthWellness-notes_description"],
    foodName: json["food_name"] == null ? null : json["food_name"],
    foodHeader: json["food_header"] == null ? null : json["food_header"],
    foodMealName: json["food-meal_name"] == null ? null : json["food-meal_name"],
    optionBreakfast: json["option_breakfast"] == null ? null : json["option_breakfast"],
    optionLunch: json["option_lunch"] == null ? null : json["option_lunch"],
    optionDinner: json["option_dinner"] == null ? null : json["option_dinner"],
    optionSnacks: json["option_snacks"] == null ? null : json["option_snacks"],
    foodBreakfastEatName: json["food-breakfast_eat_name"] == null ? null : json["food-breakfast_eat_name"],
    foodBreakfastEatDescription: json["food-breakfast_eat_description"] == null ? null : json["food-breakfast_eat_description"],
    foodLunchEatName: json["food-lunch_eat_name"] == null ? null : json["food-lunch_eat_name"],
    foodLunchEatDescription: json["food-lunch_eat_description"] == null ? null : json["food-lunch_eat_description"],
    foodDinnerEatName: json["food-dinner_eat_name"] == null ? null : json["food-dinner_eat_name"],
    foodDinnerEatDescription: json["food-dinner_eat_description"] == null ? null : json["food-dinner_eat_description"],
    foodSnacksEatName: json["food-snacks_eat_name"] == null ? null : json["food-snacks_eat_name"],
    foodSnacksEatDescription: json["food-snacks_eat_description"] == null ? null : json["food-snacks_eat_description"],
    foodTagsMyBreakfastFoods: json["food-tags-my_breakfast_foods"] == null ? null : json["food-tags-my_breakfast_foods"],
    foodTagsMyLunchFood: json["food-tags-my_lunch_food"] == null ? null : json["food-tags-my_lunch_food"],
    foodTagsMyDinnerFood: json["food-tags-my_dinner_food"] == null ? null : json["food-tags-my_dinner_food"],
    foodTagsMySnacksFood: json["food-tags-my_snacks_food"] == null ? null : json["food-tags-my_snacks_food"],
    foodTagsLowFodmapName: json["food-tags-low_fodmap_name"] == null ? null : json["food-tags-low_fodmap_name"],
    foodTagsLowFodmapDescription: json["food-tags-low_fodmap_description"] == null ? null : json["food-tags-low_fodmap_description"],
    foodTagsPlaceholder: json["food-tags-placeholder"] == null ? null : json["food-tags-placeholder"],
    footTagsFodmapPlaceholder: json["foot-tags-fodmap-placeholder"] == null ? null : json["foot-tags-fodmap-placeholder"],
    foodHydrationName: json["food-hydration_name"] == null ? null : json["food-hydration_name"],
    foodHydrationDescription: json["food-hydration_description"] == null ? null : json["food-hydration_description"],
    foodNotesName: json["food-notes_name"] == null ? null : json["food-notes_name"],
    foodNotesDescription: json["food-notes_description"] == null ? null : json["food-notes_description"],
    tagDairy: json["tag_dairy"] == null ? null : json["tag_dairy"],
    tagGreasyFood: json["tag_greasy_food"] == null ? null : json["tag_greasy_food"],
    tagCaffeine: json["tag_caffeine"] == null ? null : json["tag_caffeine"],
    tagGluten: json["tag_gluten"] == null ? null : json["tag_gluten"],
    tagChocolate: json["tag_chocolate"] == null ? null : json["tag_chocolate"],
    tagAlcohol: json["tag_alcohol"] == null ? null : json["tag_alcohol"],
    tagMeat: json["tag_meat"] == null ? null : json["tag_meat"],
    tagWheat: json["tag_wheat"] == null ? null : json["tag_wheat"],
    tagBambooShoots: json["tag_bamboo_shoots"] == null ? null : json["tag_bamboo_shoots"],
    tagBeanSprouts: json["tag_bean_sprouts"] == null ? null : json["tag_bean_sprouts"],
    tagBroccoli: json["tag_broccoli"] == null ? null : json["tag_broccoli"],
    tagCabbage: json["tag_cabbage"] == null ? null : json["tag_cabbage"],
    tagRedCabbage: json["tag_red_cabbage"] == null ? null : json["tag_red_cabbage"],
    foodAddThis: json["food-add-this"] == null ? null : json["food-add-this"],
    medicationsName: json["medications_name"] == null ? null : json["medications_name"],
    medicationsHeader: json["medications_header"] == null ? null : json["medications_header"],
    medicationsPrescriptionName: json["medications-prescription_name"] == null ? null : json["medications-prescription_name"],
    medicationsPrescriptionDescription: json["medications-prescription_description"] == null ? null : json["medications-prescription_description"],
    medicationsPrescriptionMedicationName: json["medications-prescription_medication_name"] == null ? null : json["medications-prescription_medication_name"],
    medicationsPrescriptionMedicationDescription: json["medications-prescription_medication_description"] == null ? null : json["medications-prescription_medication_description"],
    medicationsOtherName: json["medications-other_name"] == null ? null : json["medications-other_name"],
    medicationsOtherDescription: json["medications-other_description"] == null ? null : json["medications-other_description"],
    medicationsOtherMyMedications: json["medications-other-my_medications"] == null ? null : json["medications-other-my_medications"],
    medicationsAddThis: json["medications-add-this"] == null ? null : json["medications-add-this"],
    medicationsTagsPlaceholder: json["medications-tags-placeholder"] == null ? null : json["medications-tags-placeholder"],
    medicationsNoteName: json["medications-note_name"] == null ? null : json["medications-note_name"],
    medicationsNoteDescription: json["medications-note_description"] == null ? null : json["medications-note_description"],
    journalName: json["journal_name"] == null ? null : json["journal_name"],
    journalHeader: json["journal_header"] == null ? null : json["journal_header"],
    journalEntryName: json["journal-entry_name"] == null ? null : json["journal-entry_name"],
    journalEntryDescription: json["journal-entry_description"] == null ? null : json["journal-entry_description"],
    errCharacterLimit: json["err_character_limit"] == null ? null : json["err_character_limit"],
    version: json["version"] == null ? null : json["version"],
  );

  Map<String, String> toJson() => {
    "_id": id == null ? null : id,
    "lang": lang == null ? null : lang,
    "symptoms_name": symptomsName == null ? null : symptomsName,
    "symptoms_header": symptomsHeader == null ? null : symptomsHeader,
    "symptoms-abdominal_pain_name": symptomsAbdominalPainName == null ? null : symptomsAbdominalPainName,
    "symptoms-abdominal_pain_description": symptomsAbdominalPainDescription == null ? null : symptomsAbdominalPainDescription,
    "abdominal_pain_rating_1": abdominalPainRating1 == null ? null : abdominalPainRating1,
    "abdominal_pain_rating_2": abdominalPainRating2 == null ? null : abdominalPainRating2,
    "abdominal_pain_rating_3": abdominalPainRating3 == null ? null : abdominalPainRating3,
    "abdominal_pain_rating_4": abdominalPainRating4 == null ? null : abdominalPainRating4,
    "symptoms-abdominal_pain_min": symptomsAbdominalPainMin == null ? null : symptomsAbdominalPainMin,
    "symptoms-abdominal_pain_max": symptomsAbdominalPainMax == null ? null : symptomsAbdominalPainMax,
    "symptoms-abdominal_pain-describe_feel_name": symptomsAbdominalPainDescribeFeelName == null ? null : symptomsAbdominalPainDescribeFeelName,
    "symptoms-abdominal_pain-describe_feel_description": symptomsAbdominalPainDescribeFeelDescription == null ? null : symptomsAbdominalPainDescribeFeelDescription,
    "option_gassy_gut": optionGassyGut == null ? null : optionGassyGut,
    "option_punch_stomach": optionPunchStomach == null ? null : optionPunchStomach,
    "option_heavy_feeling": optionHeavyFeeling == null ? null : optionHeavyFeeling,
    "option_clogged_up": optionCloggedUp == null ? null : optionCloggedUp,
    "option_volcano_stomach": optionVolcanoStomach == null ? null : optionVolcanoStomach,
    "option_pain_razors": optionPainRazors == null ? null : optionPainRazors,
    "option_burning_sensation": optionBurningSensation == null ? null : optionBurningSensation,
    "option_gut_wringing": optionGutWringing == null ? null : optionGutWringing,
    "option_stomach_knots": optionStomachKnots == null ? null : optionStomachKnots,
    "option_sharp_pains": optionSharpPains == null ? null : optionSharpPains,
    "option_rolling_sensation": optionRollingSensation == null ? null : optionRollingSensation,
    "option_nausea": optionNausea == null ? null : optionNausea,
    "symptoms-abdominal_pain-duration_name": symptomsAbdominalPainDurationName == null ? null : symptomsAbdominalPainDurationName,
    "symptoms-abdominal_pain_describe_feeling_description": symptomsAbdominalPainDescribeFeelingDescription == null ? null : symptomsAbdominalPainDescribeFeelingDescription,
    "option_less_than_1hr": optionLessThan1Hr == null ? null : optionLessThan1Hr,
    "option_1_2hrs": option12Hrs == null ? null : option12Hrs,
    "option_more_than_2hrs": optionMoreThan2Hrs == null ? null : optionMoreThan2Hrs,
    "symptoms-bloating_name": symptomsBloatingName == null ? null : symptomsBloatingName,
    "symptoms-bloating_description": symptomsBloatingDescription == null ? null : symptomsBloatingDescription,
    "bloating_rating_1": bloatingRating1 == null ? null : bloatingRating1,
    "bloating_rating_2": bloatingRating2 == null ? null : bloatingRating2,
    "bloating_rating_3": bloatingRating3 == null ? null : bloatingRating3,
    "bloating_rating_4": bloatingRating4 == null ? null : bloatingRating4,
    "symptoms-bloating_min": symptomsBloatingMin == null ? null : symptomsBloatingMin,
    "symptoms-bloating_max": symptomsBloatingMax == null ? null : symptomsBloatingMax,
    "symptoms-bloating-describe_feel_name": symptomsBloatingDescribeFeelName == null ? null : symptomsBloatingDescribeFeelName,
    "symptoms-bloatig-describe_feel_description": symptomsBloatigDescribeFeelDescription == null ? null : symptomsBloatigDescribeFeelDescription,
    "symptoms-bloating-bloating_duration_name": symptomsBloatingBloatingDurationName == null ? null : symptomsBloatingBloatingDurationName,
    "symptoms-bloating-bloating_duration_description": symptomsBloatingBloatingDurationDescription == null ? null : symptomsBloatingBloatingDurationDescription,
    "symptoms-notes_name": symptomsNotesName == null ? null : symptomsNotesName,
    "symptoms-notes_description": symptomsNotesDescription == null ? null : symptomsNotesDescription,
    "bowelMovements_name": bowelMovementsName == null ? null : bowelMovementsName,
    "bowelMovements_header": bowelMovementsHeader == null ? null : bowelMovementsHeader,
    "bowelMovements-consistency_name": bowelMovementsConsistencyName == null ? null : bowelMovementsConsistencyName,
    "bowelMovements-consistency_min": bowelMovementsConsistencyMin == null ? null : bowelMovementsConsistencyMin,
    "bowelMovements-consistency_max": bowelMovementsConsistencyMax == null ? null : bowelMovementsConsistencyMax,
    "bristol_rating_1": bristolRating1 == null ? null : bristolRating1,
    "bristol_rating_2": bristolRating2 == null ? null : bristolRating2,
    "bristol_rating_3": bristolRating3 == null ? null : bristolRating3,
    "bristol_rating_4": bristolRating4 == null ? null : bristolRating4,
    "bristol_rating_5": bristolRating5 == null ? null : bristolRating5,
    "bristol_rating_6": bristolRating6 == null ? null : bristolRating6,
    "bristol_rating_7": bristolRating7 == null ? null : bristolRating7,
    "bowelMovements-urgency_name": bowelMovementsUrgencyName == null ? null : bowelMovementsUrgencyName,
    "bowelMovements-description": bowelMovementsDescription == null ? null : bowelMovementsDescription,
    "bowelMovements-urgency_min": bowelMovementsUrgencyMin == null ? null : bowelMovementsUrgencyMin,
    "bowelMovements-urgency_max": bowelMovementsUrgencyMax == null ? null : bowelMovementsUrgencyMax,
    "bowel_urgency_rating_1": bowelUrgencyRating1 == null ? null : bowelUrgencyRating1,
    "bowel_urgency_rating_2": bowelUrgencyRating2 == null ? null : bowelUrgencyRating2,
    "bowel_urgency_rating_3": bowelUrgencyRating3 == null ? null : bowelUrgencyRating3,
    "bowel_urgency_rating_4": bowelUrgencyRating4 == null ? null : bowelUrgencyRating4,
    "bowelMovements-color_name": bowelMovementsColorName == null ? null : bowelMovementsColorName,
    "bowelMovements-color_description": bowelMovementsColorDescription == null ? null : bowelMovementsColorDescription,
    "bowel_color_green_black": bowelColorGreenBlack == null ? null : bowelColorGreenBlack,
    "bright_green": brightGreen == null ? null : brightGreen,
    "peanut_butter": peanutButter == null ? null : peanutButter,
    "bowel_color_red": bowelColorRed == null ? null : bowelColorRed,
    "bowel_color_dark_green": bowelColorDarkGreen == null ? null : bowelColorDarkGreen,
    "bowel_color_brown": bowelColorBrown == null ? null : bowelColorBrown,
    "bowel_color_medium_brown": bowelColorMediumBrown == null ? null : bowelColorMediumBrown,
    "bowel_color_streaks_red": bowelColorStreaksRed == null ? null : bowelColorStreaksRed,
    "bowel_color_yellow_green": bowelColorYellowGreen == null ? null : bowelColorYellowGreen,
    "bowel_color_chalk_grey": bowelColorChalkGrey == null ? null : bowelColorChalkGrey,
    "bowelMovements-relief_name": bowelMovementsReliefName == null ? null : bowelMovementsReliefName,
    "bowelMovements-relief_description": bowelMovementsReliefDescription == null ? null : bowelMovementsReliefDescription,
    "bowel_relief_rating_1": bowelReliefRating1 == null ? null : bowelReliefRating1,
    "bowel_relief_rating_2": bowelReliefRating2 == null ? null : bowelReliefRating2,
    "bowel_relief_rating_3": bowelReliefRating3 == null ? null : bowelReliefRating3,
    "bowel_relief_rating_4": bowelReliefRating4 == null ? null : bowelReliefRating4,
    "bowelMovements-relief_min": bowelMovementsReliefMin == null ? null : bowelMovementsReliefMin,
    "bowelMovements-relief_max": bowelMovementsReliefMax == null ? null : bowelMovementsReliefMax,
    "bowelMovements-relief-straining_name": bowelMovementsReliefStrainingName == null ? null : bowelMovementsReliefStrainingName,
    "bowelMovements-relief-straining_description": bowelMovementsReliefStrainingDescription == null ? null : bowelMovementsReliefStrainingDescription,
    "straining_at_defecation_true": strainingAtDefecationTrue == null ? null : strainingAtDefecationTrue,
    "straining_at_defecation_false": strainingAtDefecationFalse == null ? null : strainingAtDefecationFalse,
    "bowelMovements-notes_name": bowelMovementsNotesName == null ? null : bowelMovementsNotesName,
    "bowelMovements-notes_description": bowelMovementsNotesDescription == null ? null : bowelMovementsNotesDescription,
    "healthWellness_name": healthWellnessName == null ? null : healthWellnessName,
    "healthWellness_header": healthWellnessHeader == null ? null : healthWellnessHeader,
    "healthWellness-stress_level_name": healthWellnessStressLevelName == null ? null : healthWellnessStressLevelName,
    "healthWellness-stress_level_description": healthWellnessStressLevelDescription == null ? null : healthWellnessStressLevelDescription,
    "healthWellness_stress_level_rating_1": healthWellnessStressLevelRating1 == null ? null : healthWellnessStressLevelRating1,
    "healthWellness_stress_level_rating_2": healthWellnessStressLevelRating2 == null ? null : healthWellnessStressLevelRating2,
    "healthWellness_stress_level_rating_3": healthWellnessStressLevelRating3 == null ? null : healthWellnessStressLevelRating3,
    "healthWellness_stress_level_rating_4": healthWellnessStressLevelRating4 == null ? null : healthWellnessStressLevelRating4,
    "healthWellness-stress_level_min": healthWellnessStressLevelMin == null ? null : healthWellnessStressLevelMin,
    "healthWellness-stress_level_max": healthWellnessStressLevelMax == null ? null : healthWellnessStressLevelMax,
    "healthWellness-anxiety_level_name": healthWellnessAnxietyLevelName == null ? null : healthWellnessAnxietyLevelName,
    "healthWellness-anxiety_level_description": healthWellnessAnxietyLevelDescription == null ? null : healthWellnessAnxietyLevelDescription,
    "healthWellness_anxiety_level_rating_1": healthWellnessAnxietyLevelRating1 == null ? null : healthWellnessAnxietyLevelRating1,
    "healthWellness_anxiety_level_rating_2": healthWellnessAnxietyLevelRating2 == null ? null : healthWellnessAnxietyLevelRating2,
    "healthWellness_anxiety_level_rating_3": healthWellnessAnxietyLevelRating3 == null ? null : healthWellnessAnxietyLevelRating3,
    "healthWellness_anxiety_level_rating_4": healthWellnessAnxietyLevelRating4 == null ? null : healthWellnessAnxietyLevelRating4,
    "healthWellness-anxiety_level_min": healthWellnessAnxietyLevelMin == null ? null : healthWellnessAnxietyLevelMin,
    "healthWellness-anxiety_level_max": healthWellnessAnxietyLevelMax == null ? null : healthWellnessAnxietyLevelMax,
    "healthWellness-depression_name": healthWellnessDepressionName == null ? null : healthWellnessDepressionName,
    "healthWellness-depression_description": healthWellnessDepressionDescription == null ? null : healthWellnessDepressionDescription,
    "healthWellness_depression_rating_1": healthWellnessDepressionRating1 == null ? null : healthWellnessDepressionRating1,
    "healthWellness_depression_rating_2": healthWellnessDepressionRating2 == null ? null : healthWellnessDepressionRating2,
    "healthWellness_depression_rating_3": healthWellnessDepressionRating3 == null ? null : healthWellnessDepressionRating3,
    "healthWellness_depression_rating_4": healthWellnessDepressionRating4 == null ? null : healthWellnessDepressionRating4,
    "healthWellness-depression_min": healthWellnessDepressionMin == null ? null : healthWellnessDepressionMin,
    "healthWellness-depression_max": healthWellnessDepressionMax == null ? null : healthWellnessDepressionMax,
    "healthWellness-fatigue_name": healthWellnessFatigueName == null ? null : healthWellnessFatigueName,
    "healthWellness-fatigue_description": healthWellnessFatigueDescription == null ? null : healthWellnessFatigueDescription,
    "healthWellness_fatigue_rating_1": healthWellnessFatigueRating1 == null ? null : healthWellnessFatigueRating1,
    "healthWellness_fatigue_rating_2": healthWellnessFatigueRating2 == null ? null : healthWellnessFatigueRating2,
    "healthWellness_fatigue_rating_3": healthWellnessFatigueRating3 == null ? null : healthWellnessFatigueRating3,
    "healthWellness_fatigue_rating_4": healthWellnessFatigueRating4 == null ? null : healthWellnessFatigueRating4,
    "healthWellness-fatigue_min": healthWellnessFatigueMin == null ? null : healthWellnessFatigueMin,
    "healthWellness-fatigue_max": healthWellnessFatigueMax == null ? null : healthWellnessFatigueMax,
    "healthWellness-activity_level_name": healthWellnessActivityLevelName == null ? null : healthWellnessActivityLevelName,
    "healthWellness-activity_level_description": healthWellnessActivityLevelDescription == null ? null : healthWellnessActivityLevelDescription,
    "healthWellness_activity_level_rating_1": healthWellnessActivityLevelRating1 == null ? null : healthWellnessActivityLevelRating1,
    "healthWellness_activity_level_rating_2": healthWellnessActivityLevelRating2 == null ? null : healthWellnessActivityLevelRating2,
    "healthWellness_activity_level_rating_3": healthWellnessActivityLevelRating3 == null ? null : healthWellnessActivityLevelRating3,
    "healthWellness_activity_level_rating_4": healthWellnessActivityLevelRating4 == null ? null : healthWellnessActivityLevelRating4,
    "healthWellness-activity_level_min": healthWellnessActivityLevelMin == null ? null : healthWellnessActivityLevelMin,
    "healthWellness-activity_level_max": healthWellnessActivityLevelMax == null ? null : healthWellnessActivityLevelMax,
    "healthWellness-exercise_name": healthWellnessExerciseName == null ? null : healthWellnessExerciseName,
    "healthWellness-exercise_description": healthWellnessExerciseDescription == null ? null : healthWellnessExerciseDescription,
    "option_walking": optionWalking == null ? null : optionWalking,
    "aerobics_dancing": aerobicsDancing == null ? null : aerobicsDancing,
    "option_running": optionRunning == null ? null : optionRunning,
    "option_cycling": optionCycling == null ? null : optionCycling,
    "hiking": hiking == null ? null : hiking,
    "option_treadmill": optionTreadmill == null ? null : optionTreadmill,
    "option_swimming": optionSwimming == null ? null : optionSwimming,
    "option_sports": optionSports == null ? null : optionSports,
    "option_weight_lifting": optionWeightLifting == null ? null : optionWeightLifting,
    "option_yoga": optionYoga == null ? null : optionYoga,
    "option_stationary_bike": optionStationaryBike == null ? null : optionStationaryBike,
    "option_equipment_training": optionEquipmentTraining == null ? null : optionEquipmentTraining,
    "healthWellness-exercise-duration_name": healthWellnessExerciseDurationName == null ? null : healthWellnessExerciseDurationName,
    "healthWellness-exercise-duration_description": healthWellnessExerciseDurationDescription == null ? null : healthWellnessExerciseDurationDescription,
    "healthWellness-exercise-duration_label": healthWellnessExerciseDurationLabel == null ? null : healthWellnessExerciseDurationLabel,
    "healthWellness-relaxation_techniques_name": healthWellnessRelaxationTechniquesName == null ? null : healthWellnessRelaxationTechniquesName,
    "healthWellness-relaxation_techniques_description": healthWellnessRelaxationTechniquesDescription == null ? null : healthWellnessRelaxationTechniquesDescription,
    "healthWellness-sleepImprovement_name": healthWellnessSleepImprovementName == null ? null : healthWellnessSleepImprovementName,
    "healthWellness-sleepImprovement_description": healthWellnessSleepImprovementDescription == null ? null : healthWellnessSleepImprovementDescription,
    "healthWellness-sleepImprovement-bed_time_name": healthWellnessSleepImprovementBedTimeName == null ? null : healthWellnessSleepImprovementBedTimeName,
    "healthWellness-sleepImprovement-bed_time_description": healthWellnessSleepImprovementBedTimeDescription == null ? null : healthWellnessSleepImprovementBedTimeDescription,
    "healthWellness-sleepImprovement-wake_time_name": healthWellnessSleepImprovementWakeTimeName == null ? null : healthWellnessSleepImprovementWakeTimeName,
    "healthWellness-sleepImprovement-wake_time_description": healthWellnessSleepImprovementWakeTimeDescription == null ? null : healthWellnessSleepImprovementWakeTimeDescription,
    "healthWellness-sleepImprovement-quality_name": healthWellnessSleepImprovementQualityName == null ? null : healthWellnessSleepImprovementQualityName,
    "healthWellness-sleepImprovement-quality_description": healthWellnessSleepImprovementQualityDescription == null ? null : healthWellnessSleepImprovementQualityDescription,
    "option_slept_through": optionSleptThrough == null ? null : optionSleptThrough,
    "few_wakeups": fewWakeups == null ? null : fewWakeups,
    "option_restless": optionRestless == null ? null : optionRestless,
    "healthWellness-sleepImprovement-tiredness_waking_name": healthWellnessSleepImprovementTirednessWakingName == null ? null : healthWellnessSleepImprovementTirednessWakingName,
    "healthWellness-sleepImprovement-tiredness_waking_description": healthWellnessSleepImprovementTirednessWakingDescription == null ? null : healthWellnessSleepImprovementTirednessWakingDescription,
    "healthWellness_tiredness_waking_rating_1": healthWellnessTirednessWakingRating1 == null ? null : healthWellnessTirednessWakingRating1,
    "healthWellness_tiredness_waking_rating_2": healthWellnessTirednessWakingRating2 == null ? null : healthWellnessTirednessWakingRating2,
    "healthWellness_tiredness_waking_rating_3": healthWellnessTirednessWakingRating3 == null ? null : healthWellnessTirednessWakingRating3,
    "healthWellness_tiredness_waking_rating_4": healthWellnessTirednessWakingRating4 == null ? null : healthWellnessTirednessWakingRating4,
    "healthWellness-sleepImprovement-tiredness_waking_min": healthWellnessSleepImprovementTirednessWakingMin == null ? null : healthWellnessSleepImprovementTirednessWakingMin,
    "healthWellness-sleepImprovement-tiredness_waking_max": healthWellnessSleepImprovementTirednessWakingMax == null ? null : healthWellnessSleepImprovementTirednessWakingMax,
    "healthWellness-notes_name": healthWellnessNotesName == null ? null : healthWellnessNotesName,
    "healthWellness-notes_description": healthWellnessNotesDescription == null ? null : healthWellnessNotesDescription,
    "food_name": foodName == null ? null : foodName,
    "food_header": foodHeader == null ? null : foodHeader,
    "food-meal_name": foodMealName == null ? null : foodMealName,
    "option_breakfast": optionBreakfast == null ? null : optionBreakfast,
    "option_lunch": optionLunch == null ? null : optionLunch,
    "option_dinner": optionDinner == null ? null : optionDinner,
    "option_snacks": optionSnacks == null ? null : optionSnacks,
    "food-breakfast_eat_name": foodBreakfastEatName == null ? null : foodBreakfastEatName,
    "food-breakfast_eat_description": foodBreakfastEatDescription == null ? null : foodBreakfastEatDescription,
    "food-lunch_eat_name": foodLunchEatName == null ? null : foodLunchEatName,
    "food-lunch_eat_description": foodLunchEatDescription == null ? null : foodLunchEatDescription,
    "food-dinner_eat_name": foodDinnerEatName == null ? null : foodDinnerEatName,
    "food-dinner_eat_description": foodDinnerEatDescription == null ? null : foodDinnerEatDescription,
    "food-snacks_eat_name": foodSnacksEatName == null ? null : foodSnacksEatName,
    "food-snacks_eat_description": foodSnacksEatDescription == null ? null : foodSnacksEatDescription,
    "food-tags-my_breakfast_foods": foodTagsMyBreakfastFoods == null ? null : foodTagsMyBreakfastFoods,
    "food-tags-my_lunch_food": foodTagsMyLunchFood == null ? null : foodTagsMyLunchFood,
    "food-tags-my_dinner_food": foodTagsMyDinnerFood == null ? null : foodTagsMyDinnerFood,
    "food-tags-my_snacks_food": foodTagsMySnacksFood == null ? null : foodTagsMySnacksFood,
    "food-tags-low_fodmap_name": foodTagsLowFodmapName == null ? null : foodTagsLowFodmapName,
    "food-tags-low_fodmap_description": foodTagsLowFodmapDescription == null ? null : foodTagsLowFodmapDescription,
    "food-tags-placeholder": foodTagsPlaceholder == null ? null : foodTagsPlaceholder,
    "foot-tags-fodmap-placeholder": footTagsFodmapPlaceholder == null ? null : footTagsFodmapPlaceholder,
    "food-hydration_name": foodHydrationName == null ? null : foodHydrationName,
    "food-hydration_description": foodHydrationDescription == null ? null : foodHydrationDescription,
    "food-notes_name": foodNotesName == null ? null : foodNotesName,
    "food-notes_description": foodNotesDescription == null ? null : foodNotesDescription,
    "tag_dairy": tagDairy == null ? null : tagDairy,
    "tag_greasy_food": tagGreasyFood == null ? null : tagGreasyFood,
    "tag_caffeine": tagCaffeine == null ? null : tagCaffeine,
    "tag_gluten": tagGluten == null ? null : tagGluten,
    "tag_chocolate": tagChocolate == null ? null : tagChocolate,
    "tag_alcohol": tagAlcohol == null ? null : tagAlcohol,
    "tag_meat": tagMeat == null ? null : tagMeat,
    "tag_wheat": tagWheat == null ? null : tagWheat,
    "tag_bamboo_shoots": tagBambooShoots == null ? null : tagBambooShoots,
    "tag_bean_sprouts": tagBeanSprouts == null ? null : tagBeanSprouts,
    "tag_broccoli": tagBroccoli == null ? null : tagBroccoli,
    "tag_cabbage": tagCabbage == null ? null : tagCabbage,
    "tag_red_cabbage": tagRedCabbage == null ? null : tagRedCabbage,
    "food-add-this": foodAddThis == null ? null : foodAddThis,
    "medications_name": medicationsName == null ? null : medicationsName,
    "medications_header": medicationsHeader == null ? null : medicationsHeader,
    "medications-prescription_name": medicationsPrescriptionName == null ? null : medicationsPrescriptionName,
    "medications-prescription_description": medicationsPrescriptionDescription == null ? null : medicationsPrescriptionDescription,
    "medications-prescription_medication_name": medicationsPrescriptionMedicationName == null ? null : medicationsPrescriptionMedicationName,
    "medications-prescription_medication_description": medicationsPrescriptionMedicationDescription == null ? null : medicationsPrescriptionMedicationDescription,
    "medications-other_name": medicationsOtherName == null ? null : medicationsOtherName,
    "medications-other_description": medicationsOtherDescription == null ? null : medicationsOtherDescription,
    "medications-other-my_medications": medicationsOtherMyMedications == null ? null : medicationsOtherMyMedications,
    "medications-add-this": medicationsAddThis == null ? null : medicationsAddThis,
    "medications-tags-placeholder": medicationsTagsPlaceholder == null ? null : medicationsTagsPlaceholder,
    "medications-note_name": medicationsNoteName == null ? null : medicationsNoteName,
    "medications-note_description": medicationsNoteDescription == null ? null : medicationsNoteDescription,
    "journal_name": journalName == null ? null : journalName,
    "journal_header": journalHeader == null ? null : journalHeader,
    "journal-entry_name": journalEntryName == null ? null : journalEntryName,
    "journal-entry_description": journalEntryDescription == null ? null : journalEntryDescription,
    "err_character_limit": errCharacterLimit == null ? null : errCharacterLimit,
    "version": version == null ? null : version.toString(),
  };
}
