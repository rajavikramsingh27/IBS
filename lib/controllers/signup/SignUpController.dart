import 'package:flutter/material.dart';
import 'package:flutter_ibs/models/response_model/SignupResponseModel.dart';
import 'package:flutter_ibs/models/send_model/SignupSendModel.dart';
import 'package:flutter_ibs/routes/RouteConstants.dart';
import 'package:flutter_ibs/services/ServiceApi.dart';
import 'package:flutter_ibs/utils/ConnectionCheck.dart';
import 'package:flutter_ibs/utils/SnackBar.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  var formKey = GlobalKey<FormState>();
  TextEditingController emailController;
  TextEditingController phoneController;
  TextEditingController passwordController;
  TextEditingController confirmPasswordController;
  RxBool isPasswordVisible = true.obs;

  @override
  void onInit() {
    super.onInit();

    emailController = TextEditingController();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
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
    SignupSendModel model = SignupSendModel(
      email: emailController.text,
      password: passwordController.text,
    );
    final data = await ServiceApi().signupApi(bodyData: model.toJson());

    if (data is SignupResponseModel) {
      if (data.loginId.isNotEmpty) {
        Get.back();
        // Get.back();
        CustomSnackBar().successSnackBar(
            title: "Success", message: "RegisteredF Successfully");
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
}
