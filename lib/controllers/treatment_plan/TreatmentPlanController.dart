import 'package:flutter/material.dart';
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:flutter_ibs/models/TreatmentPlanModel/TreatmentPlanModel.dart';
import 'package:flutter_ibs/models/TreatmentPlanModel/TreatmentPlanResponseModel.dart';
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
  RxList<TreatmentPlanItemData>  treatmentPlanItemData= <TreatmentPlanItemData>[].obs;

  RxList<TagsDefault> selectedTags = <TagsDefault>[].obs;
  RxList<Reminder> reminderList = <Reminder>[].obs;
  @override
  void onInit() async{
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
      });
      loader.value = false;
    }
  }
  toTreatmentPlanListWidget({TreatmentPlanItemData data}){
    Get.to(TreatmentPlanListWidget(data: data,));
  }
}
