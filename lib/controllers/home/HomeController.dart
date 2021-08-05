import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController {
  Rx<DateTime> now = DateTime.now().obs;
  RxBool selectedDailyLogin = false.obs;
  RxInt formattedTime = 0.obs;
  RxInt currentIndex = 0.obs;
  RxInt segmentedControlGroupValue = 0.obs;
  DateTime? selectedDate;
  TextEditingController dateController = TextEditingController();

  RxInt selectedIndex = 0.obs;

  onTapped(int index) async {
    currentIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
    formattedTime = int.parse(DateFormat('kk').format(now.value)).obs;
  }

  getAndroidDatePicker() {
    return showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now() ?? selectedDate!,
      firstDate: DateTime(1970),
      builder: (BuildContext context, Widget? child) {
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
          child: child!,
        );
      },
      lastDate: DateTime(2100),
    ).then((datePicked) {
      if (datePicked != selectedDate) {
        selectedDate = datePicked;
        dateController.text = DateFormat.yMMMMd('en_US').format(selectedDate!);
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
              dateController.text =
                  DateFormat.yMMMMd('en_US').format(selectedDate!);
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
}
