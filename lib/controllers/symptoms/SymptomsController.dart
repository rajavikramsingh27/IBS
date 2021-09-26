import 'package:flutter_ibs/controllers/BaseTrackableController.dart';
import 'package:flutter_ibs/controllers/dateTime/DateTimeCardController.dart';
import 'package:flutter_ibs/controllers/home/HomeController.dart';
import 'package:flutter_ibs/models/Symptoms/SymptomsModel.dart';
import 'package:flutter_ibs/models/Symptoms/SymptomsResponseModel.dart';
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:flutter_ibs/models/track_history/TrackHistoryResponseModel.dart';
import 'package:flutter_ibs/services/ServiceApi.dart';
import 'package:flutter_ibs/utils/SnackBar.dart';
import 'package:get/get.dart';

class SymptomsController extends BaseTrackableController {
  HomeController homeController = Get.find();
  DateTimeCardController dateTimeController = Get.put(DateTimeCardController());

  Rx<SymptomsModel> symptomsModel = SymptomsModel(items: []).obs;


  @override
  void onInit() {
    super.onInit();
  }

  void setup({TrackHistoryResponseModel pageData}) {
    loader.value = false;

    formWidgetList = trackablesController.getSymptoms();

    if (pageData != null) {
      symptomsModel.value.id = pageData.id;
      dateTimeController.setDate(pageData.trackedAt);
      setSavedData(pageData: pageData);
    }
  }


  void onSave() async {
    symptomsModel.value.trackedAt = dateTimeController.selectedDate.toUtc();
    loader.value = true;

    bool isUpdate = false;

    SymptomsResponseModel data;
    if (symptomsModel.value.id != null){
      isUpdate = true;
      data = await ServiceApi().updateSymptomsAPI(id: symptomsModel.value.id, bodyData: symptomsModel.toJson());
      homeController.getTrackHistoryList();
    }else{
      data = await ServiceApi().postSymptomsAPI(bodyData: symptomsModel.toJson());
    }

    loader.value = false;
    if (data != null ) {
      Get.back();
      CustomSnackBar().successSnackBar(
          title: "Success", message: isUpdate ? "Symptom Updated Successfully" : "Symptoms Added Successfully");
    } else {
      CustomSnackBar().errorSnackBar(title: "Error", message: "Something went wrong");
    }

  }


  void valueChanged(TrackableSubmitItem submitItem) {
    var count = symptomsModel.value.items.length;
    bool isAdded = false;
    for (var i = 0; i < count; i++) {
      if (symptomsModel.value.items[i].tid == submitItem.tid) {
        symptomsModel.value.items[i] = submitItem;
        isAdded = true;
        break;
      }
    }

    if (!isAdded) {
      symptomsModel.value.items.add(submitItem);
    }
  }


  // Removed it from our tracked list:
  void onValueRemoved(TrackableItem item){
    var count = symptomsModel.value.items.length;
    for (var i = 0; i < count; i++) {
      if (symptomsModel.value.items[i].tid == item.tid) {
        // Remove all the children items:
        item.children.forEach((child) {
          child.items.forEach((childItem) {
            onValueRemoved(childItem);
          });
        });
        symptomsModel.value.items.removeAt(i);
        item.reset();
        break;
      }
    }
    print("Orig $count now " + symptomsModel.value.items.length.toString());
  }

}
