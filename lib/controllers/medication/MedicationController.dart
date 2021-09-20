import 'package:flutter_ibs/controllers/trackables/TrackablesController.dart';
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:flutter_ibs/models/medication/MedicationResponseModel.dart';
import 'package:flutter_ibs/models/medication/MedicationSendModel.dart';
import 'package:flutter_ibs/services/ServiceApi.dart';
import 'package:flutter_ibs/utils/SnackBar.dart';
import 'package:get/get.dart';

class MedicationController extends GetxController {
  RxBool loader = false.obs;

  Rx<MedicationSendModel> medicationsModel = MedicationSendModel(items: []).obs;
  TrackablesController _trackablesController = Get.find();
  RxList<TrackableItem> formWidgetList = RxList<TrackableItem>();



  @override
  void onInit() {
    // Get the source of the data:
    _trackablesController
        .medications.value.items.forEach((element) {
      formWidgetList.add(element);
    });

    // Refresh the local list so the form can generate:
    formWidgetList.refresh();

    super.onInit();
    // formattedTime = int.parse(DateFormat('kk').format(now.value)).obs;
  }

  valueChanged(TrackableSubmitItem submitItem) {
    var count = medicationsModel.value.items.length;
    bool isAdded = false;
    for (var i = 0; i < count; i++) {
      if (medicationsModel.value.items[i].tid == submitItem.tid) {
        medicationsModel.value.items[i] = submitItem;
        isAdded = true;
        break;
      }
    }

    if (!isAdded) {
      medicationsModel.value.items.add(submitItem);
    }

  }


  void onSave()async{
    loader.value = true;
    final data = await ServiceApi().postMedicationAPI(bodyData: medicationsModel.toJson());
    loader.value = false;
    if (data is MedicationResponseModel) {
      formWidgetList = RxList<TrackableItem>();
      formWidgetList.refresh();
      Get.back();
      CustomSnackBar().successSnackBar(
          title: "Success", message: "Health & Wellness Added Successfully");
    } else {
      CustomSnackBar().errorSnackBar(title: "Error", message: data.message);
    }

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
