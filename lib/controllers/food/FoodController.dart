import 'package:flutter_ibs/controllers/signup/SignUpController.dart';
import 'package:flutter_ibs/models/food/FoodResponseModel.dart';
import 'package:flutter_ibs/models/food/FoodSendModel.dart';
import 'package:flutter_ibs/models/response_model/TrackablesListModel.dart';
import 'package:flutter_ibs/routes/RouteConstants.dart';
import 'package:flutter_ibs/services/ServiceApi.dart';
import 'package:flutter_ibs/utils/SnackBar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class FoodController extends GetxController {
  Rx<DateTime> currentDateTime = DateTime.now().obs;
  RxDouble sliderValue = 1.0.obs;
  RxInt formattedTime = 0.obs;
  RxInt currentIndex = 0.obs;
  RxList<FoodItemModel> foodItems = [].obs;
  RxList<dynamic> selectedFood = [].obs;
  RxBool loader = false.obs;
  RxBool switchValue = true.obs;
  RxBool connectionStatus = false.obs;
  RxInt endTimeDifference = 0.obs;
  RxInt startTimeDifference = 0.obs;
  SignUpController _signUpController = Get.put(SignUpController());
  RxInt modelMealIndex = 0.obs;
  List<TagsDefault> listTagsDefault = [];

  onTapped(int index) async {
    currentIndex.value = index;
  }

  @override
  void onInit() async {
    super.onInit();

    formattedTime = int.parse(
            DateFormat.Hm().format(currentDateTime.value).split(":").first)
        .obs;

    // bool isInternet = await ConnectionCheck().();
    // connectionStatus.value = isInternet;
    // if (connectionStatus.value) {
    //   loader.value = true;

    // getFood();

    //   loader.value = false;
    // }
  }

  onSave() async {
    FoodSendModel model =
        FoodSendModel(category: "food", items: foodItems.value);

    print("data: ${model.toJson()}");
    final data = await ServiceApi().foodTrackApi(bodyData: model.toJson());

    if (data is FoodResponseModel) {
      CustomSnackBar().successSnackBar(
          title: "Success", message: "Registered Successfully");
      Get.back();
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

  onOptionTapped([TagsDefault model]) {
    model.required = !model.required;
    _signUpController.food.refresh();
  }

  mealIndex(int index) {
    modelMealIndex.value = index;
  }
}
