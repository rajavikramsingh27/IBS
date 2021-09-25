import 'package:flutter_ibs/controllers/BaseTrackableController.dart';
import 'package:flutter_ibs/controllers/trackables/TrackablesController.dart';
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:flutter_ibs/models/medication/MedicationResponseModel.dart';
import 'package:flutter_ibs/models/medication/MedicationSendModel.dart';
import 'package:flutter_ibs/models/track_history/TrackHistoryResponseModel.dart';
import 'package:flutter_ibs/services/ServiceApi.dart';
import 'package:flutter_ibs/utils/SnackBar.dart';
import 'package:get/get.dart';

class MedicationController extends BaseTrackableController {

  Rx<MedicationSendModel> medicationsModel = MedicationSendModel(items: []).obs;


  @override
  void onInit() {
    super.onInit();
  }


  void setup({TrackHistoryResponseModel pageData}) {
    formWidgetList = trackablesController.getMedications();
    setSavedData(pageData: pageData);
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

  void onSave() async {
    loader.value = true;
    final data = await ServiceApi()
        .postMedicationAPI(bodyData: medicationsModel.toJson());
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

}
