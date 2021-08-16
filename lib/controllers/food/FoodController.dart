import 'package:flutter_ibs/models/food/FoodResponseModel.dart';
import 'package:flutter_ibs/models/food/FoodSendModel.dart';
import 'package:flutter_ibs/services/ServiceApi.dart';
import 'package:flutter_ibs/utils/SnackBar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class FoodController extends GetxController {
  Rx<DateTime> now = DateTime.now().obs;
  RxDouble sliderValue = 1.0.obs;
  RxInt formattedTime = 0.obs;
  RxInt currentIndex = 0.obs;
  List<FoodIItemModel> items;

  RxBool switchValue = true.obs;

  onTapped(int index) async {
    currentIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
    formattedTime = int.parse(DateFormat('kk').format(now.value)).obs;
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
}
