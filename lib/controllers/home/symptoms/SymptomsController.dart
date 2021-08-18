import 'package:flutter_ibs/controllers/signup/SignUpController.dart';
import 'package:flutter_ibs/models/Symptoms/SymptomsResponseModel.dart';
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
        /*symptomsResponseModel.data.first.items.forEach((element) {
          _signUpController
              .symptoms
              .value
              .items[0]
              .rating
              .ratingDefault = element.value.numValue;
          _signUpController
              .symptoms
              .refresh();
        });*/
        print("RSData : ${data.data.length}");

      }else{
        print("Data : ${data.data.length}");
      }

    }

  }
}
