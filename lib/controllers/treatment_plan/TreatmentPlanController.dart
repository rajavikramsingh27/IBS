import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TreatmentPlanController extends GetxController {
  PageController pageController = PageController(initialPage: 0);
  RxDouble currentPage = 0.0.obs;
  RxInt selectedindex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    pageController.addListener(() {
      currentPage.value = pageController.page!;
    });
  }
}
