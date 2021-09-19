import 'package:flutter/material.dart';
import 'package:flutter_ibs/controllers/trackables/TrackablesController.dart';
import 'package:flutter_ibs/controllers/signup/SignUpController.dart';
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:flutter_ibs/models/medication/MedicationResponseModel.dart';
import 'package:flutter_ibs/models/medication/MedicationSendModel.dart';
import 'package:flutter_ibs/services/ServiceApi.dart';
import 'package:flutter_ibs/utils/SnackBar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MedicationController extends GetxController {
  RxBool loader = false.obs;
  /*
  Rx<DateTime> now = DateTime.now().obs;

  RxInt formattedTime = 0.obs;
  RxBool loader = false.obs;

  Rx<MedicationSendModel> medicationSendModel = MedicationSendModel().obs;
  RxList<Tag> listfoodDefault = <Tag>[].obs;
  TextEditingController noteTextController = TextEditingController();
  TextEditingController medicationTextController = TextEditingController();
  SignUpController _signUpController = Get.find();

  @override
  void onInit() {
    super.onInit();
    formattedTime = int.parse(DateFormat('kk').format(now.value)).obs;
    checkData();
  }*/

//  Rx<MedicationM> healthWellnessModel = HealthWellnessModel().obs;
  TrackablesController _trackablesController = Get.find();

  RxList<TrackableSubmitItem> _selectedItems = RxList<TrackableSubmitItem>();
  RxList<TrackableItem> formWidgetList = RxList<TrackableItem>();


  /*
  onTapped(int index) async {
    currentIndex.value = index;
  }
*/


  @override
  void onInit() {
    // Get the source of the data:
    _trackablesController
        .medications.value.items.forEach((element) {
      formWidgetList.add(element);
    });

    // Refresh the local list so the form can generate:
    formWidgetList.refresh();
    _selectedItems = RxList<TrackableSubmitItem>();
    super.onInit();
    // formattedTime = int.parse(DateFormat('kk').format(now.value)).obs;
  }

  valueChanged(TrackableSubmitItem submitItem) {
    var count = _selectedItems.length;
    bool isAdded = false;
    for (var i = 0; i < count; i++) {
      if (_selectedItems[i].tid == submitItem.tid) {
        _selectedItems[i] = submitItem;
        isAdded = true;
        break;
      }
    }

    if (!isAdded) {
      _selectedItems.add(submitItem);
    }

  }

    onSave() async {
      print("on save called");
    }


    /*
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
      medicationSendModel.value.items = [];
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

     */

}
