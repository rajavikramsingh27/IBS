import 'package:flutter/material.dart';
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:flutter_ibs/models/TreatmentPlanModel/PostTreatmentPlanResponseModel.dart';
import 'package:flutter_ibs/models/TreatmentPlanModel/PostTreatmentPlanSendModel.dart';
import 'package:flutter_ibs/models/TreatmentPlanModel/TreatmentPlanModel.dart';
import 'package:flutter_ibs/models/TreatmentPlanModel/TreatmentPlanResponseModel.dart';
import 'package:flutter_ibs/utils/SnackBar.dart';
import 'package:flutter_ibs/widget/TreatmentPlanListWidget.dart';
import 'package:flutter_ibs/services/ServiceApi.dart';
import 'package:flutter_ibs/utils/ConnectionCheck.dart';
import 'package:get/get.dart';

class TreatmentPlanController extends GetxController {
  PageController pageController = PageController(initialPage: 0);
  RxDouble currentPage = 0.0.obs;
  RxInt selectedindex = 0.obs;
  RxBool connectionStatus = false.obs;
  RxBool loader = false.obs;
  RxList<TreatmentPlanItemData> treatmentPlanItemData =
      <TreatmentPlanItemData>[].obs;

  RxList<TagsDefault> selectedTags = <TagsDefault>[].obs;
  Rx<String> selectedCategory = "".obs;
  Rx<String> selectedTimeHours = "".obs;
  Rx<String> selectedTimeMinutes = "".obs;
  Rx<String> selectedDay = "".obs;

  RxList<Reminder> reminderList = <Reminder>[].obs;
  RxSet<String> listCategory = <String>{}.obs;
  TextEditingController noteTextController = TextEditingController();
  Rx<PostTreatmentPlanSendModel> treatmentPlanSendModel =
      PostTreatmentPlanSendModel().obs;
  RxList<TrackingSendData> listTrackData = <TrackingSendData>[].obs;
  RxList<dynamic> listTags = <dynamic>[].obs;
  RxList<ReminderSet> listReminderData = <ReminderSet>[].obs;
  @override
  void onInit() async {
    super.onInit();
    pageController.addListener(() {
      currentPage.value = pageController.page;
    });
    connectionStatus.value = true;
    bool isInternet = await ConnectionCheck().initConnectivity();
    connectionStatus.value = isInternet;
    getTreatmentPlanList();
  }

  getTreatmentPlanList() async {
    if (connectionStatus.value) {
      loader.value = true;
      await ServiceApi().getTreatmentPlan().then((value) {
        treatmentPlanItemData.value = value.data;
        treatmentPlanItemData.forEach((element) {
          listCategory.add(element.planCategory);
        });
      });
      loader.value = false;
    }
  }

  toTreatmentPlanListWidget({TreatmentPlanItemData data}) {
    clearData();
    Get.to(() => TreatmentPlanListWidget(
          data: data,
        ));
  }

  category(String value) {
    selectedCategory.value = value;
  }

  void onTagTapped({TagsDefault model}) {
    if (selectedTags.contains(model)) {
      selectedTags.remove(model);
    } else {
      selectedTags.add(model);
    }
  }

  void addReminder() {
    reminderList.add(Reminder(
        message: noteTextController.text,
        hour: int.parse(selectedTimeHours.value),
        minute: int.parse(selectedTimeMinutes.value),
        day: selectedDay.value));
  }

  clearData() {
    selectedTags = <TagsDefault>[].obs;
    selectedCategory = "".obs;
    selectedTimeHours = "".obs;
    selectedTimeMinutes = "".obs;
    selectedDay = "".obs;
    reminderList = <Reminder>[].obs;
    listCategory = <String>{}.obs;
    noteTextController.clear();
  }

  onSave() async {
    // if (treatmentPlanSendModel.value == null) {
    //   treatmentPlanSendModel.value.items = [];
    // }

    TrackingSendData trackTreatmentModel = TrackingSendData(
        category: selectedCategory.value,
        // tid: ,
        // kind: "tags",
        // dtype: "arr",
        value: TrackingValue(arr: ""));

    ReminderSet reminderSendModel = ReminderSet(
        message: noteTextController.text,
        time: "${selectedTimeHours.value}:${selectedTimeMinutes.value}",
        day: selectedDay.value);

    treatmentPlanSendModel.value.tags.add(selectedTags);
    treatmentPlanSendModel.value.trackingDefaults.add(trackTreatmentModel);
    treatmentPlanSendModel.value.reminders.add(reminderSendModel);
    treatmentPlanSendModel.refresh();

    print("data: ${treatmentPlanSendModel.toJson()}");
    // loader.value = true;
    // final data = await ServiceApi()
    //     .foodTrackApi(bodyData: treatmentPlanSendModel.toJson());
    // loader.value = false;
    // if (data is PostTreatmentPlanResponseModel) {
    //   Get.back();
    //   CustomSnackBar().successSnackBar(
    //       title: "Success", message: "Foods Added Successfully");
    // } else {
    //   loader.value = false;

    //   CustomSnackBar().errorSnackBar(title: "Error", message: data.message);
    // }
  }
}
