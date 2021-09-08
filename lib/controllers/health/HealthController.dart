

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
