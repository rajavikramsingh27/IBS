import 'package:flutter_ibs/controllers/signup/SignUpController.dart';
import 'package:flutter_ibs/models/food/FoodResponseModel.dart';
import 'package:flutter_ibs/models/food/FoodSendModel.dart';
import 'package:flutter_ibs/models/response_model/TrackablesListModel.dart';
import 'package:flutter_ibs/routes/RouteConstants.dart';
import 'package:flutter_ibs/services/ServiceApi.dart';
import 'package:flutter_ibs/utils/ConnectionCheck.dart';
import 'package:flutter_ibs/utils/SnackBar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class FoodController extends GetxController {
  Rx<DateTime> currentDateTime = DateTime.now().obs;
  RxDouble sliderValue = 1.0.obs;
  RxInt formattedTime = 0.obs;
  RxInt currentIndex = 0.obs;
  List<FoodIItemModel> items;
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

  foodApi() async {
    FoodSendModel model = FoodSendModel(
      category: "food",
    );
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

  time(int index) {
    switch (index) {
      case 0:
        return (formattedTime.value == 04 && formattedTime.value < 12);
        break;

      case 1:
        return (formattedTime.value == 12 && formattedTime.value < 15);
        break;

      case 2:
        return (formattedTime.value == 15 && formattedTime.value < 17);
        break;

      case 3:
        return (formattedTime.value == 17 && formattedTime.value < 21) ||
            (formattedTime.value == 21 && formattedTime.value < 04);
        break;
      default:
        break;
    }
  }

  onOptionTapped([TagsDefault model]) {
    model.required = !model.required;
    _signUpController.food.refresh();
  }

  mealIndex(int index) {
    modelMealIndex.value = index;
  }
}
