import 'package:flutter/material.dart';
import 'package:flutter_ibs/controllers/home/HomeController.dart';
import 'package:flutter_ibs/utils/Assets.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DateTimeCardWidget extends StatelessWidget {
  HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(38)),
      margin:
          EdgeInsets.symmetric(horizontal: ScreenConstant.defaultWidthSixty),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              Assets.clock,
              width: ScreenConstant.defaultWidthTen * 1.3,
            ),
            Text(_getTime(), style: TextStyles.textStyleRegular),
            CircleAvatar(
              backgroundColor: AppColors.colorTextRegular,
              radius: 1,
            ),
            Text(_getDate(), style: TextStyles.textStyleRegular),
          ],
        ),
      ),
    );
  }

  String _getTime() {
    return DateFormat('hh:mm a').format(DateTime.now()).toString();
  }

  String _getDate() {
    return DateFormat('EEEE, MMMd').format(homeController.selectedDate).toString();
  }
}
