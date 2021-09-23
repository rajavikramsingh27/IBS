

import 'package:flutter/material.dart';
import 'package:flutter_ibs/controllers/trackables/TrackablesController.dart';
import 'package:flutter_ibs/models/MyAccount/MyAccount.dart';
import 'package:flutter_ibs/models/signup/SignupSendModel.dart';
import 'package:flutter_ibs/services/ServiceApi.dart';
import 'package:flutter_ibs/utils/ConnectionCheck.dart';
import 'package:flutter_ibs/utils/SnackBar.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:flutter_ibs/screens/TrackingOptions/TrackingOptions.dart';


RxBool loader = false.obs;

class MyAccountController extends GetxController {
  TrackablesController trackablesController = Get.find();

  RxString settingType = "0".obs;

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

  RxInt selectedStoolType = 0.obs;
  RxInt selctedIbsType = 0.obs;
  RxString IbsTypeValue = "c".obs;

  RxBool isDiagnoisedAbdominalPain = false.obs;
  RxBool isabdominalPainTimeBowel = false.obs;
  RxBool isabdominalPainBowelMoreLess = false.obs;
  RxBool isabdominalPainBowelAppearDifferent = false.obs;


  List<TrackableItem> trackingUpdatesList;


  Rx<TrackablesListModel> trackList = TrackablesListModel().obs;
  RxBool connectionStatus = false.obs;


  RxList<ListOption> listFoodOptions = <ListOption>[].obs;

  @override
  void onInit() async {
    super.onInit();

    connectionStatus.value = true;
    bool isInternet = await ConnectionCheck().initConnectivity();
    connectionStatus.value = isInternet;

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
        } else if (settingType == '2') {
          setUIDataRomeIV();
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
    // IbsTypeValue = selectIbsType(selctedIbsType.value);
  }

  setUIDataRomeIV() {
    final selctedIbs = getIbsType(data.profile.diagnosedIbs.ibsType);
    selctedIbsType.value = selctedIbs;
    selectIbsType(selctedIbsType.value);

    isDiagnoisedAbdominalPain.value = data.profile.romeiv.abdominalPain;
    isabdominalPainTimeBowel.value = data.profile.romeiv.abdominalPainTimeBowel;
    isabdominalPainBowelMoreLess.value = data.profile.romeiv.abdominalPainBowelMoreLess;
    isabdominalPainBowelAppearDifferent.value = data.profile.romeiv.abdominalPainBowelAppearDifferent;

    selectedStoolType.value = selectStoolTypeIndex(data.profile.romeiv.stool);
  }

  updateUser() async {
    Profile profileUser = Profile(
      sex: selectedGender.value,
      age: selectedAge.value,
      familyHistory: selectedIbsHistory.value,
      diagnosedIbs: data.profile.diagnosedIbs,
      romeiv: data.profile.romeiv,
    );

    data = await ServiceApi().updateUser(
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
      romeiv: data.profile.romeiv,
    );

    data = await ServiceApi().updateIBS_RomeIV(
      bodyData: profileUser.toJson(),
    );

  }

  updateRomeIVQuestionaire() async {
    Romeiv romeiv = Romeiv(
       abdominalPain: isDiagnoisedAbdominalPain.value,
       abdominalPainTimeBowel: isabdominalPainTimeBowel.value,
       abdominalPainBowelMoreLess: isabdominalPainBowelMoreLess.value,
       abdominalPainBowelAppearDifferent: isabdominalPainBowelAppearDifferent.value,
       stool: selectStoolType(selectedStoolType.value),
    );

    Profile profileUser = Profile(
      sex: data.profile.sex,
      age: data.profile.age,
      familyHistory: data.profile.familyHistory,
      diagnosedIbs: data.profile.diagnosedIbs,
      romeiv: romeiv,
    );

    data = await ServiceApi().updateIBS_RomeIV(
      bodyData: profileUser.toJson(),
    );

  }

  updateTrackingOption() async {
    trackingUpdatesList = [];
    trackablesController.trackList.value.data.forEach((element) {
      _recursivelyParseChildren(element.items);
    });

    Map<String, dynamic> toSend = new Map();
    toSend.assign("tracking", List<dynamic>.from(trackingUpdatesList.map((x) => x.toJson())) );

    data = await ServiceApi().updateTrackingOption(
      bodyData: toSend,
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
        return "both";
    }

  }

  selectStoolTypeIndex(String stoolValue) {
    switch (stoolValue) {
      case 'constipated':
        return 0;
        break;
      case 'diarrhea':
        return 1;
        break;
      case 'normal':
        return 2;
        break;
      case 'both':
        return 3;
        break;
      default:
        return 4;
    }

  }

  /*
  getTrackList() async {
    if (connectionStatus.value) {
      loader.value = true;
      await ServiceApi().getTrackables().then((value) {
        // Sort the list bw "weight" property ascending:
        value.data.sort((a, b) {
          return a.weight.compareTo(b.weight);
        });

        trackList.value = value;
      });
      setUITrackingOption();

      loader.value = false;

    }
  }



  setUITrackingOption() {
    getSymptoms();
    getBowelMovements();
    getFoods();
    getJournalList();
    getMedicationList();
    getHealthWellness();
  }
*/
  // trackingDataSend(String tid) {
  //   trackList.value.data.forEach((element) {
  //     if (element.category == tid) {
  //       element.items.forEach((el) {
  //         if (el.enabledDefault ?? false) {
  //           symptomsList.add(el);
  //         }
  //       });
  //     }
  //   });
  // }
/*
  getSymptoms() {
    trackList.value.data.forEach((element) {
      if (element.tid == "symptoms") {
        symptoms.value = element;
      }
    });
  }

  getBowelMovements() {
    trackList.value.data.forEach((element) {
      if (element.tid == "bowelMovements") {
        bowelMovements.value = element;
      }
    });
  }

  getFoods() {
    trackList.value.data.forEach((element) {
      if (element.tid == "foods") {
        food.value = element;
      }
    });
  }

  getJournalList() {
    trackList.value.data.forEach((element) {
      if (element.tid == "journal") {
        journal.value = element;
      }
    });
  }

  getMedicationList() {
    trackList.value.data.forEach((element) {
      if (element.tid == "medications") {
        medications.value = element;
      }
    });
  }

  getHealthWellness() {
    trackList.value.data.forEach((element) {
      if (element.tid == "healthWellness") {
        healthWellness.value = element;
      }
    });
  }
*/
  _recursivelyParseChildren(List<TrackableItem> items){
    items.forEach((element) {
        trackingUpdatesList.add(element);
        element.children.forEach( (child) {
          return _recursivelyParseChildren(child.items);
        });

    });
  }



}


