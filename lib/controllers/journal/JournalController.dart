import 'package:flutter/material.dart';
import 'package:flutter_ibs/controllers/BaseTrackableController.dart';
import 'package:flutter_ibs/controllers/trackables/TrackablesController.dart';
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:flutter_ibs/models/journal/JournalResponseModel.dart';
import 'package:flutter_ibs/models/journal/JournalSendModel.dart';
import 'package:flutter_ibs/models/track_history/TrackHistoryResponseModel.dart';
import 'package:flutter_ibs/services/ServiceApi.dart';
import 'package:flutter_ibs/utils/SnackBar.dart';
import 'package:get/get.dart';

class JournalController extends BaseTrackableController {
  TextEditingController noteTextController = TextEditingController();


  Rx<JournalSendModel> journalModel = JournalSendModel(items: []).obs;


  @override
  void onInit() {
    super.onInit();
  }


  void setup({TrackHistoryResponseModel pageData}) {
    formWidgetList = trackablesController.getBowelMovements();
    setSavedData(pageData: pageData);
  }



  void onSave() async {
    print("*****  NOT YET SAVING ACTUAL DATA ****");
    return;
    loader.value = true;
    final data =
        await ServiceApi().postJournalAPI(bodyData: journalModel.toJson());
    loader.value = false;
    if (data is JournalResponseModel) {
      noteTextController.clear();
      //  healthWellnessModel.value.items = [];
      //  _signUpController.getTrackList();
      Get.back();
      CustomSnackBar().successSnackBar(
          title: "Success", message: "Journal Added Successfully");
    } else {
      CustomSnackBar().errorSnackBar(title: "Error", message: data.message);
    }
  }



  void valueChanged(TrackableSubmitItem submitItem) {
    var count = journalModel.value.items.length;
    bool isAdded = false;
    for (var i = 0; i < count; i++) {
      if (journalModel.value.items[i].tid == submitItem.tid) {
        journalModel.value.items[i] = submitItem;
        isAdded = true;
        break;
      }
    }

    if (!isAdded) {
      journalModel.value.items.add(submitItem);
    }
  }
}
