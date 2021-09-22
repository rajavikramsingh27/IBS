import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ibs/Store/HiveStore.dart';
import 'package:flutter_ibs/controllers/signup/SignUpController.dart';
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:flutter_ibs/models/track_history/TrackHistoryResponseModel.dart';
import 'package:flutter_ibs/screens/bowel_movement/BowelMovement.dart';
import 'package:flutter_ibs/screens/food/Foods.dart';
import 'package:flutter_ibs/screens/health/Health.dart';
import 'package:flutter_ibs/screens/journal/Journal.dart';
import 'package:flutter_ibs/screens/medication/Medication.dart';
import 'package:flutter_ibs/screens/symptoms/Symptoms.dart';
import 'package:flutter_ibs/services/ServiceApi.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ConnectionCheck.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController {
  Rx<TrackablesListModel> trackFoodList = TrackablesListModel().obs;

  Rx<DateTime> now = DateTime.now().obs;
  RxBool selectedDailyLogin = false.obs;
  RxInt formattedTime = 0.obs;
  RxInt currentIndex = 0.obs;
  RxInt segmentedControlGroupValue = 0.obs;
  DateTime selectedDate;
  TextEditingController dateController = TextEditingController();
  final SignUpController _signUpController = Get.put(SignUpController());
  RxBool loader = false.obs;
  RxBool connectionStatus = false.obs;
  RxInt selectedIndex = 0.obs;
  RxList<TrackHistoryResponseModel> trackHistoryList =
      <TrackHistoryResponseModel>[].obs;
  RxInt selectedDailyLogIndex = 0.obs;
  RxString selectedDailyLogindividualId = "".obs;

  RxString selectedDailyLogCategory = "".obs;

  RxString selectedDateLabel = "".obs;

  var foodValue;
  onTapped(int index) async {
    currentIndex.value = index;
  }

  @override
  void onInit() async {
    super.onInit();
    //for login id
    print("loginId:${HiveStore().get(Keys.LOGINID)}");
    //_signUpController.getTrackList();
    formattedTime = int.parse(DateFormat('kk').format(now.value)).obs;

    selectedDate = new DateTime.now();

    selectedDateLabel.value = DateFormat.yMMMMd('en_US').format(selectedDate);

    connectionStatus.value = true;
    bool isInternet = await ConnectionCheck().initConnectivity();
    connectionStatus.value = isInternet;
  }



  void goForwardOneDay(){
   // selectedDate = new DateTime(selectedDate.year, selectedDate.month, selectedDate.day + 1);
    selectedDate = selectedDate.add(Duration(days: 1));
    if (selectedDate.isAfter(new DateTime.now() )){
      goBackOneDay();
      return;
    }
    selectedDateLabel.value = DateFormat.yMMMMd('en_US').format(selectedDate);
  }

  void goBackOneDay(){
   // selectedDate = new DateTime(selectedDate.year, selectedDate.month, selectedDate.day - 1);
    selectedDate = selectedDate.subtract(Duration(days: 1));
    selectedDateLabel.value = DateFormat.yMMMMd('en_US').format(selectedDate);
  }


  getAndroidDatePicker() {
    return showDatePicker(
      context: Get.context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1970),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.dark(
              primary: Colors.deepPurple,
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: AppColors.colorButton,
            ),
            dialogBackgroundColor: Colors.white,
          ),
          child: child,
        );
      },
      lastDate: DateTime(2100),
    ).then((datePicked) {
      if (datePicked != selectedDate) {
        selectedDate = datePicked;
        selectedDateLabel.value = DateFormat.yMMMMd('en_US').format(selectedDate);
      }
    });
  }

  getCupertinoDatePicker() {
    Get.bottomSheet(
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        height: 300,
        child: CupertinoDatePicker(
          mode: CupertinoDatePickerMode.date,
          onDateTimeChanged: (datePicked) {
            if (datePicked != selectedDate) {
              selectedDate = datePicked;
              print("${dateController.text}");
              selectedDateLabel.value =
                  DateFormat.yMMMMd('en_US').format(selectedDate);
              // ?.toString()
              // ?.split(' ')
              // ?.first;

            }
          },
          initialDateTime: DateTime.now(),
          use24hFormat: true,
          maximumDate: DateTime(2100),
        ),
      ),
      barrierColor: Colors.black26,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    );
  }

  getTrackHistoryList() async {
    if (connectionStatus.value) {
      loader.value = true;
      await ServiceApi().getUserHistoryList().then((value) {
        trackHistoryList.value = value;
      });
      loader.value = false;
    }
  }

  navigateToTrackHistory(TrackHistoryResponseModel model) {
    switch (model.category) {
      case "symptoms":
        {
          return Get.bottomSheet(Symptoms(),
              barrierColor: AppColors.barrierColor.withOpacity(0.60),
              isScrollControlled: true);
        }
        break;
      case "bowelMovements":
        {
          return Get.bottomSheet(BowelMovement(),
              barrierColor: AppColors.barrierColor.withOpacity(0.60),
              isScrollControlled: true);
        }
        break;
      case "medications":
        return Get.bottomSheet(Medication(),
            barrierColor: AppColors.barrierColor.withOpacity(0.60),
            isScrollControlled: true);

        break;
      case "healthWellness":
        return Get.bottomSheet(Health(),
            barrierColor: AppColors.barrierColor.withOpacity(0.60),
            isScrollControlled: true);

        break;
      case "food":
        {
          if (connectionStatus.value) {
            loader.value = true;

            ServiceApi().getFoodHistoryList(id: model.id).then((value) {
              trackFoodList.value = value;
            });
            loader.value = false;
          }

          return Get.bottomSheet(Foods(),
              settings: RouteSettings(arguments: {trackFoodList.value}),
              barrierColor: AppColors.barrierColor.withOpacity(0.60),
              isScrollControlled: true);
          // .then((value) => print("modal:$value"));
        }

        break;
      case "journal":
        return Get.bottomSheet(Journal(),
            barrierColor: AppColors.barrierColor.withOpacity(0.60),
            isScrollControlled: true);

        break;
      default:
        return;
    }
  }
}
