
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_ibs/controllers/signup/SignUpController.dart';
import 'package:flutter_ibs/models/HealthWellnessModel/HealthWellnessModel.dart';
import 'package:flutter_ibs/models/HealthWellnessModel/HealthWellnessResponseModel.dart' as HealthRsp;
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:flutter_ibs/services/ServiceApi.dart';
import 'package:flutter_ibs/utils/SnackBar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HealthController extends GetxController {
  Rx<DateTime> now = DateTime.now().obs;
  TextEditingController noteTextController = TextEditingController();
  RxInt formattedTime = 0.obs;
  RxInt currentIndex = 0.obs;
  RxBool loader = false.obs;
  List<String> timeList = ["01:00","02:00","03:00","04:00","05:00","06:00","07:00","08:00","09:00","10:00","11:00","12:00","13:00","14:00","15:00","16:00","17:00","18:00","19:00","20:00","21:00","22:00","23:00","24:00",];
  RxString selectedTime = "01:00".obs;
  RxBool switchValue = false.obs;
  RxBool tappedRelax = false.obs;
  RxBool bedTimeChanged = false.obs;
  RxBool wakeTimeChanged = false.obs;
  RxBool sleepQualityChanged = false.obs;
  RxBool tirednessChanged = false.obs;


  Rx<HealthWellnessModel> healthWellnessModel = HealthWellnessModel().obs;
  SignUpController _signUpController = Get.find();

  onTapped(int index) async {
    currentIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
    formattedTime = int.parse(DateFormat('kk').format(now.value)).obs;
  }

  void onSave()async{
    if (healthWellnessModel.value.items == null) {
      healthWellnessModel.value.items = [];
    }
    Item item = Item(
        tid: _signUpController.healthWellness.value.items.last.tid,
        kind: _signUpController.healthWellness.value.items.last.kind,
        dtype: "str",
        value: ItemValue(str: noteTextController.text));
    healthWellnessModel.value.items.add(item);
    healthWellnessModel.refresh();
    print("DATA Model : ${json.encode(healthWellnessModel.toJson())}");
    loader.value = true;

    final data = await ServiceApi().postHealthWellnessAPI(bodyData: healthWellnessModel.toJson());
    loader.value = false;
    if (data is HealthRsp.HealthWellnessResponseModel) {
      noteTextController.clear();
      healthWellnessModel.value.items = [];
      _signUpController.getTrackList();
      Get.back();
      CustomSnackBar().successSnackBar(
          title: "Success", message: "Wellness Added Successfully");
    } else {
      CustomSnackBar().errorSnackBar(title: "Error", message: data.message);
    }
  }


  void onOptionTapped({ListOption model, String tid, String kind}) {
    model.optionDefault = !model.optionDefault;

    if (healthWellnessModel.value.items == null) {
      healthWellnessModel.value.items = [];
    }
    if(!switchValue.value){
      switchValue.value = true;
      Item item = Item(
          tid: tid,
          kind: kind,
          dtype: "arr",
          value: ItemValue(arr: []));
      healthWellnessModel.value.items.add(item);
      healthWellnessModel.value.items.forEach((Item element) {
        if(element.tid == tid){
          if (model.optionDefault) {
            if (!element.value.arr.contains(model.value)) {
              element.value.arr.add(model.value);
            }
          } else {
            if (element.value.arr.contains(model.value)) {
              element.value.arr.remove(model.value);
            }
          }
        }
      });

    }else{
        healthWellnessModel.value.items.forEach((Item element) {
          if(element.tid == tid){
            if (model.optionDefault) {
              if (!element.value.arr.contains(model.value)) {
                element.value.arr.add(model.value);
              }
            } else {
              if (element.value.arr.contains(model.value)) {
                element.value.arr.remove(model.value);
              }
            }
          }
        });
    }
    _signUpController.healthWellness.refresh();
    healthWellnessModel.refresh();
  }

  void onRelaxTapped({Tag model, String tid, String kind}) {
    model.required = !model.required;

    if (healthWellnessModel.value.items == null) {
      healthWellnessModel.value.items = [];
    }
    if(!tappedRelax.value){
      switchValue .value = true;
      Item item = Item(
          tid: tid,
          kind: kind,
          dtype: "arr",
          value: ItemValue(arr: []));
      healthWellnessModel.value.items.add(item);
      healthWellnessModel.value.items.forEach((Item element) {
        if(element.tid == tid){
          if (model.required) {
            if (!element.value.arr.contains(model.value)) {
              element.value.arr.add(model.value);
            }
          } else {
            if (element.value.arr.contains(model.value)) {
              element.value.arr.remove(model.value);
            }
          }
        }
      });

    }else{
      healthWellnessModel.value.items.forEach((Item element) {
        if(element.tid == tid){
          if (model.required) {
            if (!element.value.arr.contains(model.value)) {
              element.value.arr.add(model.value);
            }
          } else {
            if (element.value.arr.contains(model.value)) {
              element.value.arr.remove(model.value);
            }
          }
        }
      });
    }
    _signUpController.healthWellness.refresh();
    healthWellnessModel.refresh();
  }

  void onBedTimeTapped({String selectedTime, String tid, String kind}) {
    if (healthWellnessModel.value.items == null) {
      healthWellnessModel.value.items = [];
    }
    if(!bedTimeChanged.value){
      bedTimeChanged.value = true;
      Item item = Item(
          tid: tid,
          kind: kind,
          dtype: "str",
          value: ItemValue(str: selectedTime));
      healthWellnessModel.value.items.add(item);
    }else{
      healthWellnessModel.value.items.forEach((Item element) {
        if(element.tid == tid){
          element.value.str = selectedTime;
        }
      });
    }
    _signUpController.healthWellness.refresh();
    healthWellnessModel.refresh();
  }
  void onWakeTimeTapped({String selectedTime, String tid, String kind}) {
    if (healthWellnessModel.value.items == null) {
      healthWellnessModel.value.items = [];
    }
    if(!wakeTimeChanged.value){
      wakeTimeChanged.value = true;
      Item item = Item(
          tid: tid,
          kind: kind,
          dtype: "str",
          value: ItemValue(str: selectedTime));
      healthWellnessModel.value.items.add(item);
    }else{
      healthWellnessModel.value.items.forEach((Item element) {
        if(element.tid == tid){
          element.value.str = selectedTime;
        }
      });
    }
    _signUpController.healthWellness.refresh();
    healthWellnessModel.refresh();
  }

  void onSleepQualityTapped({String quality, String tid, String kind}) {
    if (healthWellnessModel.value.items == null) {
      healthWellnessModel.value.items = [];
    }
    if(!sleepQualityChanged.value){
      sleepQualityChanged.value = true;
      Item item = Item(
          tid: tid,
          kind: kind,
          dtype: "str",
          value: ItemValue(str: quality));
      healthWellnessModel.value.items.add(item);
    }else{
      healthWellnessModel.value.items.forEach((Item element) {
        if(element.tid == tid){
          element.value.str = quality;
        }
      });
    }
    _signUpController.healthWellness.refresh();
    healthWellnessModel.refresh();
  }

  void onTirednessTapped({num numValue, String tid, String kind}) {
    if (healthWellnessModel.value.items == null) {
      healthWellnessModel.value.items = [];
    }
    if(!tirednessChanged.value){
      tirednessChanged.value = true;
      Item item = Item(
          tid: tid,
          kind: kind,
          dtype: "num",
          value: ItemValue(numValue: numValue,));
      healthWellnessModel.value.items.add(item);
    }else{
      healthWellnessModel.value.items.forEach((Item element) {
        if(element.tid == tid){
          element.value.numValue = numValue;
        }
      });
    }
    _signUpController.healthWellness.refresh();
    healthWellnessModel.refresh();
  }
}
