import 'package:flutter/material.dart';
import 'package:flutter_ibs/controllers/TrackablesController.dart';
import 'package:flutter_ibs/controllers/signup/SignUpController.dart';
import 'package:flutter_ibs/models/journal/JournalResponseModel.dart';
import 'package:flutter_ibs/services/ServiceApi.dart';
import 'package:flutter_ibs/utils/SnackBar.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter_ibs/models/journal/JournalSendModel.dart' as journal;

class JournalController extends GetxController {
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
