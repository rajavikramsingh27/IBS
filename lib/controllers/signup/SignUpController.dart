import 'package:flutter/material.dart';
import 'package:flutter_ibs/Store/HiveStore.dart';
import 'package:flutter_ibs/controllers/my_profile/MyProfileController.dart';
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:flutter_ibs/models/signup/SignupResponseModel.dart';
import 'package:flutter_ibs/models/signup/SignupSendModel.dart';
import 'package:flutter_ibs/routes/RouteConstants.dart';
import 'package:flutter_ibs/services/ServiceApi.dart';
import 'package:flutter_ibs/utils/ConnectionCheck.dart';
import 'package:flutter_ibs/utils/SnackBar.dart';
import 'package:get/get.dart';
import 'package:flutter_ibs/utils/Validator.dart';
import 'dart:developer' as developer;

class SignUpController extends GetxController {
  Rx<TrackablesListModel> trackList = TrackablesListModel().obs;

  RxString selectedGender = "".obs;
  RxBool selectedMale = false.obs;
  RxBool selectedFeMale = false.obs;
  RxBool selectedOtherGender = false.obs;
  List<TrackableItem> symptomsList = [];
  List<TrackableItem> bowelMoveList = [];
  List<TrackableItem> foodList = [];
  List<TrackableItem> wellnessList = [];
  List<TrackableItem> medicationList = [];
  List<TrackableItem> journalList = [];

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

  RxString selectedIbsHistory = "".obs;
  RxBool selectedIbsHistoryYes = false.obs;
  RxBool selectedIbsHistoryNo = false.obs;
  RxBool selectedIbsHistoryUnsure = false.obs;

  var formKey = GlobalKey<FormState>();
  TextEditingController emailController;
  TextEditingController phoneController;
  TextEditingController passwordController;
  TextEditingController confirmPasswordController;
  RxBool isPasswordVisible = true.obs;
  RxBool agreeToTerms = false.obs;
  Rx<TrackableItem> symptoms = TrackableItem().obs;
  Rx<TrackableItem> bowelMovements = TrackableItem().obs;
  Rx<TrackableItem> food = TrackableItem().obs;
  Rx<TrackableItem> journal = TrackableItem().obs;
  Rx<TrackableItem> medications = TrackableItem().obs;
  Rx<TrackableItem> healthWellness = TrackableItem().obs;

  RxList<ListOption> listFoodOptions = <ListOption>[].obs;

  RxBool loader = false.obs;
  RxBool connectionStatus = false.obs;

  @override
  void onInit() async {
    super.onInit();

    emailController = TextEditingController();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    connectionStatus.value = true;
    bool isInternet = await ConnectionCheck().initConnectivity();
    connectionStatus.value = isInternet;
  }

  onAutovalidate() async {
    if (emailController.text.isEmpty) {
      'Enter Email'.showError();
    } else if (!emailController.text.isValidEmail()) {
      'Enter Valid Email'.showError();
    } else if (passwordController.text.isEmpty) {
      'Enter Password'.showError();
    } else if (passwordController.text.length < 6) {
      'Password should be 6 character'.showError();
    } else if (confirmPasswordController.text.isEmpty) {
      'Enter Confirm Password'.showError();
    }  else if (isFormValid()) {

    } else {
      bool check = await ConnectionCheck().initConnectivity();

      if (check) {
        try {
          registrationApi();
        } catch (e) {
          Get.back();
        }
        //Get.toNamed(home);
      } else {
        CustomSnackBar().errorSnackBar(
            title: "No Internet", message: "No internet Connection");
      }

    }



    // if (formKey.currentState.validate()) {
    //   print("validate");
    //   bool check = await ConnectionCheck().initConnectivity();
    //   if (check) {
    //     try {
    //       registrationApi();
    //     } catch (e) {
    //       Get.back();
    //     }
    //     //Get.toNamed(home);
    //   } else {
    //     CustomSnackBar().errorSnackBar(
    //         title: "No Internet", message: "No internet Connection");
    //   }
    // } else {
    //   print("not validate");
    // }
  }

  registrationApi() async {
    final MyProfileController _myProFileController = Get.find();
    DiagnosedIbsSendModel diagnoisedModel = DiagnosedIbsSendModel(
      isDiagnosed: _myProFileController.isDiagnoisedIbs.value ?? false,
      ibsType: _myProFileController
          .selectIbsType(_myProFileController.selctedIbsType.value),
    );

    RomeivSendModel romeivSendModel = RomeivSendModel(
      abdominalPain:
      _myProFileController.isDiagnoisedAbdominalPain.value ?? false,
      abdominalPainBowelAppearDifferent:
      _myProFileController.isabdominalPainBowelAppearDifferent.value ??
          false,
      abdominalPainBowelMoreLess:
      _myProFileController.isabdominalPainBowelMoreLess.value ?? false,
      abdominalPainTimeBowel:
      _myProFileController.isabdominalPainTimeBowel.value ?? false,
      stool: _myProFileController.selectStoolType(
          _myProFileController.selectedStoolType.value ?? null),
    );

    // Recursively loop through category descendants to compile
    // a flat list of all enabled values:
    trackList.value.data.forEach((element) {
      _recursivelyParseChildren(element.items);
    });

    /* IAN: Deprecated. This was only walking the top level list.
      Data needed to include child[x].items

    trackList.value.data.forEach((element) {
      if (element.category == "symptoms") {
        element.items.forEach((el) {
          if (el.enabledDefault ?? false) {
            symptomsList.add(el);
          }
        });
      } else if (element.category == "bowelMovements") {
        element.items.forEach((el) {
          if (el.enabledDefault ?? false) {
            bowelMoveList.add(el);
          }
        });
      }

      if (element.category == "food") {
        element.items.forEach((el) {
          if (el.enabledDefault ?? false) {
            foodList.add(el);
          }
        });
      }
      if (element.category == "healthWellness") {
        element.items.forEach((el) {
          if (el.enabledDefault ?? false) {
            wellnessList.add(el);
          }
        });
      }

      if (element.category == "medications") {
        element.items.forEach((el) {
          if (el.enabledDefault ?? false) {
            medicationList.add(el);
          }
        });
      }

      if (element.category == "journal") {
        element.items.forEach((el) {
          if (el.enabledDefault ?? false) {
            journalList.add(el);
          }
        });
      }

    });
    */


    TrackingSendModel trackModel = TrackingSendModel(
      symptoms: symptomsList,
      bowelMovements: bowelMoveList,
      food: foodList,
      healthWellness: wellnessList,
      medications: medicationList,
    );
    // print("track: ${trackModel.toJson()}");

    ProfileSendModel profileModel = ProfileSendModel(
        sex: selectedGender.value,
        age: selectedAge.value,
        familyHistory: selectedIbsHistory.value,
        diagnosedIbs: diagnoisedModel,
        romeiv: romeivSendModel
    );

    SignupSendModel model = SignupSendModel(
      label: emailController?.text,
      email: emailController?.text,
      password: passwordController?.text,
      agreeTos: agreeToTerms.value,
      profile: profileModel,
      tracking: trackModel,
    );

    print("data: ${model.toJson()}");

    final data = await ServiceApi().signupApi(bodyData: model.toJson());

    if (data is SignupResponseModel) {
      HiveStore().put(Keys.LOGINID, data.loginId);
      HiveStore().put(Keys.EMAIL, data.email);
      Get.offAllNamed(signIn, arguments: [data.loginId, data.email]);

      CustomSnackBar().successSnackBar(
          title: "Success", message: "Registered Successfully");
    } else {
      CustomSnackBar().errorSnackBar(title: "Error", message: data.message);
    }

  }



  getTrackList() async {
    if (connectionStatus.value) {
      loader.value = true;
      await ServiceApi().getTrackables().then((value) {
        trackList.value = value;
      });
      getSymptoms();
      getBowelMovements();
      getFoods();
      getJournalList();
      getMedicationList();
      getHealthWellness();
      loader.value = false;
    }
  }

  bool isFormValid() {
    if (passwordController.text != confirmPasswordController.text) {
      CustomSnackBar()
          .errorSnackBar(title: "Password", message: "Password do not match");
    } else  if (agreeToTerms.value == false) {
      CustomSnackBar().errorSnackBar(
          title: "Terms and Condition",
          message: "Agree to Terms and Condition");

      return false;
    }
    return false;
  }

  bool isFormStep1valid() {
    if (selectedGender.isEmpty) {
      CustomSnackBar().errorSnackBar(title: "Sex", message: "Select Your Sex");

      return false;
    } else if (selectedIbsHistory.isEmpty) {
      CustomSnackBar().errorSnackBar(
          title: "Ibs History", message: "Select Your Ibs History");

      return false;
    } else
      return true;
  }

  navigateToNextScreen() {
    if (isFormStep1valid()) {
      getTrackList();
      Get.toNamed(signup2);
    }
  }

  trackingDataSend(String tid) {
    trackList.value.data.forEach((element) {
      if (element.category == tid) {
        element.items.forEach((el) {
          if (el.enabledDefault ?? false) {
            symptomsList.add(el);
          }
        });
      }
    });
  }

  getSymptoms() {
    trackList.value.data.forEach((element) {
      if (element.category == "symptoms") {
        symptoms.value = element;
      }
    });
  }

  getBowelMovements() {
    trackList.value.data.forEach((element) {
      if (element.category == "bowelMovements") {
        bowelMovements.value = element;
      }
    });
  }

  getFoods() {
    trackList.value.data.forEach((element) {
      if (element.category == "food") {
        food.value = element;
      }
    });
  }

  getJournalList() {
    trackList.value.data.forEach((element) {
      if (element.category == "journal") {
        journal.value = element;
      }
    });
  }

  getMedicationList() {
    trackList.value.data.forEach((element) {
      if (element.category == "medications") {
        medications.value = element;
      }
    });
  }

  getHealthWellness() {
    trackList.value.data.forEach((element) {
      if (element.category == "healthWellness") {
        healthWellness.value = element;
      }
    });
  }


  /// Walk the Trackables tree adding active elements.
  _recursivelyParseChildren(List<TrackableItem> items){
    items.forEach((element) {
      if (element.enabledDefault){
        _addItemToTrackingList(element);
        element.children.forEach( (child) {
          return _recursivelyParseChildren(child.items);
        });
      }
    });
  }

  _addItemToTrackingList(dynamic item){

    switch(item.category){
      case "symptoms":
        symptomsList.add(item);
        break;
      case "bowelMovements":
        bowelMoveList.add(item);
        break;
      case "food":
        foodList.add(item);
        break;
      case "healthWellness":
        wellnessList.add(item);
        break;
      case "medications":
        medicationList.add(item);
        break;
      case "journal":
        journalList.add(item);
        break;
    }
  }
}
