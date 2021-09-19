import 'package:flutter/cupertino.dart';
import 'package:flutter_ibs/controllers/trackables/TrackablesController.dart';
import 'package:flutter_ibs/controllers/signup/SignUpController.dart';
import 'package:flutter_ibs/models/Symptoms/SymptomsModel.dart' ;
import 'package:flutter_ibs/models/Symptoms/SymptomsResponseModel.dart';
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:flutter_ibs/routes/RouteConstants.dart';
import 'package:flutter_ibs/services/ServiceApi.dart';
import 'package:flutter_ibs/utils/SnackBar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SymptomsController extends GetxController {
  /*
  Rx<DateTime> now = DateTime.now().obs;
  RxDouble sliderValue = 0.0.obs;
  RxInt formattedTime = 0.obs;
  RxInt currentIndex = 0.obs;
  RxInt selectedIndex = 0.obs;

  SignUpController _signUpController = Get.find();
  Rx<SelectOption> optionItemSelected = SelectOption().obs;
  RxList<SelectOption> dropListModel = <SelectOption>[
    SelectOption(value: "ab", label: "AB"),
    SelectOption(value: "bc", label: "BC")
  ].obs;
  Rx<sym.SymptomsModel> symptomsModel = sym.SymptomsModel().obs;
  TextEditingController noteTextController = TextEditingController();
  onTapped(int index) async {
    currentIndex.value = index;
  }
*/
  RxBool loader = false.obs;

  Rx<SymptomsModel> symptomsModel = SymptomsModel().obs;
  TrackablesController _trackablesController = Get.find();

  RxList<TrackableSubmitItem> _selectedItems = RxList<TrackableSubmitItem>();
  RxList<TrackableItem> formWidgetList = RxList<TrackableItem>();

  @override
  void onInit() {
    // Get the source of the data:
    _trackablesController
        .symptoms.value.items.forEach((element) {
      formWidgetList.add(element);
    });

    // Refresh the local list so the form can generate:
    formWidgetList.refresh();
    _selectedItems = RxList<TrackableSubmitItem>();
    super.onInit();
    // formattedTime = int.parse(DateFormat('kk').format(now.value)).obs;
  }

  /*
  @override
  void onInit() {
    super.onInit();
    checkData();
    formattedTime = int.parse(DateFormat('kk').format(now.value)).obs;
  }

  getSymptoms() async {
    final data = await ServiceApi().getSymptomsApi();
    if (data == null) {
      Get.offAllNamed(signIn);
    } else {
      SymptomsResponseModel symptomsResponseModel = data;
      if (symptomsResponseModel.data.length > 0) {
        for (var i = 0;
            i < symptomsResponseModel.data.first.items.length;
            i++) {
          if (symptomsResponseModel.data.first.items[i].tid !=
              "symptoms-notes") {
            symptomsResponseModel.data.first.items[i].children.first.value.arr
                .forEach((element) {
              _signUpController.symptoms.value.items[i].children.first.items
                  .first.list.options
                  .forEach((item) {
                if (item.value == element) {
                  item.optionDefault = true;
                }
              });
            });
            _signUpController.symptoms.value.items[i].rating?.ratingDefault =
                symptomsResponseModel.data.first.items[i].value.numValue;

            _signUpController.symptoms.refresh();
          }
        }

        print("RSData : ${data.data.length}");
      } else {
        print("Data : ${data.data.length}");
      }
    }
  }

  onOptionTapped({ListOption model, List<String> modelValue}) {
    model.optionDefault = !model.optionDefault;
    if (model.optionDefault) {
      if (!modelValue.contains(model.value)) {
        modelValue.add(model.value);
      }
    } else {
      if (modelValue.contains(model.value)) {
        modelValue.remove(model.value);
      }
    }
    _signUpController.symptoms.refresh();
    return modelValue;
  }


   */

  onSave() async {
    /*
    if (symptomsModel.value.items == null) {
      symptomsModel.value.items = [];
    }
    sym.Item item = sym.Item(
        tid: _signUpController.symptoms.value.items.last.tid,
        kind: _signUpController.symptoms.value.items.last.kind,
        dtype: "str",
        value: sym.ItemValue(str: noteTextController.text),
        category: _signUpController.symptoms.value.items.last.category,
    );
    symptomsModel.value.items.add(item);
    symptomsModel.refresh();
    print("DATA Model : ${symptomsModel.toJson()}");
    loader.value = true;
    final data =
        await ServiceApi().postSymptomsAPI(bodyData: symptomsModel.toJson());
    loader.value = false;
    if (data is SymptomsResponseModel) {
      noteTextController.clear();
      symptomsModel.value.items = [];
      _signUpController.getTrackList();
      Get.back();
      CustomSnackBar().successSnackBar(
          title: "Success", message: "Symptoms Added Successfully");
    } else {
      CustomSnackBar().errorSnackBar(title: "Error", message: data.message);
    }

     */
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


  void checkData() {
    if (_trackablesController.symptoms.value == null) {
      loader.value = true;
    } else {
      loader.value = false;
    }
  }
}
