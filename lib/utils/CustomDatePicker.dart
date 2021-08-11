import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CustomDatePicker extends StatelessWidget {
  final DateTime selectedDate;
  final TextEditingController dateController;

  const CustomDatePicker(this.selectedDate, this.dateController);

  @override
  Widget build(BuildContext context) {
    return Obx(() => datePicker());
  }

  Widget datePicker() {
    return Platform.isIOS
        ? getCupertinoDatePicker(selectedDate, dateController)
        : getAndroidDatePicker(selectedDate, dateController);
  }

  getAndroidDatePicker(
      DateTime selectedDate, TextEditingController textController) {
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
        textController.text = DateFormat.yMMMMd('en_US').format(selectedDate);
      }
    });
  }

  getCupertinoDatePicker(
      DateTime selectedDate, TextEditingController textController) {
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
              print("${textController.text}");
              textController.text =
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

    // showCupertinoModalPopup(
    //   builder: (BuildContext context) {
    //     return
    //   },
    //   context: Get.context,
    // );
  }
}
