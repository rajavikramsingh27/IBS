

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;



class NotificationsController extends GetxController {
  // TextEditingController messageController;

  RxString remindMeDay = "Every Day".obs;
  RxString remindMeTime = "Select time".obs;

  RxString pickerType = "".obs;

  RxString general = "".obs;
  RxString improveSleepOne = "".obs;
  RxString improveSleepTwo = "".obs;
  RxString prescriptionOne = "".obs;
  RxString prescriptionTwo= "".obs;
  RxString prescriptionThree= "".obs;
  RxString exercise = "".obs;

  RxBool allRemindersSwitch = false.obs;
  RxBool generalSwitch = false.obs;
  RxBool improveSleepOneSwitch = false.obs;
  RxBool improveSleepTwoSwitch = false.obs;
  RxBool prescriptionOneSwitch = false.obs;
  RxBool prescriptionTwoSwitch= false.obs;
  RxBool prescriptionThreeSwitch= false.obs;
  RxBool exerciseSwitch = false.obs;


  @override
  void onInit() async {
    super.onInit();


  }

  allReminder() {
    // allRemindersSwitch.value = allRemindersSwitch.value;
    // final newValue = allRemindersSwitch.value;

    generalSwitch.value = false;
    improveSleepOneSwitch.value = false;
    improveSleepTwoSwitch.value = false;
    prescriptionOneSwitch.value = false;
    prescriptionTwoSwitch.value = false;
    prescriptionThreeSwitch.value = false;
    exerciseSwitch.value = false;
  }

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  tzTimeForLocalNoti() {
    tz.TZDateTime zonedTime = tz.TZDateTime.local(
        2222,
        12,
        22,
        05,
        49
    );

    return zonedTime;
  }

  Future<void> scheduleNotificationDailyAtTime(
      String title, String body, tz.TZDateTime time,
      ) async {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate = tz.TZDateTime(tz.local, now.year, now.month, now.day, 10);
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }

    await flutterLocalNotificationsPlugin.zonedSchedule(
        0, title, body,
        scheduledDate,
        const NotificationDetails(
          android: AndroidNotificationDetails(
              'daily notification channel id',
              'daily notification channel name',
              'daily notification description'),
        ),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time);
  }

  Future<void> scheduleRemindNotification(
      String title, String body, tz.TZDateTime time,
      ) async {
    // DateTime.now().toIso8601String(),

    await flutterLocalNotificationsPlugin.zonedSchedule(
        0, title, body, time,
         NotificationDetails(
          android: AndroidNotificationDetails(
              'channelID_remindMe',
              'channel_name',
              'Description'
          ),
        ),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
    );
  }

}