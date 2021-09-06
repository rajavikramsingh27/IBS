import 'package:flutter/cupertino.dart';
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HealthController extends GetxController {
  Rx<DateTime> now = DateTime.now().obs;
  TextEditingController noteTextController = TextEditingController();
  RxInt formattedTime = 0.obs;
  RxInt currentIndex = 0.obs;
  RxBool loader = false.obs;
  List<String> timeList = ["01:00","02:00","03:00","04:00","05:00","06:00","07:00","08:00","09:00","10:00","11:00","12:00","13:00","14:00","15:00","16:00","17:00","18:00","19:00","20:00","21:00","22:00","23:00","24:00",];
  RxString selectedTime = "01:00".obs;
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

  void onOptionTapped({ListOption model}) {}
}
