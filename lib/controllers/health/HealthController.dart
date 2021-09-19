import 'package:flutter_ibs/controllers/trackables/TrackablesController.dart';
import 'package:flutter_ibs/models/HealthWellnessModel/HealthWellnessModel.dart';
import 'package:flutter_ibs/models/HealthWellnessModel/HealthWellnessResponseModel.dart';
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:flutter_ibs/services/ServiceApi.dart';
import 'package:flutter_ibs/utils/SnackBar.dart';
import 'package:get/get.dart';


class HealthController extends GetxController {
  RxBool loader = false.obs;

  Rx<HealthWellnessModel> healthWellnessModel = HealthWellnessModel(items: []).obs;
  TrackablesController _trackablesController = Get.find();

  RxList<TrackableSubmitItem> _selectedItems = RxList<TrackableSubmitItem>();
  RxList<TrackableItem> formWidgetList = RxList<TrackableItem>();



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
    var count = healthWellnessModel.value.items.length;
    bool isAdded = false;
    for(var i=0; i < count; i++) {
      if (healthWellnessModel.value.items[i].tid == submitItem.tid) {
        healthWellnessModel.value.items[i] = submitItem;
        isAdded = true;
        break;
      }
    }

    if (!isAdded){
      healthWellnessModel.value.items.add(submitItem);
    }

  }

  void onSave()async{

    _selectedItems.forEach((item) {
      item.toJson();
    });

    loader.value = true;
    final data = await ServiceApi().postHealthWellnessAPI(bodyData: healthWellnessModel.toJson());
    loader.value = false;
    if (data is HealthWellnessResponseModel) {
     // noteTextController.clear();
    //  healthWellnessModel.value.items = [];
    //  _signUpController.getTrackList();
      Get.back();
      CustomSnackBar().successSnackBar(
          title: "Success", message: "Health & Wellness Added Successfully");
    } else {
      CustomSnackBar().errorSnackBar(title: "Error", message: data.message);
    }

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
