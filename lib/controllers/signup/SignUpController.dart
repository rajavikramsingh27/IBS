import 'package:flutter/material.dart';
import 'package:flutter_ibs/controllers/my_profile/MyProfileController.dart';
import 'package:flutter_ibs/models/response_model/TrackablesListModel.dart';
import 'package:flutter_ibs/models/signup/SignupResponseModel.dart';
import 'package:flutter_ibs/models/signup/SignupSendModel.dart';
import 'package:flutter_ibs/routes/RouteConstants.dart';
import 'package:flutter_ibs/services/ServiceApi.dart';
import 'package:flutter_ibs/utils/ConnectionCheck.dart';
import 'package:flutter_ibs/utils/SnackBar.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  var trackList = TrackablesListModel().obs;
  RxString selectedGender = "".obs;
  RxBool selectedMale = false.obs;
  RxBool selectedFeMale = false.obs;
  RxBool selectedOtherGender = false.obs;

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
    if (connectionStatus.value) {
      loader.value = true;
      await getTrackList();
      loader.value = false;
    }
  }

  onAutovalidate() async {
    if (formKey.currentState.validate()) {
      print("validate");
      bool check = await ConnectionCheck().initConnectivity();
      if (check) {
        Get.dialog(Center(), barrierDismissible: false);
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
    } else {
      print("not validate");
    }
  }

  registrationApi() async {
    final MyProfileController _myProFileController = Get.find();
    DiagnosedIbsSendModel diagnoisedModel = DiagnosedIbsSendModel(
      isDiagnosed: _myProFileController.isDiagnoisedIbs.value,
      ibsType: _myProFileController
          .selectIbsType(_myProFileController.selctedIbsType.value),
    );
    RomeivSendModel romeivSendModel = RomeivSendModel(
      abdominalPain: _myProFileController.isDiagnoisedAbdominalPain.value,
      abdominalPainBowelAppearDifferent:
          _myProFileController.isabdominalPainBowelAppearDifferent.value,
      abdominalPainBowelMoreLess:
          _myProFileController.isabdominalPainBowelMoreLess.value,
      abdominalPainTimeBowel:
          _myProFileController.isabdominalPainTimeBowel.value,
      stool: _myProFileController
          .selectStoolType(_myProFileController.selectedStoolType.value),
    );
    ProfileSendModel profileModel = ProfileSendModel(
        sex: selectedGender.value,
        age: selectedAge.value,
        familyHistory: selectedIbsHistory.value,
        diagnosedIbs: diagnoisedModel,
        romeiv: romeivSendModel);
    SignupSendModel model = SignupSendModel(
      email: emailController?.text,
      password: passwordController?.text,
      agreeTos: agreeToTerms.value,
      profile: profileModel,

      // profile:
    );
    final data = await ServiceApi().signupApi(bodyData: model.toJson());

    if (data is SignupResponseModel) {
      if (data.loginId.isNotEmpty) {
        // Get.back();
        CustomSnackBar().successSnackBar(
            title: "Success", message: "Registered Successfully");
        Get.offAllNamed(logIn);
      } else {
        Get.back();
        CustomSnackBar()
            .errorSnackBar(title: "Error", message: "Something went wrong");
      }
    } else {
      CustomSnackBar().errorSnackBar(title: "Error", message: data.message);
    }
  }

  getTrackList() async {
    await ServiceApi().getTrackables().then((value) {
      trackList.value = value;
    });
  }
}
