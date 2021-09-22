import 'package:flutter_ibs/controllers/trackables/TrackablesController.dart';
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:flutter_ibs/models/food/FoodResponseModel.dart';
import 'package:flutter_ibs/models/food/FoodSendModel.dart';
import 'package:flutter_ibs/services/ServiceApi.dart';
import 'package:flutter_ibs/utils/SnackBar.dart';
import 'package:get/get.dart';


class FoodController extends GetxController {


  RxBool loader = false.obs;

  Rx<FoodSendModel> foodModel = FoodSendModel(items: []).obs;
  TrackablesController _trackablesController = Get.find();

  RxList<TrackableItem> formWidgetList = RxList<TrackableItem>();


  @override
  void onInit() async {
    print("Food controller onInit");
    _trackablesController
        .food.value.items.forEach((element) {
      formWidgetList.add(element);
    });

    // Refresh the local list so the form can generate:
    formWidgetList.refresh();

    super.onInit();
    /*
    formattedTime = int.parse(
            DateFormat.Hm().format(currentDateTime.value).split(":").first)
        .obs;
    checkData();

    var v = homeController.trackFoodList.value;
    print("vdsdfat-- $v");

     */
  }

  valueChanged(TrackableSubmitItem submitItem){
    var count = foodModel.value.items.length;
    bool isAdded = false;
    for(var i=0; i < count; i++) {
      if (foodModel.value.items[i].tid == submitItem.tid) {
        foodModel.value.items[i] = submitItem;
        isAdded = true;
        break;
      }
    }

    if (!isAdded){
      foodModel.value.items.add(submitItem);
    }

  }

  void onSave()async{
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

  /*
  // onFoodTagSave() {
  //   TagsSendModel foodTags = TagsSendModel(
  //     category: _signUpController.food.value.category,
  //     key: ,
  //     value: ,
  //   );
  // }

  onSave() async {
    /*
    if (foodSendModel.value.items == null) {
      foodSendModel.value.items = [];
    }
    List<String> list = [];

    listfoodDefault.forEach((element) {
      list.add(element.value);
    });
    FoodSubList foodTypeModel = FoodSubList(
        tid: mealtid.value,
        kind: "tags",
        dtype: "arr",
        value: FoodSubValue(arr: list));
    listFoodSub.add(foodTypeModel);
    listFoodSub.refresh();
    FoodList foodModel = FoodList(
        children: listFoodSub,
        tid: _signUpController.food.value.items.last.tid,
        kind: _signUpController.food.value.items.last.kind,
        dtype: "str",
        value: FoodValue(str: mealTypeValue.value));
    print("meal:${mealTypeValue.value}");
    print("foodListTid:${mealtid.value}");

    foodSendModel.value.items.add(foodModel);
    foodSendModel.refresh();

    FoodList foodItemModel = FoodList(
        tid: "food-notes",
        kind: "textInput",
        dtype: "str",
        value: FoodValue(str: noteTextController.text));
    print("meal:${mealTypeValue.value}");
    FoodList hydrationItemModel = FoodList(
        tid: "food-hydration",
        kind: "sum",
        dtype: "num",
        value: FoodValue(num: noOfGlasses.value, str: ""));
    print("meal:${mealTypeValue.value}");
    foodSendModel.value.items.add(hydrationItemModel);

    foodSendModel.value.items.add(foodItemModel);
    foodSendModel.refresh();
    print("food_data: ${foodSendModel.toJson()}");
    loader.value = true;
    final data =
        await ServiceApi().foodTrackApi(bodyData: foodSendModel.toJson());
    loader.value = false;
    if (data is FoodResponseModel) {
      foodTextController.clear();
      noteTextController.clear();
      foodSendModel.value.items = [];
      _signUpController.getTrackList();
      Get.back();
      CustomSnackBar().successSnackBar(
          title: "Success", message: "Foods Added Successfully");
    } else {
      loader.value = false;
      foodTextController.clear();
      noteTextController.clear();
      _signUpController.getTrackList();
      CustomSnackBar().errorSnackBar(title: "Error", message: data.message);
    }

     */
  }

  /*
  getFood() async {
    final data = await ServiceApi().getFoodList();
    if (data == null) {
      Get.offAllNamed(signIn);
    }
    print("Data: $data");
  }

  void checkData() {
    if (_signUpController.food.value == null) {
      loader.value = true;
    } else {
      loader.value = false;
    }
  }

  mealOptionDefault({mealIndex}) {
    var model =
        _signUpController.food.value.items?.first?.list?.options[mealIndex];
    var startTime = CustomDateTime().parseTimeAsDateTime(
        dateTime: model.conditionalDefault.time.first.startTime,
        returnFormat: "HH:mm");
    var endTime = CustomDateTime().parseTimeAsDateTime(
        dateTime: model.conditionalDefault.time.first.endTime,
        returnFormat: "HH:mm");

    var s = "${currentDateTime.value.hour}:${currentDateTime.value.minute}";
    var u = CustomDateTime()
        .parseTimeAsDateTime(dateTime: s, returnFormat: "HH:mm");

    startTimeDifference.value = u.difference(startTime).inSeconds;
    endTimeDifference.value = (endTime.difference(u).inSeconds);
    if ((endTime.difference(u).inSeconds) > 0 &&
        (u.difference(startTime).inSeconds) > 0) {
      if (!selected.value) {
        selected.value = true;
        model.optionDefault = !model.optionDefault;
        Future.delayed(Duration(seconds: 1), () {
          _signUpController.food.refresh();
        });
      }
    }
    //   if (model.optionDefault == false &&
    //       ((endTime.difference(u).inSeconds) > 0 &&
    //           (u.difference(startTime).inSeconds) > 0)) {
    //     model.optionDefault = true;
    //     Future.delayed(Duration(seconds: 0), () {
    //       _signUpController.food.refresh();
    //     });
    //   }
  }

   */

  valueChanged(TrackableSubmitItem submitItem){
    var count = _selectedItems.length;
    bool isAdded = false;
    for(var i=0; i < count; i++) {
      if (_selectedItems[i].tid == submitItem.tid) {
        _selectedItems[i] = submitItem;
        isAdded = true;
        break;
      }
    }

    if (!isAdded){
      _selectedItems.add(submitItem);
    }


/*
    print ('-------');
    _selectedItems.forEach((element) {
      print(element.toJson());
    });

 */
  }

}
*/
