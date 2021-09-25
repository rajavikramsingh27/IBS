import 'package:flutter_ibs/controllers/BaseTrackableController.dart';
import 'package:flutter_ibs/controllers/trackables/TrackablesController.dart';
import 'package:flutter_ibs/models/BowelMovementsModel/BowelMovementsModel.dart';
import 'package:flutter_ibs/models/BowelMovementsModel/BowelMovementsResponseModel.dart';
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:flutter_ibs/models/track_history/TrackHistoryResponseModel.dart';
import 'package:flutter_ibs/services/ServiceApi.dart';
import 'package:flutter_ibs/utils/SnackBar.dart';
import 'package:get/get.dart';


class BowelMovementController extends BaseTrackableController {

  Rx<BowelMovementsModel> bowelMovementsModel =
      BowelMovementsModel(items: []).obs;


  @override
  void onInit() {
    super.onInit();
  }


  void setup({TrackHistoryResponseModel pageData}) {
    formWidgetList = trackablesController.getBowelMovements();
    setSavedData(pageData: pageData);
  }



  valueChanged(TrackableSubmitItem submitItem) {
    var count = bowelMovementsModel.value.items.length;
    bool isAdded = false;
    for (var i = 0; i < count; i++) {
      if (bowelMovementsModel.value.items[i].tid == submitItem.tid) {
        bowelMovementsModel.value.items[i] = submitItem;
        isAdded = true;
        break;
      }
    }

    if (!isAdded) {
      bowelMovementsModel.value.items.add(submitItem);
    }
  }

  void onSave() async {
    loader.value = true;
    final data = await ServiceApi()
        .postBowelMovementAPI(bodyData: bowelMovementsModel.toJson());
    loader.value = false;
    if (data is BowelMovementsResponseModel) {
      // noteTextController.clear();
      //  healthWellnessModel.value.items = [];
      //  _signUpController.getTrackList();
      Get.back();
      CustomSnackBar().successSnackBar(
          title: "Success", message: "Bowel Movement Added Successfully");
    } else {
      CustomSnackBar().errorSnackBar(title: "Error", message: data.message);
    }
  }
}
