import 'package:flutter/material.dart';
import 'package:flutter_ibs/controllers/trackables/TrackablesController.dart';
import 'package:flutter_ibs/models/BowelMovementsModel/BowelMovementsModel.dart';
import 'package:flutter_ibs/models/BowelMovementsModel/BowelMovementsResponseModel.dart';
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:flutter_ibs/services/ServiceApi.dart';
import 'package:flutter_ibs/utils/SnackBar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BowelMovementController extends GetxController {
  Rx<DateTime> now = DateTime.now().obs;
  RxDouble sliderValue = 1.0.obs;
  RxInt formattedTime = 0.obs;
  RxInt currentIndex = 0.obs;
  TextEditingController noteTextController = TextEditingController();

  RxBool loader = false.obs;

  RxBool switchValue = true.obs;
  Rx<BowelMovementsModel> bowelMovementsModel =
      BowelMovementsModel(items: []).obs;

  TrackablesController _trackablesController = Get.find();

  RxList<TrackableItem> formWidgetList = RxList<TrackableItem>();

  onTapped(int index) async {
    currentIndex.value = index;
  }

  @override
  void onInit() {
    formattedTime = int.parse(DateFormat('kk').format(now.value)).obs;

    _trackablesController.bowelMovements.value.items.forEach((element) {
      formWidgetList.add(element);
    });

    // Refresh the local list so the form can generate:
    formWidgetList.refresh();

    super.onInit();
    // formattedTime = int.parse(DateFormat('kk').format(now.value)).obs;
  }

  valueChanged(TrackableSubmitItem submitItem) {
    var count = bowelMovementsModel.value.items.length;
    bool isAdded = false;
    for (var i = 0; i < count; i++) {
      if (bowelMovementsModel.value.items[i].tid == submitItem.tid) {
        bowelMovementsModel.value.items[i] = submitItem;
        isAdded = true;
        break;
      }
    }

    if (!isAdded) {
      bowelMovementsModel.value.items.add(submitItem);
    }
  }

  void onSave() async {
    loader.value = true;
    final data = await ServiceApi()
        .postBowelMovementAPI(bodyData: bowelMovementsModel.toJson());
    loader.value = false;
    if (data is BowelMovementsResponseModel) {
      // noteTextController.clear();
      //  healthWellnessModel.value.items = [];
      //  _signUpController.getTrackList();
      Get.back();
      CustomSnackBar().successSnackBar(
          title: "Success", message: "Bowel Movement Added Successfully");
    } else {
      CustomSnackBar().errorSnackBar(title: "Error", message: data.message);
    }
  }
}
/*
    print ('-------');
    _selectedItems.forEach((element) {
      print(element.toJson());
    });

 */

/*

  onSave() async {
    if (bowelMovementsModel.value.items == null) {
      bowelMovementsModel.value.items = [];
    }
    Item item = Item(
        tid: _trackablesController.bowelMovements.value.items.last.tid,
        kind: _trackablesController.bowelMovements.value.items.last.kind,
        dtype: "str",
        value: ItemValue(str: noteTextController.text));
    bowelMovementsModel.value.items.add(item);
    bowelMovementsModel.refresh();
    print("DATA Model : ${bowelMovementsModel.toJson()}");
    loader.value = true;
    final data =
    await ServiceApi().postBowelMovementAPI(bodyData: bowelMovementsModel.toJson());
    loader.value = false;
    if (data is BMR.BowelMovementsResponseModel) {
      noteTextController.clear();
      bowelMovementsModel.value.items = [];
      //_signUpController.getTrackList();
      Get.back();
      CustomSnackBar().successSnackBar(
          title: "Success", message: "Bowel Movements Added Successfully");
    } else {
      noteTextController.clear();
     // _signUpController.getTrackList();
      bowelMovementsModel.value = BowelMovementsModel();
      CustomSnackBar().errorSnackBar(title: "Error", message: data.message);
    }
  }
  initModel({TrackableItem data,String dType, value,}){
    bool isPresent = false;

    if (bowelMovementsModel.value.items == null) {
      bowelMovementsModel.value.items = [];
    }
    bowelMovementsModel.value.items.forEach((element) {
      if(element.tid == data.tid){
        isPresent = true;
        if(value is String){
          element.value = ItemValue(string: value.toString());
        }else{
          element.value = ItemValue(itemNum: value,);
        }
      }
    });
    if(!isPresent){
      Item item;
      if(value is String){
        item = Item(
          tid: data.tid,
          kind: data.kind,
          dtype: dType,
          value: ItemValue(string: value),
        );
      }else{
        item = Item(
          tid: data.tid,
          kind: data.kind,
          dtype: dType,
          value: ItemValue(itemNum: value),
        );
      }

      bowelMovementsModel.value.items.add(item);
    }
  }

  initSubModel({TrackableItem data,String dType,bool value,String tid,String kind,mainType}){
    Item item;
    bool isPresent = false;

    if (bowelMovementsModel.value.items == null) {
      bowelMovementsModel.value.items = [];
    }
    bowelMovementsModel.value.items.forEach((element) {
      if(element.tid == "bowelMovements-relief"){
        isPresent = true;
        element.value = ItemValue();
        element.children?.clear();
        element.children = [(Child(value: ChildValue(valueBool: value),tid: data.tid,dtype: dType,kind: data.kind,))];
      }
    });
    if(!isPresent) {
      item = Item(
        tid: tid,
        kind: kind,
        dtype: mainType,
        value: ItemValue(),
        children: [Child(value: ChildValue(valueBool: value),tid: data.tid,dtype: dType,kind: data.kind,)]
      );
      bowelMovementsModel.value.items.add(item);
    }

    }
  }
*/
