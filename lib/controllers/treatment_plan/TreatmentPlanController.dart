import 'package:flutter/material.dart';
import 'package:flutter_ibs/Store/ShareStore.dart';
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:flutter_ibs/models/TreatmentPlanModel/PostTreatmentPlanResponseModel.dart';
import 'package:flutter_ibs/models/TreatmentPlanModel/PostTreatmentPlanSendModel.dart';
import 'package:flutter_ibs/models/TreatmentPlanModel/TreatmentPlanModel.dart';
import 'package:flutter_ibs/models/TreatmentPlanModel/TreatmentPlanResponseModel.dart';
import 'package:flutter_ibs/models/login/LoginResponseModel.dart';
import 'package:flutter_ibs/models/tags/TagsResponseModel.dart';
import 'package:flutter_ibs/routes/RouteConstants.dart';
import 'package:flutter_ibs/utils/SnackBar.dart';
import 'package:flutter_ibs/widget/CustomDialog.dart';
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

  RxList<dynamic> selectedTagsList = <dynamic>[].obs;
  RxList<TagsDefault> selectedTags = <TagsDefault>[].obs;
  RxList<ListOption> selectedOptionList = <ListOption>[].obs;

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
  LoginResponseModel userData;
  RxList<String> existTreatmentPlans = <String>[].obs;

  @override
  void onInit() async {
    super.onInit();
    pageController.addListener(() {
      currentPage.value = pageController.page;
    });
    getExistTreatmentPlans();
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

  void onTagTapped({model}) {
    if (model is TagsDefault) {
      if (selectedTags.contains(model)) {
        selectedTags.remove(model);
      } else {
        selectedTags.add(model);
      }
    } else {
      if (selectedOptionList.contains(model)) {
        selectedOptionList.remove(model);
      } else {
        selectedOptionList.add(model);
      }
    }
    if (selectedTagsList.contains(model)) {
      selectedTagsList.remove(model);
    } else {
      selectedTagsList.add(model);
    }
    selectedTagsList.refresh();
  }

  void addReminder() {
    (selectedDay.isEmpty || selectedTime.isEmpty)
        ? CustomSnackBar()
            .errorSnackBar(title: "Error", message: "Select time and day both")
        : reminderList.add(Reminder(
            message: noteTextController.text,
            time: selectedTime.value,
            day: selectedDay.value));
    noteTextController.clear();
  }

  clearData() {
    selectedTagsList = <dynamic>[].obs;
    selectedOptionList = <ListOption>[].obs;
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
    treatmentPlanItemData.forEach((element) {
      if (element.pid == selectedPID.value) {
        // trackTreatmentModel.tid =
        element.trackables.forEach((track) {
          TrackingSendData trackTreatmentModel = TrackingSendData(
              category: selectedCategory.value,
              tid: track.tid,
              kind: track.kind,
              dtype: "str",
              value: TrackingValue(
                  str: track.kind == "timePicker" ? track.timePicker.timePickerDefault : "",
                  arr: track.kind == "select" ? track.select.selectDefault.value : ""));
          listTrackData.add(trackTreatmentModel);
        });
      }
    });
    treatmentPlanSendModel.value.tags.addAll(selectedTagsList);
    treatmentPlanSendModel.value.reminders.addAll(reminderList);
    treatmentPlanSendModel.value.trackingDefaults.addAll(listTrackData);
    treatmentPlanSendModel.refresh();

    debugPrint("data: ${treatmentPlanSendModel.toJson()}",wrapWidth: 1024);
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
    treatmentPlanSendModel =
        PostTreatmentPlanSendModel().obs;
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
    loader.value = true;
    final data = await ServiceApi().removeTreatmentPlan(selectedPID.value);
    loader.value = false;
    if (data is PostTreatmentPlanResponseModel) {
      Get.offAllNamed(home);
      CustomSnackBar().successSnackBar(
          title: "Success", message: "Treatment Plan Stopped Successfully");
    } else {
      loader.value = false;
      CustomSnackBar().errorSnackBar(title: "Error", message: data.message);
    }
  }

  void getExistTreatmentPlans() {
    userData = ShareStore().getData(store: KeyStore.userprofile);
    userData.treatmentPlans.forEach((element) {
      existTreatmentPlans.add(element["pid"]);
    });
  }
}
