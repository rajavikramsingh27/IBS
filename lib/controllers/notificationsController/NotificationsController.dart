

import 'package:flutter/material.dart';
import 'package:flutter_ibs/models/MyAccount/MyAccount.dart';
import 'package:flutter_ibs/services/ServiceApi.dart';
import 'package:flutter_ibs/utils/ConnectionCheck.dart';
import 'package:flutter_ibs/utils/SnackBar.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:flutter_ibs/screens/TrackingOptions/TrackingOptions.dart';


class NotificationsController extends GetxController {
  TextEditingController messageController;

  RxString remindMeDay = "Every Day".obs;
  RxString remindMeTime = "Select time".obs;

  RxString pickerType = "".obs;

  RxString general = "".obs;
  RxString improveSleepOne = "".obs;
  RxString improveSleepTwo = "".obs;
  RxString prescriptionOne = "".obs;
  RxString prescriptionTwo= "".obs;
  RxString prescriptionThree= "".obs;
  RxString exercise = "".obs;


  @override
  void onInit() async {
    super.onInit();


  }



}