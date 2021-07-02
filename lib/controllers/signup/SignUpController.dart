
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  
  var formKey = GlobalKey<FormState>();
  TextEditingController fullNameController;
  TextEditingController emailController;
  TextEditingController phoneController;
  TextEditingController passwordController;
  TextEditingController confirmPasswordController;
  RxBool indicatorPassword = true.obs;
  RxBool indicatorCPassword = true.obs;

  @override
  void onInit() {
    fullNameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.onInit();
  }

  // onAutovalidate() async {
  //   if (formKey.currentState.validate()) {
  //     print("validate");
  //     // bool check = await ConnectionCheck().initConnectivity();
  //     if (check) {
  //       Get.dialog(
  //           Center(
  //         ),
  //           barrierDismissible: false);
  //       try {
  //         registrationApi();
  //       } catch (e) {
  //         Get.back();
  //       }
  //       //Get.toNamed(home);
  //     } else {
  //       CustomSnackBar().errorSnackBar(
  //           title: "No Internet", message: "No internet Connection");
  //     }
  //   } else {
  //     print("not validate");
  //   }
  // }

  // registrationApi() async {
  //   RegistrationSendModel model = RegistrationSendModel(
  //       name: fullNameController.text,
  //       email: emailController.text,
  //       phone: phoneController.text,
  //       password: passwordController.text,
  //       passwordConfirmation: confirmPasswordController.text);
  //   // final data = await ServiceApi().registrationApi(bodyData: model.toJson());
  //   if (data.status) {
  //     Get.back();
  //     // Get.back();
  //     CustomSnackBar().successSnackBar(title: "Success", message: data.message);
  //     Get.offAndToNamed(oTPVerifyScreen,
  //         arguments: [data.data.userId, phoneController.text]);
  //   } else {
  //     Get.back();
  //     CustomSnackBar()
  //         .errorSnackBar(title: "Error", message: data.error.elementAt(0));
  //   }
  // }
}
