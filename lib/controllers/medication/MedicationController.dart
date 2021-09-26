import 'package:flutter_ibs/controllers/BaseTrackableController.dart';
import 'package:flutter_ibs/controllers/dateTime/DateTimeCardController.dart';
import 'package:flutter_ibs/controllers/home/HomeController.dart';
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:flutter_ibs/models/medication/MedicationResponseModel.dart';
import 'package:flutter_ibs/models/medication/MedicationSendModel.dart';
import 'package:flutter_ibs/models/track_history/TrackHistoryResponseModel.dart';
import 'package:flutter_ibs/services/ServiceApi.dart';
import 'package:flutter_ibs/utils/SnackBar.dart';
import 'package:get/get.dart';

class MedicationController extends BaseTrackableController {
  HomeController homeController = Get.find();
  DateTimeCardController dateTimeController = Get.put(DateTimeCardController());

  Rx<MedicationSendModel> medicationsModel = MedicationSendModel(items: []).obs;


  @override
  void onInit() {
    super.onInit();
  }


  void setup({TrackHistoryResponseModel pageData}) {
    formWidgetList = trackablesController.getMedications();
    if (pageData != null) {
      medicationsModel.value.id = pageData.id;
      dateTimeController.setDate(pageData.trackedAt);
      setSavedData(pageData: pageData);
    }
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



  // Removed it from our tracked list:
  void onValueRemoved(TrackableItem item) {
    var count = medicationsModel.value.items.length;
    for (var i = 0; i < count; i++) {
      if (medicationsModel.value.items[i].tid == item.tid) {
        // Remove all the children items:
        item.children.forEach((child) {
          child.items.forEach((childItem) {
            onValueRemoved(childItem);
          });
        });
        medicationsModel.value.items.removeAt(i);
        item.reset();
        break;
      }
    }
  }


    void onSave() async {
      medicationsModel.value.trackedAt =
          dateTimeController.selectedDate.toUtc();

      loader.value = true;

      bool isUpdate = false;

      MedicationResponseModel data;
      if (medicationsModel.value.id != null) {
        isUpdate = true;
        data = await ServiceApi().updateMedicationAPI(
            id: medicationsModel.value.id, bodyData: medicationsModel.toJson());
        homeController.getTrackHistoryList();
      } else {
        data =
        await ServiceApi().postMedicationAPI(bodyData: medicationsModel.toJson());
      }

      loader.value = false;
      if (data != null) {
        Get.back();
        CustomSnackBar().successSnackBar(
            title: "Success",
            message: isUpdate
                ? "Medications Updated Successfully"
                : "Medications Added Successfully");
      }
    }
}
