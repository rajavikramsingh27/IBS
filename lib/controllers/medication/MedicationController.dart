import 'package:flutter/material.dart';
import 'package:flutter_ibs/controllers/signup/SignUpController.dart';
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:flutter_ibs/models/medication/MedicationResponseModel.dart';
import 'package:flutter_ibs/models/medication/MedicationSendModel.dart';
import 'package:flutter_ibs/services/ServiceApi.dart';
import 'package:flutter_ibs/utils/SnackBar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MedicationController extends GetxController {
  Rx<DateTime> now = DateTime.now().obs;

  RxInt formattedTime = 0.obs;
  RxBool loader = false.obs;

  Rx<MedicationSendModel> medicationSendModel = MedicationSendModel().obs;
  RxList<TagsDefault> listfoodDefault = <TagsDefault>[].obs;
  TextEditingController noteTextController = TextEditingController();
  TextEditingController medicationTextController = TextEditingController();
  SignUpController _signUpController = Get.find();

  @override
  void onInit() {
    super.onInit();
    formattedTime = int.parse(DateFormat('kk').format(now.value)).obs;
    checkData();
  }

  onSave() async {
    if (medicationSendModel.value.items == null) {
      medicationSendModel.value.items = [];
    }
    List<String> list = [];

    listfoodDefault.forEach((element) {
      list.add(element.value);
    });

    MedicationItem medicationListModel = MedicationItem(
        tid: _signUpController.medications.value.items.elementAt(1).tid,
        kind: "tags",
        dtype: "arr",
        value: MedicationValue(arr: list));

    medicationSendModel.value.items.add(medicationListModel);

    MedicationItem noteItemModel = MedicationItem(
        tid: "medications-notes",
        kind: "textInput",
        dtype: "str",
        value: MedicationValue(str: noteTextController.text));

    medicationSendModel.value.items.add(noteItemModel);
    medicationSendModel.refresh();
    print("food_data: ${medicationSendModel.toJson()}");
    loader.value = true;
    final data =
        await ServiceApi().postMedicationAPI(bodyData: medicationSendModel.toJson());
    loader.value = false;

    if (data is MedicationResponseModel) {
      medicationTextController.clear();
      noteTextController.clear();
      _signUpController.getTrackList();
      Get.back();
      CustomSnackBar().successSnackBar(
          title: "Success", message: "Medications Added Successfully");
    } else {
      loader.value = false;
      medicationTextController.clear();
      noteTextController.clear();
      _signUpController.getTrackList();
      CustomSnackBar().errorSnackBar(title: "Error", message: data.message);
    }
  }

  void checkData() {
    if (_signUpController.medications.value == null) {
      loader.value = true;
    } else {
      loader.value = false;
    }
  }
}
