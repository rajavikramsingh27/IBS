import 'package:flutter/material.dart';
import 'package:flutter_ibs/Store/HiveStore.dart';
import 'package:flutter_ibs/models/login/LoginResponseModel.dart';
import 'package:flutter_ibs/models/login/LoginSendModel.dart';
import 'package:flutter_ibs/routes/RouteConstants.dart';
import 'package:flutter_ibs/services/ServiceApi.dart';
import 'package:flutter_ibs/utils/ConnectionCheck.dart';
import 'package:flutter_ibs/utils/SnackBar.dart';
import 'package:flutter_ibs/utils/Validator.dart';
import 'package:get/get.dart';



class SignInController extends GetxController {
  var formKey = GlobalKey<FormState>();
  TextEditingController emailController;

  TextEditingController passwordController;

  RxBool isPasswordVisible = true.obs;

  RxBool loader = false.obs;
  RxBool connectionStatus = false.obs;

  @override
  void onInit() async {
    super.onInit();

    emailController = TextEditingController();

    passwordController = TextEditingController();

    connectionStatus.value = true;
    bool isInternet = await ConnectionCheck().initConnectivity();
    connectionStatus.value = isInternet;

    if (connectionStatus.value) {
      loader.value = true;

      loader.value = false;
    }
  }

  onAutoValidate() async {
    if (emailController.text.isEmpty) {
      'Enter Email'.showError();
    } else if (!emailController.text.isValidEmail()) {
      'Enter Valid Email'.showError();
    } else if (passwordController.text.isEmpty) {
      'Enter Password'.showError();
    } else if (passwordController.text.length < 6) {
      'Password should be 6 character'.showError();
    } else {
      bool check = await ConnectionCheck().initConnectivity();
      if (check) {
        try {
          signInApi();
        } catch (e) {
          loader.value = false;
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
    //   loader.value = true;

      // bool check = await ConnectionCheck().initConnectivity();
      // if (check) {
      //   try {
      //     signInApi();
      //   } catch (e) {
      //     loader.value = false;
      //     Get.back();
      //   }
      //   //Get.toNamed(home);
      // } else {
      //   CustomSnackBar().errorSnackBar(
      //       title: "No Internet", message: "No internet Connection");
      // }

    // } else {
    //   print("not validate");
    // }
  }

  signInApi() async {
    LoginSendModel model = LoginSendModel(
      strategy: "local",
      loginId: HiveStore().get(Keys.LOGINID),
      password: passwordController?.text,
    );

    try {
      final data = await ServiceApi().signInApi(bodyData: model.toJson());

      if (data is LoginResponseModel) {
        HiveStore().put(Keys.USERID, data.id);

        CustomSnackBar().successSnackBar(
            title: "Success", message: "SignIn Successfully"
        );
        Get.offAllNamed(home);
      } else {
        loader.value = false;
      }
    } catch (error) {
      error.message.toString().showError();
    }
  }

}
