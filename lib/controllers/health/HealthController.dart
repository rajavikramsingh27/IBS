import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HealthController extends GetxController {
  Rx<DateTime> now = DateTime.now().obs;
  RxDouble sliderStressValue = 1.0.obs;
  RxDouble sliderFatigueValue = 1.0.obs;
  RxDouble sliderActivityValue = 1.0.obs;
  TextEditingController noteTextController = TextEditingController();
  RxInt formattedTime = 0.obs;
  RxInt currentIndex = 0.obs;
  RxBool loader = false.obs;

  RxBool switchValue = true.obs;

  onTapped(int index) async {
    currentIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
    formattedTime = int.parse(DateFormat('kk').format(now.value)).obs;
  }
  void onSave(){

  }
}
