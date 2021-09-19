
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_ibs/controllers/trackables/TrackablesController.dart';
import 'package:flutter_ibs/controllers/signup/SignUpController.dart';
import 'package:flutter_ibs/models/HealthWellnessModel/HealthWellnessModel.dart';
import 'package:flutter_ibs/models/HealthWellnessModel/HealthWellnessResponseModel.dart' as HealthRsp;
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:flutter_ibs/models/TreatmentPlanResponseModel.dart';
import 'package:flutter_ibs/services/ServiceApi.dart';
import 'package:flutter_ibs/utils/SnackBar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HealthController extends GetxController {
  RxBool loader = false.obs;

  /*
  Rx<DateTime> now = DateTime.now().obs;
  TextEditingController noteTextController = TextEditingController();
  RxInt formattedTime = 0.obs;
  RxInt currentIndex = 0.obs;
  List<String> timeList = ["01:00","02:00","03:00","04:00","05:00","06:00","07:00","08:00","09:00","10:00","11:00","12:00","13:00","14:00","15:00","16:00","17:00","18:00","19:00","20:00","21:00","22:00","23:00","24:00",];
  RxString selectedTime = "01:00".obs;
  RxBool switchValue = false.obs;
  RxBool tappedRelax = false.obs;
  RxBool bedTimeChanged = false.obs;
  RxBool wakeTimeChanged = false.obs;
  RxBool sleepQualityChanged = false.obs;
  RxBool tirednessChanged = false.obs;
*/

  Rx<HealthWellnessModel> healthWellnessModel = HealthWellnessModel().obs;
  TrackablesController _trackablesController = Get.find();

  RxList<TrackableSubmitItem> _selectedItems = RxList<TrackableSubmitItem>();
  RxList<TrackableItem> formWidgetList = RxList<TrackableItem>();

  /*
  onTapped(int index) async {
    currentIndex.value = index;
  }
*/


  @override
  void onInit() {
    // Get the source of the data:
    _trackablesController
        .healthWellness.value.items.forEach((element) {
          formWidgetList.add(element);
    });

    // Refresh the local list so the form can generate:
    formWidgetList.refresh();
    _selectedItems = RxList<TrackableSubmitItem>();
    super.onInit();
   // formattedTime = int.parse(DateFormat('kk').format(now.value)).obs;
  }

  valueChanged(TrackableSubmitItem submitItem){
    var count = _selectedItems.length;
    bool isAdded = false;
    for(var i=0; i < count; i++) {
      if (_selectedItems[i].tid == submitItem.tid) {
        _selectedItems[i] = submitItem;
        isAdded = true;
        break;
      }
    }

    if (!isAdded){
      _selectedItems.add(submitItem);
    }


/*
    print ('-------');
    _selectedItems.forEach((element) {
      print(element.toJson());
    });

 */
  }



/*
    formWidgetList.forEach((item) {
      if (item.tid == updatedItem.tid){
        item = updatedItem;

      }else{
        item.children.forEach((child) {
          child.items.forEach((childItem) {
            if(childItem.tid == updatedItem.tid){
              childItem = updatedItem;
            }
          });
        });
      }
    });
*/


/*
  _findTrackableItemInList(TrackableItem searchItem, RxList<TrackableItem> list){
    var count = list.length;
    for(var i; i < count; i++){
      if (list[i].tid == searchItem.tid){
        return list[i];
      }
      list[i].children.forEach((child) {
        return _findTrackableItemInList(searchItem, child.items);
      });
    }
  }
*/

  /*
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


   */
}
