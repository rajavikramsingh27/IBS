import 'dart:core';

import 'package:intl/intl.dart';

class CustomDateTime {
  String parse({String dateTime, String returnFormat}) {
    DateTime dt = DateTime.parse(dateTime);
    DateFormat dateFormat = DateFormat(returnFormat);
    String returnDT = dateFormat.format(dt);
    return returnDT;
  }

  String parseDateToString(DateTime time) {
    return DateFormat('yyyy-MM-dd').format(time);
  }

  String parseTime({String dateTime, String returnFormat}) {
    DateFormat dtFor = DateFormat("HH:mm:ss");
    DateTime dt = dtFor.parse(dateTime);
    DateFormat dateFormat = DateFormat(returnFormat);
    String returnDT = dateFormat.format(dt);
    return returnDT;
  }

  DateTime convertDateFromString(String strDate) {
    DateTime todayDate = DateTime.parse(strDate);
    return todayDate;
  }

  String getTimeFromTimeStamp(timeInMillis) {
    //int timeInMillis = 1586348737122;
    print(timeInMillis);
    var date = DateTime.fromMillisecondsSinceEpoch(timeInMillis);
    String formattedDate = CustomDateTime()
        .parse(dateTime: date.toString(), returnFormat: "hh:mm a");
    return formattedDate;
  }

  String getDateFromTimeStamp(timeInMillis) {
    //int timeInMillis = 1586348737122;
    var date = DateTime.fromMillisecondsSinceEpoch(timeInMillis);
    String formattedDate = DateFormat.yMMMd().format(date);
    return formattedDate;
  }
}
