import 'package:flutter/material.dart';
import 'package:flutter_ibs/controllers/signup/SignUpController.dart';
import 'package:flutter_ibs/models/BowelMovementsModel/BowelMovementsModel.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BowelMovementController extends GetxController {
  Rx<DateTime> now = DateTime.now().obs;
  RxDouble sliderValue = 1.0.obs;
  RxInt formattedTime = 0.obs;
  RxInt currentIndex = 0.obs;
  TextEditingController noteTextController = TextEditingController();
  SignUpController _signUpController = Get.find();
  RxBool loader = false.obs;

  RxBool switchValue = true.obs;
  Rx<BowelMovementsModel> bowelMovementsModel = BowelMovementsModel().obs;

  onTapped(int index) async {
    currentIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
    formattedTime = int.parse(DateFormat('kk').format(now.value)).obs;
  }
  onSave() async {
    if (bowelMovementsModel.value.items == null) {
      bowelMovementsModel.value.items = [];
    }
    Item item = Item(
        tid: _signUpController.symptoms.value.items.last.tid,
        kind: _signUpController.symptoms.value.items.last.kind,
        dtype: "str",
        value: ItemValue(str: noteTextController.text));
    bowelMovementsModel.value.items.add(item);
    bowelMovementsModel.refresh();
    print("DATA Model : ${bowelMovementsModel.toJson()}");
    /*loader.value = true;
    final data =
    await ServiceApi().postSymptomsAPI(bodyData: bowelMovementsModel.toJson());
    loader.value = false;
    if (data is SymptomsResponseModel) {
      noteTextController.clear();
      _signUpController.getTrackList();
      Get.back();
      CustomSnackBar().successSnackBar(
          title: "Success", message: "Symptoms Added Successfully");
    } else {
      CustomSnackBar().errorSnackBar(title: "Error", message: data.message);
    }*/
  }

}
