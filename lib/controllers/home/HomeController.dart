import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ibs/Store/HiveStore.dart';
import 'package:flutter_ibs/controllers/bowel_movement/BowelMovementController.dart';
import 'package:flutter_ibs/controllers/dateTime/DateTimeCardController.dart';
import 'package:flutter_ibs/controllers/food/FoodController.dart';
import 'package:flutter_ibs/controllers/health/HealthController.dart';
import 'package:flutter_ibs/controllers/journal/JournalController.dart';
import 'package:flutter_ibs/controllers/medication/MedicationController.dart';
import 'package:flutter_ibs/controllers/signup/SignUpController.dart';
import 'package:flutter_ibs/controllers/symptoms/SymptomsController.dart';
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

  RxInt formattedTime = 0.obs;
  RxInt currentIndex = 0.obs;
  RxInt segmentedControlGroupValue = 0.obs;

  TextEditingController dateController = TextEditingController();
  final SignUpController _signUpController = Get.put(SignUpController());
  RxBool loader = false.obs;
  RxBool connectionStatus = false.obs;
  RxInt selectedIndex = 0.obs;
  RxList<TrackHistoryResponseModel> trackHistoryList =
      <TrackHistoryResponseModel>[].obs;

  TrackHistoryResponseModel selectedPageData;



  DateTime selectedDate; // Date as set in the Home screen
  RxString selectedDateLabel = "".obs;
  RxString selectedTimeLabel = "".obs;

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

    formatSelectedDate();

    connectionStatus.value = true;
    bool isInternet = await ConnectionCheck().initConnectivity();
    connectionStatus.value = isInternet;

    /// Setup trackable controllers:
    Get.lazyPut(() => SymptomsController());
    Get.lazyPut(() => BowelMovementController());
    Get.lazyPut(() => MedicationController());
    Get.lazyPut(() => HealthController());
    Get.lazyPut(() => FoodController());
    Get.lazyPut(() => JournalController());
    Get.lazyPut(() => DateTimeCardController() );
  }

  void goForwardOneDay() {
    // selectedDate = new DateTime(selectedDate.year, selectedDate.month, selectedDate.day + 1);
    selectedDate = selectedDate.add(Duration(days: 1));
    if (selectedDate.isAfter(new DateTime.now())) {
      goBackOneDay();
      return;
    }
    formatSelectedDate();
  }

  void goBackOneDay() {
    // selectedDate = new DateTime(selectedDate.year, selectedDate.month, selectedDate.day - 1);
    selectedDate = selectedDate.subtract(Duration(days: 1));
    formatSelectedDate();
  }

  void formatSelectedDate() {
    selectedDateLabel.value = DateFormat('EEEE, MMM d, y').format(selectedDate);
    selectedTimeLabel.value = DateFormat('hh:mm a').format(selectedDate);
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
      if (datePicked != null && datePicked != selectedDate) {
        selectedDate = datePicked;
        formatSelectedDate();
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
            if (datePicked != null && datePicked != selectedDate) {
              selectedDate = datePicked;
              formatSelectedDate();
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

  getCupertinoTimePicker(BuildContext context) async {
    final TimeOfDay timeOfDay = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(this.selectedDate),
      initialEntryMode: TimePickerEntryMode.input,
    );
    if (timeOfDay != null &&
        timeOfDay != TimeOfDay.fromDateTime(this.selectedDate)) {
      this.selectedDate = DateTime(
          this.selectedDate.year,
          this.selectedDate.month,
          this.selectedDate.day,
          timeOfDay.hour,
          timeOfDay.minute);
      this.formatSelectedDate();
    }
  }

  getAndroidTimePicker(BuildContext context) async {
    final TimeOfDay timeOfDay = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(this.selectedDate),
      initialEntryMode: TimePickerEntryMode.input,
    );
    if (timeOfDay != null &&
        timeOfDay != TimeOfDay.fromDateTime(this.selectedDate)) {
      this.selectedDate = DateTime(
          this.selectedDate.year,
          this.selectedDate.month,
          this.selectedDate.day,
          timeOfDay.hour,
          timeOfDay.minute);
      this.formatSelectedDate();
    }
  }

  getTrackHistoryList() async {
    if (connectionStatus.value) {
      loader.value = true;
      await ServiceApi().getUserHistoryList(selectedDate).then((value) {
        value != null ? trackHistoryList.value = value : print("getUserHistoryList was null");
        loader.value = false;
      });

    }
  }

  navigateToTrackHistory(TrackHistoryResponseModel pageData) {
    selectedPageData = pageData;

    switch (pageData.category) {
      case "symptoms":
        {
          SymptomsController controller = Get.find();
          controller.setup(pageData: pageData);

          return Get.bottomSheet(Symptoms(),
              barrierColor: AppColors.barrierColor.withOpacity(0.60),
              isScrollControlled: true);
        }
        break;
      case "bowelMovements":
        {
          BowelMovementController controller = Get.find();
          controller.setup(pageData: pageData);

          return Get.bottomSheet(BowelMovement(),
              barrierColor: AppColors.barrierColor.withOpacity(0.60),
              isScrollControlled: true);
        }
        break;
      case "medications":
        MedicationController controller = Get.find();
        controller.setup(pageData: pageData);

        return Get.bottomSheet(Medication(),
            barrierColor: AppColors.barrierColor.withOpacity(0.60),
            isScrollControlled: true);

        break;
      case "healthWellness":
        HealthController controller = Get.find();
        controller.setup(pageData: pageData);

        return Get.bottomSheet(Health(),
            barrierColor: AppColors.barrierColor.withOpacity(0.60),
            isScrollControlled: true);

        break;
      case "foods":
        {
          FoodController controller = Get.find();
          controller.setup(pageData: pageData);

          return Get.bottomSheet(Foods(),
              settings: RouteSettings(arguments: {trackFoodList.value}),
              barrierColor: AppColors.barrierColor.withOpacity(0.60),
              isScrollControlled: true);
          // .then((value) => print("modal:$value"));
        }

        break;
      case "journal":
        JournalController controller = Get.find();
        controller.setup(pageData: pageData);

        return Get.bottomSheet(Journal(),
            barrierColor: AppColors.barrierColor.withOpacity(0.60),
            isScrollControlled: true);

        break;
      default:
        return;
    }
  }
}
