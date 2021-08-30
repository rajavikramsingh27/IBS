import 'package:flutter/material.dart';
import 'package:flutter_ibs/controllers/signup/SignUpController.dart';
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:flutter_ibs/models/food/FoodSendModel.dart';
import 'package:flutter_ibs/routes/RouteConstants.dart';
import 'package:flutter_ibs/services/ServiceApi.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class FoodController extends GetxController {
  Rx<DateTime> currentDateTime = DateTime.now().obs;
  RxDouble sliderValue = 1.0.obs;
  RxInt formattedTime = 0.obs;
  RxInt currentIndex = 0.obs;
  RxString mealTypeValue = "".obs;
  Rx<FoodSendModel> foodSendModel = FoodSendModel().obs;
  Rx<FoodSubList> listFoodSub = FoodSubList().obs;
  Rx<FoodList> listFood = FoodList().obs;

  TextEditingController noteTextController = TextEditingController();

  // RxList<FoodList> listFood = [].obs;

  RxBool loader = false.obs;
  RxBool switchValue = true.obs;
  RxBool connectionStatus = false.obs;
  RxInt endTimeDifference = 0.obs;
  RxInt startTimeDifference = 0.obs;
  SignUpController _signUpController = Get.find();
  RxInt modelMealIndex = 0.obs;

  onTapped(int index) async {
    currentIndex.value = index;
  }

  @override
  void onInit() async {
    super.onInit();
    formattedTime = int.parse(
            DateFormat.Hm().format(currentDateTime.value).split(":").first)
        .obs;
    onTapBlank();
  }

  onTapBlank() {
    if (foodSendModel.value.items == null) {
      foodSendModel.value.items = [];
    }

    FoodList foodlist =
        FoodList(children: [], value: FoodValue(str: mealTypeValue.value));
    foodSendModel.value.items.add(foodlist);
    FoodSubList child = FoodSubList(
        tid: _signUpController
            .food.value.items.first.children.first.items.first.tid,
        value: FoodSubValue(arr: []));

    foodSendModel.value.items.first.children.add(child);
    foodSendModel.refresh();
    _signUpController.food.refresh();
  }

  onSave() async {
    if (foodSendModel.value.items == null) {
      foodSendModel.value.items = [];
    }
    // FoodSubList foodTypeModel = FoodSubList(
    //     tid: "food-breakfast_eat",
    //     kind: "tags",
    //     dtype: "arr",
    //     value: FoodSubValue(arr: onOptionTapped()));
    // listFood.value.children.add(foodTypeModel);
    // listFood.refresh();
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
        value: FoodValue(num: 5, str: ""));
    print("meal:${mealTypeValue.value}");
    foodSendModel.value.items.add(hydrationItemModel);

    foodSendModel.value.items.add(foodItemModel);
    foodSendModel.refresh();
    print("food_data: ${foodSendModel.toJson()}");
    // final data =
    //     await ServiceApi().foodTrackApi(bodyData: foodSendModel.toJson());

    // if (data is FoodResponseModel) {
    //   Get.back();
    //   CustomSnackBar().successSnackBar(
    //       title: "Success", message: "Foods Added Successfully");
    // } else {
    //   CustomSnackBar().errorSnackBar(title: "Error", message: data.message);
    // }
  }

  getFood() async {
    final data = await ServiceApi().getFoodList();
    if (data == null) {
      Get.offAllNamed(signIn);
    }
    print("Data: $data");
  }

  onOptionTapped({TagsDefault model, List<String> modelValue}) {
    model.required = !model.required;

    if (model.required) {
      if (!modelValue.contains(model.value)) {
        modelValue.add(model.value);
      }
    } else {
      if (modelValue.contains(model.value)) {
        modelValue.remove(model.value);
      }
    }
    _signUpController.food.refresh();

    return modelValue;
  }
}
