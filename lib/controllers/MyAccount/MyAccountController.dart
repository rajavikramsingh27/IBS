

import 'package:flutter/material.dart';
import 'package:flutter_ibs/models/MyAccount/MyAccount.dart';

import 'package:flutter_ibs/services/ServiceApi.dart';
import 'package:flutter_ibs/utils/ConnectionCheck.dart';
import 'package:flutter_ibs/utils/SnackBar.dart';
import 'package:get/get.dart';
import 'package:flutter_ibs/utils/Validator.dart';
RxBool loader = false.obs;


class MyAccountController extends GetxController {

  RxBool loader = true.obs;

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
  }



  getUserList() async {
    bool isInternet = await ConnectionCheck().initConnectivity();

    if (isInternet) {
      loader.value = true;

      try {
        final data = await ServiceApi().getUserList().catchError((error) {
          print(error.message.toString());
        });

        // if (data is MyAccountModel) {
        //   emailController.text = data.label;
        //   passwordController.text = data.label;
        //   //
        //   // if (data.profile.sex == 'm') {
        //   //   selectedMale.value = true;
        //   //   selectedFeMale.value = false;
        //   //   selectedOtherGender.value = false;
        //   // } else if (data.profile.sex == 'f') {
        //   //   selectedMale.value = false;
        //   //   selectedFeMale.value = true;
        //   //   selectedOtherGender.value = false;
        //   // } else {
        //   //   selectedMale.value = false;
        //   //   selectedFeMale.value = false;
        //   //   selectedOtherGender.value = true;
        //   // }
        //   //
        //   // if (data.profile.sex == 'm') {
        //   //   selectedMale.value = true;
        //   //   selectedFeMale.value = false;
        //   //   selectedOtherGender.value = false;
        //   // } else if (data.profile.sex == 'f') {
        //   //   selectedMale.value = false;
        //   //   selectedFeMale.value = true;
        //   //   selectedOtherGender.value = false;
        //   // } else {
        //   //   selectedMale.value = false;
        //   //   selectedFeMale.value = false;
        //   //   selectedOtherGender.value = true;
        //   // }
        //   //
        //   // if (data.profile.familyHistory == 'yes') {
        //   //   selectedIbsHistoryYes.value = true;
        //   //   selectedIbsHistoryNo.value = false;
        //   //   selectedIbsHistoryUnsure.value = false;
        //   // } else if (data.profile.familyHistory == 'no') {
        //   //   selectedIbsHistoryYes.value = false;
        //   //   selectedIbsHistoryNo.value = true;
        //   //   selectedIbsHistoryUnsure.value = false;
        //   // } else {
        //   //   selectedIbsHistoryYes.value = false;
        //   //   selectedIbsHistoryNo.value = false;
        //   //   selectedIbsHistoryUnsure.value = true;
        //   // }
        //   //
        //   // selectedAge.value = '70+';
        // }
        loader.value = false;
      } catch (error) {
        error.message.toString().showError();
        loader.value = false;
      }
    } else {
      CustomSnackBar().errorSnackBar(
          title: "No Internet", message: "No internet Connection"
      );
    }
  }
}