import 'package:flutter_ibs/controllers/BaseTrackableController.dart';
import 'package:flutter_ibs/controllers/dateTime/DateTimeCardController.dart';
import 'package:flutter_ibs/controllers/trackables/TrackablesController.dart';
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:flutter_ibs/models/food/FoodResponseModel.dart';
import 'package:flutter_ibs/models/food/FoodSendModel.dart';
import 'package:flutter_ibs/models/track_history/TrackHistoryResponseModel.dart';
import 'package:flutter_ibs/services/ServiceApi.dart';
import 'package:flutter_ibs/utils/DateTime.dart';
import 'package:flutter_ibs/utils/SnackBar.dart';
import 'package:get/get.dart';

class FoodController extends BaseTrackableController {
  DateTimeCardController dateTimeController = Get.put(DateTimeCardController());

  Rx<FoodSendModel> foodModel = FoodSendModel(items: []).obs;
  RxList<TrackableItem> formWidgetList;

  //Rx<DateTime> currentDateTime = DateTime.now().obs;
  RxInt endTimeDifference = 0.obs;
  RxInt startTimeDifference = 0.obs;
  bool _isDefaultFoodSet = false;


  @override
  void onInit() {
    super.onInit();
  }


  void setup({TrackHistoryResponseModel pageData}) {
    formWidgetList = trackablesController.getFoods();
    if (pageData != null) {
      foodModel.value.id = pageData.id;
      dateTimeController.setDate(pageData.trackedAt);
      setSavedData(pageData: pageData);
    }

    _isDefaultFoodSet = false;
    formWidgetList.first.list.options.forEach((food) {
      mealOptionDefault(food);
    });

  }


  onCancel() {
    Get.back();
  }


  /// Set the meal selection based on time of day
  mealOptionDefault(ListOption mealOption) {
    mealOption.selected = false;

    var startTime = CustomDateTime().parseTimeAsDateTime(
        dateTime: mealOption.conditionalDefault.time.first.startTime,
        returnFormat: "HH:mm");
    var endTime = CustomDateTime().parseTimeAsDateTime(
        dateTime: mealOption.conditionalDefault.time.first.endTime,
        returnFormat: "HH:mm");

    var s = "${dateTimeController.selectedDate.hour}:${dateTimeController.selectedDate.minute}";
    var u = CustomDateTime()
        .parseTimeAsDateTime(dateTime: s, returnFormat: "HH:mm");

    startTimeDifference.value = u.difference(startTime).inSeconds;
    endTimeDifference.value = (endTime.difference(u).inSeconds);
    if ((endTime.difference(u).inSeconds) > 0 &&
        (u.difference(startTime).inSeconds) > 0) {
      if (!_isDefaultFoodSet) {
        mealOption.selected = true;
        formWidgetList.first.list.value = mealOption;
        _isDefaultFoodSet = true;
      }
    }
  }



  valueChanged(TrackableSubmitItem submitItem) {
    var count = foodModel.value.items.length;
    bool isAdded = false;
    for (var i = 0; i < count; i++) {
      if (foodModel.value.items[i].tid == submitItem.tid) {
        foodModel.value.items[i] = submitItem;
        isAdded = true;
        break;
      }
    }

    if (!isAdded) {
      foodModel.value.items.add(submitItem);
    }
  }


  // Removed it from our tracked list:
  void onValueRemoved(TrackableItem item){
    var count = foodModel.value.items.length;
    for (var i = 0; i < count; i++) {
      if (foodModel.value.items[i].tid == item.tid) {
        // Remove all the children items:
        item.children.forEach((child) {
          child.items.forEach((childItem) {
            onValueRemoved(childItem);
          });
        });
        foodModel.value.items.removeAt(i);
        item.reset();
        break;
      }
    }

  }



  void onSave() async {
    foodModel.value.trackedAt = dateTimeController.selectedDate.toUtc();

    loader.value = true;
    final data = await ServiceApi().foodTrackApi(bodyData: foodModel.toJson());
    loader.value = false;
    if (data is FoodResponseModel) {
      // noteTextController.clear();
      //  healthWellnessModel.value.items = [];
      //  _signUpController.getTrackList();
      Get.back();
      CustomSnackBar().successSnackBar(
          title: "Success", message: "Food Added Successfully");
    } else {
      CustomSnackBar().errorSnackBar(title: "Error", message: data.message);
    }
  }
}


