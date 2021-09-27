import 'package:flutter_ibs/controllers/BaseTrackableController.dart';
import 'package:flutter_ibs/controllers/dateTime/DateTimeCardController.dart';
import 'package:flutter_ibs/controllers/home/HomeController.dart';
import 'package:flutter_ibs/models/HealthWellnessModel/HealthWellnessModel.dart';
import 'package:flutter_ibs/models/HealthWellnessModel/HealthWellnessResponseModel.dart';
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:flutter_ibs/models/track_history/TrackHistoryResponseModel.dart';
import 'package:flutter_ibs/services/ServiceApi.dart';
import 'package:flutter_ibs/utils/SnackBar.dart';
import 'package:get/get.dart';

class HealthController extends BaseTrackableController {
  HomeController homeController = Get.find();
  DateTimeCardController dateTimeController = Get.put(DateTimeCardController());

  Rx<HealthWellnessModel> healthWellnessModel =
      HealthWellnessModel(items: []).obs;

  @override
  void onInit() {
    super.onInit();
  }


  void setup({TrackHistoryResponseModel pageData}) {
    formWidgetList = trackablesController.getHealthWellness();
    healthWellnessModel.value.id = null;
    dateTimeController.setTimeToCurrent();

    if (pageData != null) {
      healthWellnessModel.value.id = pageData.id;
      dateTimeController.setDate(pageData.trackedAt);
      setSavedData(pageData: pageData);
    }
  }



  void valueChanged(TrackableSubmitItem submitItem) {
    var count = healthWellnessModel.value.items.length;
    bool isAdded = false;
    for (var i = 0; i < count; i++) {
      if (healthWellnessModel.value.items[i].tid == submitItem.tid) {
        healthWellnessModel.value.items[i] = submitItem;
        isAdded = true;
        break;
      }
    }

    if (!isAdded) {
      healthWellnessModel.value.items.add(submitItem);
    }
  }


  void onSave() async {
    healthWellnessModel.value.trackedAt = dateTimeController.selectedDate.toUtc();
    loader.value = true;

    bool isUpdate = false;

    HealthWellnessResponseModel data;
    if (healthWellnessModel.value.id != null){
      isUpdate = true;
      data = await ServiceApi().updateHealthWellnessAPI(id: healthWellnessModel.value.id, bodyData: healthWellnessModel.toJson());
      homeController.getTrackHistoryList();
    }else{
      data = await ServiceApi().postHealthWellnessAPI(bodyData: healthWellnessModel.toJson());
    }

    loader.value = false;
    if (data != null ) {
      Get.back();
      CustomSnackBar().successSnackBar(
          title: "Success", message: isUpdate ? "Health & Wellness Updated Successfully" : "Health & Wellness Added Successfully");
    }

  }





  // Removed it from our tracked list:
  void onValueRemoved(TrackableItem item){
    var count = healthWellnessModel.value.items.length;
    for (var i = 0; i < count; i++) {
      if (healthWellnessModel.value.items[i].tid == item.tid) {
        // Remove all the children items:
        item.children.forEach((child) {
          child.items.forEach((childItem) {
            onValueRemoved(childItem);
          });
        });
        healthWellnessModel.value.items.removeAt(i);
        item.reset();
        break;
      }
    }
  }


}
