import 'package:get/get.dart';

class MyProfileController extends GetxController {
  RxInt pagecount = 0.obs;
  RxInt pagecount2 = 0.obs;

  RxBool isDiagnoisedIbs = true.obs;
  RxBool checkBoxValue = false.obs;

  RxInt selctedIbsType = 0.obs;
  RxBool isDiagnoisedAbdominalPain = false.obs;
  RxBool isabdominalPainTimeBowel = false.obs;
  RxBool isabdominalPainBowelMoreLess = false.obs;
  RxBool isabdominalPainBowelAppearDifferent = false.obs;
  RxInt selectedStoolType = 0.obs;

  selectIbsType(int index) {
    switch (index) {
      case 0:
        return "c";
        break;
      case 1:
        return "d";
        break;
      case 2:
        return "m";
        break;
      case 3:
        return "u";
        break;
      default:
        return "idk";
    }
  }

  selectStoolType(int index) {
    switch (index) {
      case 0:
        return 'constipated';
        break;
      case 1:
        return 'diarrhea';
        break;
      case 2:
        return 'normal';
        break;
      case 3:
        return 'both';
        break;
      default:
        return "null";
    }
  }
}
