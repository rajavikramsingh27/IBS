import 'package:flutter/material.dart';
import 'package:flutter_ibs/models/TreatmentPlanResponseModel.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/DynamicWidget.dart';
import 'package:flutter_ibs/widget/ShowMoreWidget.dart';
import 'package:get/get.dart';

class ReminderWidget extends StatelessWidget {
  final String title;
  final String description;
  final String textRemindMe;
  final String textTime;
  final String textMessage;

  final bool valueReminder;
  final bool valueChild;
  final Function() onPressed;

  final Function(bool) onChanged;
  final Function(bool) onChangedChild;
  final GetxController controller;
  final String editText;
  final List<Trackable> data;
  const ReminderWidget({
    Key key,
    this.title = "",
    this.description = "",
    this.valueReminder = false,
    this.valueChild = false,
    this.onChanged,
    this.onChangedChild,
    this.editText = "",
    this.onPressed,
    this.textRemindMe = "",
    this.textTime = "",
    this.textMessage = "",
    this.data,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: ScreenConstant.defaultHeightForty),
        Text(title,
            textAlign: TextAlign.center,
            style: TextStyles.textStyleIntroDescription
                .apply(color: Colors.white, fontSizeDelta: -3)),
        SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
        Text(
          description,
          textAlign: TextAlign.center,
          style: TextStyles.textStyleRegular
              .apply(color: AppColors.colorSkipButton),
        ),
        SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
        DynamicWidget(
          data: data,
          controller: controller,
        ),
        SizedBox(height: ScreenConstant.defaultHeightTen),
        ShowMoreWidget(text: "Add Reminder",)
      ],
    );
  }
}
