import 'package:flutter/cupertino.dart';
import 'package:flutter_ibs/controllers/signup/SignUpController.dart';
import 'package:flutter_ibs/models/Symptoms/SymptomsModel.dart' as sym;
import 'package:flutter_ibs/models/Symptoms/SymptomsResponseModel.dart';
import 'package:flutter_ibs/models/response_model/TrackablesListModel.dart';
import 'package:flutter_ibs/routes/RouteConstants.dart';
import 'package:flutter_ibs/services/ServiceApi.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SymptomsController extends GetxController {
  Rx<DateTime> now = DateTime.now().obs;
  RxDouble sliderValue = 0.0.obs;
  RxInt formattedTime = 0.obs;
  RxInt currentIndex = 0.obs;
  RxInt selectedIndex = 0.obs;
  SignUpController _signUpController = Get.put(SignUpController());
  Rx<SelectOption> optionItemSelected = SelectOption().obs;
  RxList<SelectOption> dropListModel = <SelectOption>[SelectOption(value: "ab",label: "AB"),SelectOption(value: "bc",label: "BC")].obs;
  Rx<sym.SymptomsModel> symptomsModel = sym.SymptomsModel().obs;
  TextEditingController noteTextController = TextEditingController();
  onTapped(int index) async {
    currentIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
    formattedTime = int.parse(DateFormat('kk').format(now.value)).obs;
  }
  getSymptoms()async{
    final data = await ServiceApi().getSymptomsApi();
    if(data == null){
      Get.offAllNamed(signIn);
    }else{
      SymptomsResponseModel symptomsResponseModel = data;
      if(symptomsResponseModel.data.length > 0){
        for( var i = 0 ; i <symptomsResponseModel.data.first.items.length ; i++ ) {
          if(symptomsResponseModel.data.first.items[i].tid != "symptoms-notes"){
            symptomsResponseModel.data.first.items[i].children.first.value.arr.forEach((element) {
              _signUpController
                  .symptoms
                  .value
                  .items[i]
                  .children.first.items.first.list.options.forEach((item) {
                    if(item.value == element){
                      item.optionDefault = true;
                    }
              });
            });
            _signUpController
                .symptoms
                .value
                .items[i]
                .rating
                ?.ratingDefault = symptomsResponseModel.data.first.items[i].value.numValue;

            _signUpController
                .symptoms
                .refresh();
          }

        }

        print("RSData : ${data.data.length}");

      }else{
        print("Data : ${data.data.length}");
      }

    }
  }
  onOptionTapped({ListOption model, List<String> modelValue}){
    model.optionDefault = !model.optionDefault;
    if(model.optionDefault){
      if(!modelValue.contains(model.value)){
        modelValue.add(model.value);
      }
    }else{
      if(modelValue.contains(model.value)){
        modelValue.remove(model.value);
      }
    }
    _signUpController
        .symptoms
        .refresh();
    return modelValue;
  }
  onSave(){
    if (symptomsModel.value.items ==
        null) {
      symptomsModel.value.items = [];
    }
    sym.Item item = sym.Item(tid: _signUpController.symptoms.value.items.last.tid,kind: _signUpController.symptoms.value.items.last.kind,dtype: "str",value: sym.ItemValue(str: noteTextController.text));
    symptomsModel.value.items.add(item);
    symptomsModel.refresh();
    print("DATA Model : ${symptomsModel.toJson()}");
  }
}
