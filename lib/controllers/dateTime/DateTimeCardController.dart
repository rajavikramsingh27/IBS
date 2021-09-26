import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DateTimeCardController extends GetxController{
  DateTime selectedDate; // Date as set in the Home screen
  RxString selectedDateLabel = "".obs;
  RxString selectedTimeLabel = "".obs;


  @override
  void onInit() async {
    super.onInit();
    selectedDate = DateTime.now();
    formatSelectedDate();
  }

  void setDate(DateTime date){
    selectedDate = date;
    formatSelectedDate();
  }

  void formatSelectedDate() {
    selectedDateLabel.value = DateFormat('EEEE, MMM d, y').format(selectedDate.toLocal());
    selectedTimeLabel.value = DateFormat('hh:mm a').format(selectedDate.toLocal());
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
}
