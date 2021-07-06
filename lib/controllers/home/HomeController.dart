import 'package:get/get.dart';

class HomeController extends GetxController {
  RxBool selectedDailyLogin = false.obs;

  RxInt currentIndex = 0.obs;

  onTapped(int index) async {
    currentIndex.value = index;
  }
}
