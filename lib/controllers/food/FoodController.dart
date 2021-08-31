import 'package:flutter/material.dart';
import 'package:flutter_ibs/controllers/signup/SignUpController.dart';
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:flutter_ibs/models/food/FoodResponseModel.dart';
import 'package:flutter_ibs/models/food/FoodSendModel.dart';
import 'package:flutter_ibs/routes/RouteConstants.dart';
import 'package:flutter_ibs/services/ServiceApi.dart';
import 'package:flutter_ibs/utils/DateTime.dart';
import 'package:flutter_ibs/utils/SnackBar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class FoodController extends GetxController {
  Rx<DateTime> currentDateTime = DateTime.now().obs;
  RxDouble sliderValue = 1.0.obs;
  RxInt formattedTime = 0.obs;
  RxInt currentIndex = 0.obs;
  RxString mealTypeValue = "".obs;
  Rx<FoodSendModel> foodSendModel = FoodSendModel().obs;
  RxList<FoodSubList> listFoodSub = <FoodSubList>[].obs;
  RxList<FoodList> listFood = <FoodList>[].obs;
  RxList<Default> listfoodDefault = <Default>[].obs;
  RxInt noOfGlasses = 0.obs;

  TextEditingController noteTextController = TextEditingController();
  TextEditingController foodTextController = TextEditingController();

  // RxList<FoodList> listFood = [].obs;

  RxBool loader = false.obs;
  RxBool switchValue = true.obs;
  RxBool connectionStatus = false.obs;
  RxInt endTimeDifference = 0.obs;
  RxInt startTimeDifference = 0.obs;
  SignUpController _signUpController = Get.find();
  RxInt modelMealIndex = 0.obs;

  @override
  void onInit() async {
    super.onInit();
    formattedTime = int.parse(
            DateFormat.Hm().format(currentDateTime.value).split(":").first)
        .obs;
    // onTapBlank();
    mealSelected();
  }

  // onTapBlank() {
  //   if (foodSendModel.value.items == null) {
  //     foodSendModel.value.items = [];
  //   }

  //   FoodList foodlist =
  //       FoodList(children: [], value: FoodValue(str: mealTypeValue.value));
  //   foodSendModel.value.items.add(foodlist);
  //   FoodSubList child = FoodSubList(
  //       tid: _signUpController
  //           .food.value.items.first.children.first.items.first.tid,
  //       value: FoodSubValue(arr: []));

  //   foodSendModel.value.items.first.children.add(child);
  //   foodSendModel.refresh();
  //   _signUpController.food.refresh();
  // }

  onSave() async {
    if (foodSendModel.value.items == null) {
      foodSendModel.value.items = [];
    }
    List<String> list = [];

    listfoodDefault.forEach((element) {
      list.add(element.value);
    });
    FoodSubList foodTypeModel = FoodSubList(
        tid: "food-breakfast_eat",
        kind: "tags",
        dtype: "arr",
        value: FoodSubValue(arr: list));
    listFoodSub.add(foodTypeModel);
    listFoodSub.refresh();
    FoodList foodModel = FoodList(
        children: listFoodSub.value,
        tid: _signUpController.food.value.items.last.tid,
        kind: _signUpController.food.value.items.last.kind,
        dtype: "str",
        value: FoodValue(str: mealTypeValue.value));
    print("meal:${mealTypeValue.value}");
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
    final data =
        await ServiceApi().foodTrackApi(bodyData: foodSendModel.toJson());

    if (data is FoodResponseModel) {
      Get.back();
      CustomSnackBar().successSnackBar(
          title: "Success", message: "Foods Added Successfully");
    } else {
      CustomSnackBar().errorSnackBar(title: "Error", message: data.message);
    }
  }

  getFood() async {
    final data = await ServiceApi().getFoodList();
    if (data == null) {
      Get.offAllNamed(signIn);
    }
    print("Data: $data");
  }

  // onOptionTapped({Default model, List<String> modelValue}) {
  //   model.required = !model.required;

  //   if (model.required) {
  //     print("list:${listfoodDefault.value}");
  //     if (!modelValue.contains(model.value)) {
  //       modelValue.add(model.value);
  //       listfoodDefault.add(model);
  //     }
  //   } else {
  //     print("listrem:${listfoodDefault.value}");

  //     if (modelValue.contains(model.value)) {
  //       modelValue.remove(model.value);
  //       listfoodDefault.remove(model);
  //     }
  //   }
  //   _signUpController.food.refresh();

  //   return modelValue;
  // }

  mealSelected() {
    _signUpController.food.value.items?.first?.list
            ?.options[modelMealIndex.value].optionDefault =
        !_signUpController.food.value.items?.first?.list
            ?.options[modelMealIndex.value].optionDefault;
  }
}
