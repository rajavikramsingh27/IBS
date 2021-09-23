import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_ibs/controllers/home/HomeController.dart';
import 'package:flutter_ibs/utils/Assets.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:get/get.dart';

class DateTimeCardWidget extends StatelessWidget {
  final HomeController _homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(38)),
          margin: EdgeInsets.symmetric(
              horizontal: 40),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  Assets.clock,
                  width: ScreenConstant.defaultWidthTen * 1.3,
                ),
                TextButton(
                    onPressed: () {
                      if (Platform.isIOS)
                        _homeController.getCupertinoTimePicker(context);
                      else
                        _homeController.getAndroidTimePicker(context);
                    },
                    child: Text(_homeController.selectedTimeLabel.value,
                        style: TextStyles.textStyleRegular)),
                CircleAvatar(
                  backgroundColor: AppColors.colorTextRegular,
                  radius: 1,
                ),
                TextButton(
                  onPressed: () {
                    if (Platform.isIOS)
                      _homeController.getCupertinoDatePicker();
                    else
                      _homeController.getAndroidDatePicker();
                  },
                  child: Text(_homeController.selectedDateLabel.value,
                      style: TextStyles.textStyleRegular),
                ),
              ],
            ),
          ),
        ));
  }
}
