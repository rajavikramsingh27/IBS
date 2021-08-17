import 'package:flutter_ibs/controllers/signup/SignUpController.dart';
import 'package:flutter_ibs/routes/RouteConstants.dart';
import 'package:flutter_ibs/services/ServiceApi.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SymptomsController extends GetxController {
  Rx<DateTime> now = DateTime.now().obs;
  RxDouble sliderValue = 1.0.obs;
  RxInt formattedTime = 0.obs;
  RxInt currentIndex = 0.obs;
  SignUpController _signUpController = Get.put(SignUpController());
  RxInt selectedIndex = 0.obs;

  onTapped(int index) async {
    currentIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
    getSymptoms();
    formattedTime = int.parse(DateFormat('kk').format(now.value)).obs;
  }
  getSymptoms()async{
    final data = await ServiceApi().getSymptomsApi();
    if(data == null){
      Get.offAllNamed(signIn);
    }
    print("Data: $data");
  }
}
