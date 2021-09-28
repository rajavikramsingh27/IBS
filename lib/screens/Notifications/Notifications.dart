import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/utils.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ibs/widget/LeadingBackButton.dart';
import 'package:flutter_ibs/utils/HexColor.dart';
import 'package:flutter_ibs/widget/CustomSwitch.dart';
import 'package:intl/intl.dart';
import 'package:flutter_ibs/controllers/notificationsController/NotificationsController.dart';
import 'dart:async';
import 'dart:ui';
import 'package:timezone/timezone.dart' as tz;

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  final controller = Get.put(NotificationsController());

  tz.TZDateTime scheduledDate;

  TextEditingController messageController = TextEditingController();
  TimeOfDay picked;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorProfileBg,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "NOTIFICATIONS",
          style: TextStyles.appBarTitle,
        ),
        leading: LeadingBackButton(
          onPressed: () => Get.back(),
        ),
      ),
      body: InkWell(
        onTap: () {
          dismissKeyboard(context);
        },
        child: ListView(
          children: [
            SizedBox(height: ScreenConstant.defaultHeightThirty),
            Text("App Notifications",
                textAlign: TextAlign.center,
                style: TextStyles.textStyleSettingQuestionaireBlue),
            SizedBox(height: ScreenConstant.defaultHeightThirty),
            _buildNotification(),
            _buildMyNotifications()
          ],
        ),
      ),
    );
  }

  _buildNotification() {
    return Card(
      margin: EdgeInsets.only(
          left: ScreenConstant.defaultHeightSixteen,
          right: ScreenConstant.defaultHeightSixteen),
      color: AppColors.colorBackground,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: ScreenConstant.defaultWidthTwenty,
          ),
          child: Column(
            children: [
              SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
              Text("Add Notifications",
                  style: TextStyles.textStyleSettingQuestionaireBlack
                      .apply(color: Colors.white)),
              SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
              Text("Would you like to set up a reminder?",
                  textAlign: TextAlign.center,
                  style: TextStyles.textStyleSettingDescription
                      .apply(color: Colors.white.withOpacity(0.4))),
              SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      "Remind me:",
                      style: TextStyles.textStyleRegular
                          .apply(color: Colors.white),
                    ),
                  ),
                  Expanded(flex: 2, child: _buildDropDown())
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      "At time:",
                      style: TextStyles.textStyleRegular
                          .apply(color: Colors.white),
                    ),
                  ),
                  Expanded(flex: 2, child: _buildAtTime())
                ],
              ),
              SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "With message:",
                  textAlign: TextAlign.start,
                  style: TextStyles.textStyleRegular.apply(color: Colors.white),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: TextField(
                  controller: messageController,
                  inputFormatters: <TextInputFormatter>[],
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: ScreenConstant.sizeMedium,
                          vertical: ScreenConstant.defaultHeightTwenty),
                      hintText: "It's time to...",
                      hintStyle: TextStyles.textStyleRegular
                          .apply(color: Colors.black)),
                  textInputAction: TextInputAction.newline,
                  maxLines: 4,
                  minLines: 4,
                  // maxLength: 100,
                  // decoration: hintedInputDecoration(""),
                ),
              ),
              SizedBox(height: ScreenConstant.defaultHeightTen),
              InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: ScreenConstant.defaultWidthTen * 1.5,
                      backgroundColor: AppColors.colorArrowButton,
                      child: Icon(
                        Icons.add,
                        size: FontSize.s20,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: ScreenConstant.sizeDefault),
                    Text(
                      "Add Notifications",
                      style: TextStyles.textStyleRegular
                          .apply(color: AppColors.white),
                    )
                  ],
                ),
                onTap: () {
                  FocusScope.of(context).unfocus();

                  if (controller.remindMeTime.value == "Select time") {
                    return;
                  }

                  if (controller.remindMeDay.value == "Every Day") {
                    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);

                    print(picked.hour);
                    print(picked.minute);

                    scheduledDate = tz.TZDateTime(tz.local, now.year, now.month,
                        now.day, picked.hour, picked.minute);

                    if (scheduledDate.isBefore(now)) {
                      scheduledDate =
                          scheduledDate.add(const Duration(days: 1));
                    }
                  } else {
                    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
                    scheduledDate = tz.TZDateTime(
                        tz.local, now.year, now.month, now.day, 10);

                    int daysForNoti = 0;

                    if (controller.remindMeDay.value == "Sunday") {
                      daysForNoti = 0;
                    } else if (controller.remindMeDay.value == "Monday") {
                      daysForNoti = 1;
                    } else if (controller.remindMeDay.value == "Tuesday") {
                      daysForNoti = 2;
                    } else if (controller.remindMeDay.value == "Wednesday") {
                      daysForNoti = 3;
                    } else if (controller.remindMeDay.value == "Thursday") {
                      daysForNoti = 4;
                    } else if (controller.remindMeDay.value == "Friday") {
                      daysForNoti = 5;
                    } else if (controller.remindMeDay.value == "Saturday") {
                      daysForNoti = 6;
                    }

                    if (scheduledDate.isBefore(now)) {
                      scheduledDate =
                          scheduledDate.add(Duration(days: daysForNoti));
                    }
                  }

                  final scheduleTime =
                      tz.TZDateTime.now(tz.local); //.add(Duration(minutes: 1));
                  controller.scheduleRemindNotification(
                      'title', messageController.text, scheduleTime);
                },
              ),
              SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
            ],
          )),
    );
  }

  _buildMyNotifications() {
    return Column(
      children: [
        SizedBox(
          height: ScreenConstant.defaultHeightForty,
        ),
        Center(
          child:
              Text("My Notifications", style: TextStyles.textStyleSettingTitle),
        ),
        SizedBox(
          height: ScreenConstant.defaultHeightTen,
        ),
        Padding(
          padding: EdgeInsets.only(
              left: ScreenConstant.defaultHeightForty,
              right: ScreenConstant.defaultHeightForty),
          child: Text(
              "The following notifications have been set in this app. "
              "Some of the notifications may be in relation to your treatment plan. "
              "Changing your notifications here will change any notifications set for your treatment plan.",
              textAlign: TextAlign.center,
              style: TextStyles.textStyleSettingDescription),
        ),
        SizedBox(
          height: ScreenConstant.sizeExtraLarge,
        ),
        Card(
          margin: EdgeInsets.only(
              left: ScreenConstant.defaultHeightSixteen,
              right: ScreenConstant.defaultHeightSixteen),
          color: AppColors.colorBackground,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ScreenConstant.defaultWidthTwenty,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: ScreenConstant.defaultHeightThirty,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("All Reminders",
                              style: TextStyles
                                  .textStyleSettingQuestionaireBlack
                                  .apply(color: AppColors.white)),
                          CustomSwitch(
                            value: controller.allRemindersSwitch.value,
                            color: AppColors.colorYesButton,
                            onChanged: (isValue) {
                              controller.allReminder();
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: ScreenConstant.defaultHeightTwenty,
                      ),
                      Container(
                        height: 1,
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ScreenConstant.sizeExtraLarge,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("General ",
                          style: TextStyles.textStyleSettingNotificationsTitle),
                      SizedBox(
                        height: ScreenConstant.sizeExtraLarge,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.access_time_sharp,
                                size: ScreenConstant.defaultHeightTwentyFour,
                                color: HexColor('D2C5FC'),
                              ),
                              SizedBox(
                                width: ScreenConstant.defaultHeightTen,
                              ),
                              Text("Daily at " + controller.general.value,
                                  style: TextStyles
                                      .textStyleSettingNotificationsSubTitle),
                              SizedBox(
                                width: ScreenConstant.defaultHeightTen,
                              ),
                              InkWell(
                                child: Text("Edit",
                                    style: TextStyles
                                        .textStyleSettingNotificationsSubTitle
                                        .apply(color: HexColor('#D5C9E1'))),
                                onTap: () {
                                  controller.pickerType.value = '1';
                                  selectTime(context);
                                },
                              )
                            ],
                          ),
                          CustomSwitch(
                            value: controller.generalSwitch.value,
                            color: AppColors.colorYesButton,
                            onChanged: (value) {
                              controller.generalSwitch.value =
                                  !controller.generalSwitch.value;

                              if (controller.general.value.isNotEmpty)
                                controller.scheduleNotificationDailyAtTime(
                                    'General',
                                    "General Reminder",
                                    scheduledDate);
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: ScreenConstant.sizeExtraLarge,
                      ),
                      Container(
                        height: 1,
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ScreenConstant.sizeExtraLarge,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Treatment Plan: Improve Sleep ",
                          style: TextStyles.textStyleSettingNotificationsTitle),
                      SizedBox(
                        height: ScreenConstant.sizeExtraLarge,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.access_time_sharp,
                                size: ScreenConstant.defaultHeightTwentyFour,
                                color: HexColor('D2C5FC'),
                              ),
                              SizedBox(
                                width: ScreenConstant.defaultHeightTen,
                              ),
                              Text(
                                  "Daily at " +
                                      controller.improveSleepOne.value,
                                  style: TextStyles
                                      .textStyleSettingNotificationsSubTitle
                                      .apply()),
                              SizedBox(
                                width: ScreenConstant.defaultHeightTen,
                              ),
                              InkWell(
                                child: Text("Edit",
                                    style: TextStyles
                                        .textStyleSettingNotificationsSubTitle
                                        .apply(color: HexColor('#D5C9E1'))),
                                onTap: () {
                                  controller.pickerType.value = '2';
                                  selectTime(context);
                                },
                              )
                            ],
                          ),
                          CustomSwitch(
                            value: controller.improveSleepOneSwitch.value,
                            color: AppColors.colorYesButton,
                            onChanged: (value) {
                              controller.improveSleepOneSwitch.value =
                                  !controller.improveSleepOneSwitch.value;

                              if (controller.improveSleepOne.value.isNotEmpty)
                                controller.scheduleNotificationDailyAtTime(
                                    'Treat Plan',
                                    "Treat Plan: Improve Sleep",
                                    scheduledDate);
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: ScreenConstant.sizeExtraLarge,
                      ),
                      Container(
                        height: 1,
                        color: Colors.white.withOpacity(0.1),
                      ),
                      SizedBox(
                        height: ScreenConstant.sizeExtraLarge,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.access_time_sharp,
                                size: ScreenConstant.defaultHeightTwentyFour,
                                color: HexColor('D2C5FC'),
                              ),
                              SizedBox(
                                width: ScreenConstant.defaultHeightTen,
                              ),
                              Text(
                                  "Daily at " +
                                      controller.improveSleepTwo.value,
                                  style: TextStyles
                                      .textStyleSettingNotificationsSubTitle
                                      .apply()),
                              SizedBox(
                                width: ScreenConstant.defaultHeightTen,
                              ),
                              InkWell(
                                child: Text("Edit",
                                    style: TextStyles
                                        .textStyleSettingNotificationsSubTitle
                                        .apply(color: HexColor('#D5C9E1'))),
                                onTap: () {
                                  controller.pickerType.value = '3';
                                  selectTime(context);
                                },
                              )
                            ],
                          ),
                          CustomSwitch(
                            value: controller.improveSleepTwoSwitch.value,
                            color: AppColors.colorYesButton,
                            onChanged: (value) {
                              controller.improveSleepTwoSwitch.value =
                                  !controller.improveSleepTwoSwitch.value;

                              if (controller.improveSleepTwo.value.isNotEmpty)
                                controller.scheduleNotificationDailyAtTime(
                                    'Treat Plan',
                                    "Treat Plan: Improve Sleep",
                                    scheduledDate);
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: ScreenConstant.sizeExtraLarge,
                      ),
                      Container(
                        height: 1,
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ScreenConstant.sizeExtraLarge,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Treatment Plan: Prescription Medication",
                          style: TextStyles.textStyleSettingNotificationsTitle),
                      SizedBox(
                        height: ScreenConstant.sizeExtraLarge,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.access_time_sharp,
                                size: ScreenConstant.defaultHeightTwentyFour,
                                color: HexColor('D2C5FC'),
                              ),
                              SizedBox(
                                width: ScreenConstant.defaultHeightTen,
                              ),
                              Text(
                                  "Daily at " +
                                      controller.prescriptionOne.value,
                                  style: TextStyles
                                      .textStyleSettingNotificationsSubTitle
                                      .apply()),
                              SizedBox(
                                width: ScreenConstant.defaultHeightTen,
                              ),
                              InkWell(
                                child: Text("Edit",
                                    style: TextStyles
                                        .textStyleSettingNotificationsSubTitle
                                        .apply(color: HexColor('#D5C9E1'))),
                                onTap: () {
                                  controller.pickerType.value = '4';
                                  selectTime(context);
                                },
                              )
                            ],
                          ),
                          CustomSwitch(
                            value: controller.prescriptionOneSwitch.value,
                            color: AppColors.colorYesButton,
                            onChanged: (value) {
                              controller.prescriptionOneSwitch.value =
                                  !controller.prescriptionOneSwitch.value;

                              if (controller.prescriptionOne.value.isNotEmpty)
                                controller.scheduleNotificationDailyAtTime(
                                    'Treat Plan',
                                    "Treat Plan: Prescription Medication",
                                    scheduledDate);
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: ScreenConstant.sizeExtraLarge,
                      ),
                      Container(
                        height: 1,
                        color: Colors.white.withOpacity(0.1),
                      ),
                      SizedBox(
                        height: ScreenConstant.sizeExtraLarge,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.access_time_sharp,
                                size: ScreenConstant.defaultHeightTwentyFour,
                                color: HexColor('D2C5FC'),
                              ),
                              SizedBox(
                                width: ScreenConstant.defaultHeightTen,
                              ),
                              Text(
                                  "Daily at " +
                                      controller.prescriptionTwo.value,
                                  style: TextStyles
                                      .textStyleSettingNotificationsSubTitle
                                      .apply()),
                              SizedBox(
                                width: ScreenConstant.defaultHeightTen,
                              ),
                              InkWell(
                                child: Text("Edit",
                                    style: TextStyles
                                        .textStyleSettingNotificationsSubTitle
                                        .apply(color: HexColor('#D5C9E1'))),
                                onTap: () {
                                  controller.pickerType.value = '5';
                                  selectTime(context);
                                },
                              )
                            ],
                          ),
                          CustomSwitch(
                            value: controller.prescriptionTwoSwitch.value,
                            color: AppColors.colorYesButton,
                            onChanged: (value) {
                              controller.prescriptionTwoSwitch.value =
                                  !controller.prescriptionTwoSwitch.value;

                              if (controller.prescriptionTwo.value.isNotEmpty)
                                controller.scheduleNotificationDailyAtTime(
                                    'Treat Plan',
                                    "Treat Plan: Prescription Medication",
                                    scheduledDate);
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: ScreenConstant.sizeExtraLarge,
                      ),
                      Container(
                        height: 1,
                        color: Colors.white.withOpacity(0.1),
                      ),
                      SizedBox(
                        height: ScreenConstant.sizeExtraLarge,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.access_time_sharp,
                                size: ScreenConstant.defaultHeightTwentyFour,
                                color: HexColor('D2C5FC'),
                              ),
                              SizedBox(
                                width: ScreenConstant.defaultHeightTen,
                              ),
                              Text(
                                  "Daily at " +
                                      controller.prescriptionThree.value,
                                  style: TextStyles
                                      .textStyleSettingNotificationsSubTitle
                                      .apply()),
                              SizedBox(
                                width: ScreenConstant.defaultHeightTen,
                              ),
                              InkWell(
                                child: Text("Edit",
                                    style: TextStyles
                                        .textStyleSettingNotificationsSubTitle
                                        .apply(color: HexColor('#D5C9E1'))),
                                onTap: () {
                                  controller.pickerType.value = '6';
                                  selectTime(context);
                                },
                              )
                            ],
                          ),
                          CustomSwitch(
                            value: controller.prescriptionThreeSwitch.value,
                            color: AppColors.colorYesButton,
                            onChanged: (value) {
                              controller.prescriptionThreeSwitch.value =
                                  !controller.prescriptionThreeSwitch.value;
                              if (controller.prescriptionThree.value.isNotEmpty)
                                controller.scheduleNotificationDailyAtTime(
                                    'Treat Plan',
                                    "Treat Plan: Prescription Medication",
                                    scheduledDate);
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: ScreenConstant.sizeExtraLarge,
                      ),
                      Container(
                        height: 1,
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ScreenConstant.sizeExtraLarge,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Treatment Plan: Exercise",
                          style: TextStyles.textStyleSettingNotificationsTitle),
                      SizedBox(
                        height: ScreenConstant.sizeExtraLarge,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.access_time_sharp,
                                size: ScreenConstant.defaultHeightTwentyFour,
                                color: HexColor('D2C5FC'),
                              ),
                              SizedBox(
                                width: ScreenConstant.defaultHeightTen,
                              ),
                              Text("Daily at " + controller.exercise.value,
                                  style: TextStyles
                                      .textStyleSettingNotificationsSubTitle
                                      .apply()),
                              SizedBox(
                                width: ScreenConstant.defaultHeightTen,
                              ),
                              InkWell(
                                child: Text("Edit",
                                    style: TextStyles
                                        .textStyleSettingNotificationsSubTitle
                                        .apply(color: HexColor('#D5C9E1'))),
                                onTap: () {
                                  controller.pickerType.value = '7';
                                  selectTime(context);
                                },
                              )
                            ],
                          ),
                          CustomSwitch(
                            value: controller.exerciseSwitch.value,
                            color: AppColors.colorYesButton,
                            onChanged: (value) {
                              controller.exerciseSwitch.value =
                                  !controller.exerciseSwitch.value;
                              if (controller.exercise.value.isNotEmpty)
                                controller.scheduleNotificationDailyAtTime(
                                    'Treat Plan',
                                    "Treat Plan: Exercise",
                                    scheduledDate);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ScreenConstant.sizeExtraLarge,
                  ),
                ],
              )),
        ),
        SizedBox(
          height: ScreenConstant.sizeExtraLarge,
        ),
      ],
    );
  }

  _buildDropDown() {
    return Container(
      height: ScreenConstant.defaultHeightForty * 1.2,
      width: double.maxFinite,
      margin: EdgeInsets.only(
          left: ScreenConstant.defaultWidthTen * 1.5,
          right: ScreenConstant.defaultWidthTen * 1.5,
          bottom: ScreenConstant.defaultHeightTen * 1.5),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      decoration: BoxDecoration(
          color: AppColors.colordropdownArrowBg,
          borderRadius: BorderRadius.all(Radius.circular(8))),
      // dropdown below..
      child: Obx(() => DropdownButton<String>(
          isExpanded: true,
          dropdownColor: AppColors.white,
          value: controller.remindMeDay.value,
          elevation: 30,
          icon: Icon(
            Icons.keyboard_arrow_down_outlined,
            color: AppColors.colordropdownArrow,
          ),
          iconSize: ScreenConstant.defaultHeightTwenty,
          underline: SizedBox(),
          onChanged: (String newValue) {
            controller.remindMeDay.value = newValue;
          },
          items: <String>[
            "Every Day",
            "Sunday",
            "Monday",
            "Tuesday",
            "Wednesday",
            "Thursday",
            "Friday",
            "Saturday"
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value.toString(),
              child: Text(value.toString(), style: TextStyles.textStyleRegular),
            );
          }).toList())),
    );
  }

  _buildAtTime() {
    return Container(
        width: double.maxFinite,
        height: ScreenConstant.defaultHeightForty * 1.2,
        margin: EdgeInsets.only(
            left: ScreenConstant.defaultWidthTen * 1.5,
            right: ScreenConstant.defaultWidthTen * 1.5,
            bottom: ScreenConstant.defaultHeightTen * 1.5),
        // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        decoration: BoxDecoration(
            color: AppColors.colordropdownArrowBg,
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Obx(() => ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.transparent, elevation: 0),
              onPressed: () {
                controller.pickerType.value = '0';
                selectTime(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    controller.remindMeTime.value,
                    style: TextStyles.textStyleSettingNotificationsSubTitle
                        .apply(color: Colors.black),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: AppColors.colordropdownArrow,
                  ),
                ],
              ),
            )));
  }

  Future<void> selectTime(BuildContext context) async {
    picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      String selTime =
          picked.hour.toString() + ':' + picked.minute.toString() + ':00';
      final selectedTime =
          DateFormat.jm().format(DateFormat("hh:mm:ss").parse(selTime));

      final tz.TZDateTime now = tz.TZDateTime.now(tz.local);

      print(picked.hour);
      print(picked.minute);

      scheduledDate = tz.TZDateTime(
          tz.local, now.year, now.month, now.day, picked.hour, picked.minute);

      if (scheduledDate.isBefore(now)) {
        scheduledDate = scheduledDate.add(const Duration(days: 1));
      }

      if (controller.pickerType.value == '0') {
        controller.remindMeTime.value = selectedTime;
      } else if (controller.pickerType.value == '1') {
        controller.general.value = selectedTime;

        if (controller.generalSwitch.value)
          controller.scheduleNotificationDailyAtTime(
              'General', "General Reminder", scheduledDate);
      } else if (controller.pickerType.value == '2') {
        controller.improveSleepOne.value = selectedTime;
        if (controller.improveSleepOneSwitch.value)
          controller.scheduleNotificationDailyAtTime(
              'Treat Plan', "Treat Plan: Improve Sleep", scheduledDate);
      } else if (controller.pickerType.value == '3') {
        controller.improveSleepTwo.value = selectedTime;
        if (controller.improveSleepTwoSwitch.value)
          controller.scheduleNotificationDailyAtTime(
              'Treat Plan', "Treat Plan: Improve Sleep", scheduledDate);
      } else if (controller.pickerType.value == '4') {
        controller.prescriptionOne.value = selectedTime;
        if (controller.prescriptionOneSwitch.value)
          controller.scheduleNotificationDailyAtTime('Treat Plan',
              "Treat Plan: Prescription Medication", scheduledDate);
      } else if (controller.pickerType.value == '5') {
        controller.prescriptionTwo.value = selectedTime;
        if (controller.prescriptionTwoSwitch.value)
          controller.scheduleNotificationDailyAtTime('Treat Plan',
              "Treat Plan: Prescription Medication", scheduledDate);
      } else if (controller.pickerType.value == '6') {
        controller.prescriptionThree.value = selectedTime;
        if (controller.prescriptionThreeSwitch.value)
          controller.scheduleNotificationDailyAtTime('Treat Plan',
              "Treat Plan: Prescription Medication", scheduledDate);
      } else if (controller.pickerType.value == '7') {
        controller.exercise.value = selectedTime;
        if (controller.exerciseSwitch.value)
          controller.scheduleNotificationDailyAtTime(
              'Treat Plan', "Treat Plan: Exercise", scheduledDate);
      }
    }
  }
}
