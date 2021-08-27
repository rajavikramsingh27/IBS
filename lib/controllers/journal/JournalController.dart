import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class JournalController extends GetxController {
  Rx<DateTime> now = DateTime.now().obs;
  RxDouble sliderValue = 1.0.obs;
  RxInt formattedTime = 0.obs;

  TextEditingController noteTextController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    formattedTime = int.parse(DateFormat('kk').format(now.value)).obs;
  }
}
