import 'package:flutter/material.dart';
import 'package:flutter_ibs/controllers/trackables/TrackablesController.dart';
import 'package:flutter_ibs/controllers/signup/SignUpController.dart';
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:flutter_ibs/models/journal/JournalResponseModel.dart';
import 'package:flutter_ibs/services/ServiceApi.dart';
import 'package:flutter_ibs/utils/SnackBar.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter_ibs/models/journal/JournalSendModel.dart' ;

class JournalController extends GetxController {
  TextEditingController noteTextController = TextEditingController();

  RxBool loader = false.obs;

  Rx<JournalSendModel> journalModel = JournalSendModel(items: []).obs;
  TrackablesController _trackablesController = Get.find();
  RxList<TrackableItem> formWidgetList = RxList<TrackableItem>();

  @override
  void onInit() {
    // Get the source of the data:
    _trackablesController
        .journal.value.items.forEach((element) {
      formWidgetList.add(element);
    });

    // Refresh the local list so the form can generate:
    formWidgetList.refresh();

    super.onInit();
    // formattedTime = int.parse(DateFormat('kk').format(now.value)).obs;
  }


  void onSave()async{
    print("*****  NOT YET SAVING ACTUAL DATA ****");
    return;
    loader.value = true;
    final data = await ServiceApi().postJournalAPI(bodyData: journalModel.toJson());
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


  void valueChanged(TrackableSubmitItem submitItem){
    var count = journalModel.value.items.length;
    bool isAdded = false;
    for(var i=0; i < count; i++) {
      if (journalModel.value.items[i].tid == submitItem.tid) {
        journalModel.value.items[i] = submitItem;
        isAdded = true;
        break;
      }
    }

    if (!isAdded){
      journalModel.value.items.add(submitItem);
    }
  }

}


  /*
  Rx<DateTime> now = DateTime.now().obs;
  RxDouble sliderValue = 1.0.obs;
  RxInt formattedTime = 0.obs;
  final TextEditingController noteTextController = TextEditingController();
  TrackablesController _trackablesController = Get.find();
  RxBool loader = false.obs;
  Rx<journal.JournalSendModel> journalSendModel =
      journal.JournalSendModel().obs;

  @override
  void onInit() {
    super.onInit();
    formattedTime = int.parse(DateFormat('kk').format(now.value)).obs;
    checkData();
  }

  onSave() async {
    if (journalSendModel.value.items == null) {
      journalSendModel.value.items = [];
    }
    journal.Item item =
        journal.Item(value: journal.Value(str: noteTextController.text));
    journalSendModel.value.items.add(item);
    journalSendModel.refresh();
    print("journal Model : ${journalSendModel.toJson()}");
    loader.value = true;
    final data =
        await ServiceApi().postJournalAPI(bodyData: journalSendModel.toJson());
    loader.value = false;
    if (data is JournalResponseModel) {
      noteTextController.clear();
      journalSendModel.value.items = [];
     // _signUpController.getTrackList();
      Get.back();
      CustomSnackBar().successSnackBar(
          title: "Success", message: "Journal Added Successfully");
    } else {
      loader.value = false;
      noteTextController.clear();
    //  _signUpController.getTrackList();
      CustomSnackBar().errorSnackBar(title: "Error", message: data.message);
    }
  }

  void checkData() {
    if (_trackablesController.journal.value == null) {
      loader.value = true;
    } else {
      loader.value = false;
    }
  }
}
*/
