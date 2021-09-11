

import 'package:flutter/material.dart';

import 'package:flutter_ibs/services/ServiceApi.dart';
import 'package:flutter_ibs/utils/ConnectionCheck.dart';
import 'package:flutter_ibs/utils/SnackBar.dart';
import 'package:get/get.dart';
import 'package:flutter_ibs/utils/Validator.dart';
RxBool loader = false.obs;


class MyAccountController extends GetxController {

  TextEditingController emailController;
  TextEditingController passwordController;

  RxString selectedGender = "".obs;
  RxBool selectedMale = false.obs;
  RxBool selectedFeMale = false.obs;
  RxBool selectedOtherGender = false.obs;

  RxString selectedIbsHistory = "".obs;
  RxBool selectedIbsHistoryYes = false.obs;
  RxBool selectedIbsHistoryNo = false.obs;
  RxBool selectedIbsHistoryUnsure = false.obs;

  RxString selectedAge = "<20".obs;
  List<String> ageList = [
    "<20",
    "20-29",
    "30-39",
    "40-49",
    "50-59",
    "60-69",
    "70+"
  ];

  @override
  void onInit() async {
    super.onInit();

    emailController = TextEditingController();
    passwordController = TextEditingController();

    getUserList();
  }

  getUserList() async {
    bool isInternet = await ConnectionCheck().initConnectivity();

    if (isInternet) {
      loader.value = true;

      try {
        // final data = await ServiceApi().signInApi(bodyData: model.toJson());
        final data = await ServiceApi().getUserList();
        loader.value = false;
        print(data);
      } catch (error) {
        error.message.toString().showError();
        loader.value = false;
      }
    } else {
      CustomSnackBar().errorSnackBar(
          title: "No Internet", message: "No internet Connection");
    }
  }
}