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
  DateTimeCardController dateTimeController = Get.find();

  Rx<SymptomsModel> symptomsModel = SymptomsModel(items: []).obs;


  @override
  void onInit() {
    super.onInit();
  }

  void setup({TrackHistoryResponseModel pageData}) {

    formWidgetList = trackablesController.getSymptoms();

    if (pageData != null) {
      symptomsModel.value.id = pageData.id;
      dateTimeController.setDate(pageData.trackedAt);
      setSavedData(pageData: pageData);
    }
  }


  void onSave() async {
    symptomsModel.value.trackedAt = dateTimeController.selectedDate;

    loader.value = true;

    SymptomsResponseModel data;
    if (symptomsModel.value.id != null){
      data = await ServiceApi().updateSymptomsAPI(id: symptomsModel.value.id, bodyData: symptomsModel.toJson());
      homeController.getTrackHistoryList();
    }else{
      data = await ServiceApi().postSymptomsAPI(bodyData: symptomsModel.toJson());
    }

    loader.value = false;
    if (data is SymptomsResponseModel) {
      Get.back();
      CustomSnackBar().successSnackBar(
          title: "Success", message: "Symptoms Added Successfully");
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


}
