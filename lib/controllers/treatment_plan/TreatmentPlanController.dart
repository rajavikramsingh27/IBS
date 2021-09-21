import 'package:flutter/material.dart';
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:flutter_ibs/models/TreatmentPlanModel/PostTreatmentPlanResponseModel.dart';
import 'package:flutter_ibs/models/TreatmentPlanModel/PostTreatmentPlanSendModel.dart';
import 'package:flutter_ibs/models/TreatmentPlanModel/TreatmentPlanModel.dart';
import 'package:flutter_ibs/models/TreatmentPlanModel/TreatmentPlanResponseModel.dart';
import 'package:flutter_ibs/models/tags/TagsResponseModel.dart';
import 'package:flutter_ibs/routes/RouteConstants.dart';
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
  Rx<String> selectedTime = "01:00".obs;
  Rx<String> selectedDay = "option_every_day".obs;
  Rx<String> selectedPID = "".obs;
  Rx<String> selectedID = "".obs;

  RxList<Reminder> reminderList = <Reminder>[].obs;
  RxSet<String> listCategory = <String>{}.obs;
  TextEditingController noteTextController = TextEditingController();
  Rx<PostTreatmentPlanSendModel> treatmentPlanSendModel =
      PostTreatmentPlanSendModel().obs;
  RxList<TrackingSendData> listTrackData = <TrackingSendData>[].obs;
  RxList<dynamic> listTags = <dynamic>[].obs;

  TextEditingController tagsController = TextEditingController();
  RxString dayValue = "".obs;
  RxString timeValue = "".obs;
  RxString messageValue = "".obs;
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
    selectedPID.value = data.pid;
    selectedID.value = data.id;

    selectedCategory.value = data.category;
    Get.to(() => TreatmentPlanListWidget(
          data: data,
        ));
  }

  void onTagTapped({TagsDefault model}) {
    if (selectedTags.contains(model)) {
      selectedTags.remove(model);
    } else {
      selectedTags.add(model);
    }
  }

  void addReminder() {
    noteTextController.clear();
    (selectedDay.isEmpty || selectedTime.isEmpty)
        ? CustomSnackBar()
            .errorSnackBar(title: "Error", message: "Select time and day both")
        : reminderList.add(Reminder(
            message: noteTextController.text,
            time: selectedTime.value ?? "01:00",
            day: selectedDay.value ?? "option_every_day"));
  }

  clearData() {
    selectedTags = <TagsDefault>[].obs;
    selectedCategory = "".obs;
    selectedTime = "".obs;
    selectedDay = "".obs;
    reminderList = <Reminder>[].obs;
    listCategory = <String>{}.obs;
    noteTextController.clear();
  }

  onSave() async {
    // if (treatmentPlanSendModel.value == null) {
    //   treatmentPlanSendModel.value.items = [];
    // }
    treatmentPlanSendModel.value = PostTreatmentPlanSendModel(
        category: selectedCategory.value,
        reminders: [],
        tags: [],
        trackingDefaults: [],
        pid: selectedPID.value);
    TrackingSendData trackTreatmentModel = TrackingSendData(
        category: selectedCategory.value,
        // tid: ,
        // kind: "tags",
        // dtype: "arr",
        value: TrackingValue(arr: ""));

    treatmentPlanSendModel.value.tags.addAll(selectedTags);
    treatmentPlanSendModel.value.reminders.addAll(reminderList);
    treatmentPlanSendModel.refresh();

    print("data: ${treatmentPlanSendModel.toJson()}");
    loader.value = true;
    final data = await ServiceApi()
        .postTreatmentPlanAPI(bodyData: treatmentPlanSendModel.toJson());
    loader.value = false;
    if (data is PostTreatmentPlanResponseModel) {
      Get.offAllNamed(home);
      CustomSnackBar().successSnackBar(
          title: "Success", message: "Treatment Plan Added Successfully");
    } else {
      loader.value = false;
      CustomSnackBar().errorSnackBar(title: "Error", message: data.message);
    }
  }

  Future<bool> addTags({category, tagValue}) async {
    loader.value = true;
    final data = await ServiceApi().postTags(bodyData: tagValue.toJson());
    loader.value = false;
    if (data is TagsResponseModel) {
      tagsController.clear();
      CustomSnackBar()
          .successSnackBar(title: "Success", message: "Tag Added Successfully");
      return true;
    } else {
      loader.value = false;

      CustomSnackBar()
          .errorSnackBar(title: "Error", message: "Operation unsuccessful");
      return false;
    }
  }

  onStopTreatmentPlan() async {
    // loader.value = true;
    final data = await ServiceApi().removeTreatmentPlan(selectedID.value);
    // loader.value = false;
    // if (data is PostTreatmentPlanResponseModel) {
    Get.offAllNamed(home);
    // CustomSnackBar().successSnackBar(
    //     title: "Success", message: "Treatment Plan Stopped Successfully");
    // } else {
    //   loader.value = false;
    // CustomSnackBar().errorSnackBar(title: "Error", message: data.message);
    // }
  }
}
