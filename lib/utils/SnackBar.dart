import 'package:flutter/material.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:get/get.dart';

class CustomSnackBar {
  void successSnackBar({required String title, required String message}) {
    Get.snackbar(title, message,
        backgroundColor: AppColors.borderColor,
        colorText: Colors.black,
        snackStyle: SnackStyle.FLOATING,
        snackPosition: SnackPosition.TOP,
        borderColor: Colors.green,
        borderWidth: 2,
        icon: Icon(
          Icons.check_circle,
          color: Colors.green,
        ));
  }

  void errorSnackBar({required String title, required String message}) {
    Get.snackbar(title, message,
        backgroundColor: AppColors.borderColor,
        colorText: Colors.black,
        snackStyle: SnackStyle.FLOATING,
        snackPosition: SnackPosition.TOP,
        borderColor: Colors.red,
        borderWidth: 2,
        icon: Icon(
          Icons.error,
          color: Colors.red,
        ));
  }
}
