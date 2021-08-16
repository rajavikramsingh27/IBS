import 'package:flutter_ibs/Store/HiveStore.dart';
import 'package:flutter_ibs/services/ServiceApi.dart';
import 'package:flutter_ibs/utils/SnackBar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SymptomsController extends GetxController {
  Rx<DateTime> now = DateTime.now().obs;
  RxDouble sliderValue = 1.0.obs;
  RxInt formattedTime = 0.obs;
  RxInt currentIndex = 0.obs;

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
    var loginId = await HiveStore().get("LOGINID");
    final data = await ServiceApi().getSymptomsApi(bodyData: {"loginid": loginId});
    print("Data: $data");
  }
}
