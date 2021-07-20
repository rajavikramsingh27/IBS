import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController {
  Rx<DateTime> now = DateTime.now().obs;
  RxBool selectedDailyLogin = false.obs;
  RxInt formattedTime = 0.obs;
  RxInt currentIndex = 0.obs;

  RxInt selectedIndex = 0.obs;

  onTapped(int index) async {
    currentIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
    formattedTime = int.parse(DateFormat('kk').format(now.value)).obs;
  }
}
