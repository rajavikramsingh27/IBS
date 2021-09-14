

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_ibs/models/MyAccount/MyAccount.dart';

import 'package:flutter_ibs/services/ServiceApi.dart';
import 'package:flutter_ibs/utils/ConnectionCheck.dart';
import 'package:flutter_ibs/utils/SnackBar.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';

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

  Rx<Profile> profileUser = Profile().obs;

  List<String> ageList = [
    "<20",
    "20-29",
    "30-39",
    "40-49",
    "50-59",
    "60-69",
    "70+"
  ];

  dynamic  data;

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
        data = await ServiceApi().getUserList();

        loader.value = false;

        setUIData();
      } catch (error) {
        CustomSnackBar().errorSnackBar(
            title: "Error!", message: error.message.toString()
        );
        loader.value = false;
      }
    } else {
      CustomSnackBar().errorSnackBar(
          title: "No Internet", message: "No internet Connection"
      );
    }
  }

  setUIData() {
    if (data is MyAccountModel) {
      emailController.text = data.label;
      passwordController.text = '******* ';
      selectedAge.value = data.profile.age;

      if (data.profile.sex == 'm') {
        selectedMale.value = true;
        selectedFeMale.value = false;
        selectedOtherGender.value = false;
      } else if (data.profile.sex == 'f') {
        selectedMale.value = false;
        selectedFeMale.value = true;
        selectedOtherGender.value = false;
      } else {
        selectedMale.value = false;
        selectedFeMale.value = false;
        selectedOtherGender.value = true;
      }

      if (data.profile.familyHistory == 'yes') {
        selectedIbsHistoryYes.value = true;
        selectedIbsHistoryNo.value = false;
        selectedIbsHistoryUnsure.value = false;
      } else if (data.profile.familyHistory == 'no') {
        selectedIbsHistoryYes.value = false;
        selectedIbsHistoryNo.value = true;
        selectedIbsHistoryUnsure.value = false;
      } else {
        selectedIbsHistoryYes.value = false;
        selectedIbsHistoryNo.value = false;
        selectedIbsHistoryUnsure.value = true;
      }
    }
  }

  updateUser() async {

    Profile profileUser = Profile(
        sex: selectedGender.value,
        age: selectedAge.value,
        familyHistory: selectedIbsHistory.value,
        diagnosedIbs: data.profile.diagnosedIbs,
    );

    Map hello = {'profile': profileUser.toJson()};
    print(hello);
    print('hellohellohellohellohellohello');

    data = await ServiceApi().updateUser(
        bodyData: hello,
    );

  }

}


