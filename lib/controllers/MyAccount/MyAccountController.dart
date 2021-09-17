

import 'package:flutter/material.dart';
import 'package:flutter_ibs/models/MyAccount/MyAccount.dart';

import 'package:flutter_ibs/services/ServiceApi.dart';
import 'package:flutter_ibs/utils/ConnectionCheck.dart';
import 'package:flutter_ibs/utils/SnackBar.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';

RxBool loader = false.obs;


class MyAccountController extends GetxController {

  RxString settingType = "".obs;

  // ToDo Setting My Account variables
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


  // ToDo Setting My IBS Diagnosis variables

  RxInt pagecount = 0.obs;
  RxInt pagecount2 = 0.obs;

  RxBool isDiagnoisedIbs = true.obs;
  RxBool checkBoxValue = false.obs;

  RxInt selctedIbsType = 0.obs;
  RxBool isDiagnoisedAbdominalPain = false.obs;
  RxBool isabdominalPainTimeBowel = false.obs;
  RxBool isabdominalPainBowelMoreLess = false.obs;
  RxBool isabdominalPainBowelAppearDifferent = false.obs;
  RxInt selectedStoolType = 0.obs;



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
        if (settingType == '0') {
          setUIDataMyAccount();
        } else if (settingType == '1') {
          setUIDataMyIBSDiagnosis();
        }

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

  setUIDataMyAccount() {
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

  setUIDataMyIBSDiagnosis() {
    final selctedIbs = getIbsType(data.profile.diagnosedIbs.ibsType);
    selctedIbsType.value = selctedIbs;
    selectIbsType(selctedIbsType.value);
  }

  updateUser() async {
    Profile profileUser = Profile(
      sex: selectedGender.value,
      age: selectedAge.value,
      familyHistory: selectedIbsHistory.value,
      diagnosedIbs: data.profile.diagnosedIbs,
    );



    // Profile profileUser = Profile(
    //     sex: selectedGender.value,
    //     age: selectedAge.value,
    //     familyHistory: selectedIbsHistory.value,
    //     diagnosedIbs: diagnosedIbs,
    //     romeiv: data.profile.romeiv,
    // );

    // Map mapProfile = {
    //   "profile": {
    //     "sex": "f",
    //     "age": "30-39",
    //     "familyHistory": "yes",
    //     "diagnosedIbs": {
    //       "isDiagnosed": true,
    //       "ibsType": "c"
    //     },
    //     "romeiv": {
    //       "abdominalPain": true,
    //       "abdominalPainTimeBowel": true,
    //       "abdominalPainBowelMoreLess": true,
    //       "abdominalPainBowelAppearDifferent": true,
    //       "stool": "constipated"
    //     }
    //   },
    //   "label": "hello@gmail.com"
    // };

    Map<String, dynamic> mapProfile = {"profile":{"sex":"f","age":"30-39","familyHistory":"yes","diagnosedIbs":{"isDiagnosed":true,"ibsType":"c"},"romeiv":{"abdominalPain":true,"abdominalPainTimeBowel":true,"abdominalPainBowelMoreLess":true,"abdominalPainBowelAppearDifferent":true,"stool":"constipated"}},"label":"hello@gmail.com"};

     // final mapString = json.encode(mapProfile);
     // print(mapString);

    data = await ServiceApi().updateUser(
        // bodyData: mapProfile,
      bodyData: profileUser.toJson(),
    );

  }

  updateIBS() async {
    DiagnosedIbs diagnosedIbs = DiagnosedIbs(
      // id: data.profile.diagnosedIbs.id,
        isDiagnosed: data.profile.diagnosedIbs.isDiagnosed,
        ibsType: selectIbsType(selctedIbsType.value)
    ) ;

    Profile profileUser = Profile(
      sex: data.profile.sex,
      age: data.profile.age,
      familyHistory: data.profile.familyHistory,
      diagnosedIbs: diagnosedIbs,
      // romeiv: data.profile.romeiv,
    );

    data = await ServiceApi().updateIBS(
      bodyData: profileUser.toJson(),
    );

  }

// ToDo Setting My IBS Diagnosis functions

  getIbsType(String selectectedIBS) {
    switch (selectectedIBS) {
      case 'c':
        return 0;
        break;
      case 'd':
        return 1;
        break;
      case 'm':
        return 2;
        break;
      case 'u':
        return 3;
        break;
      default:
        return 4;
    }
  }

  selectIbsType(int index) {
    switch (index) {
      case 0:
        return "c";
        break;
      case 1:
        return "d";
        break;
      case 2:
        return "m";
        break;
      case 3:
        return "u";
        break;
      default:
        return "idk";
    }
  }

  selectStoolType(int index) {
    switch (index) {
      case 0:
        return 'constipated';
        break;
      case 1:
        return 'diarrhea';
        break;
      case 2:
        return 'normal';
        break;
      case 3:
        return 'both';
        break;
      default:
        return "null";
    }
  }


}


