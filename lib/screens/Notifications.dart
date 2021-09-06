

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ibs/controllers/exercise/ExerciseController.dart';
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


class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  final _controller = Get.put(ExerciseController());

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
            SizedBox(height: 30),
            Text("App Notifications",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  // fontWeight: FontWeight.w500,
                  fontFamily: 'Roboto-Regular',
                  color: HexColor('4A358B'),
                )
            ),
            SizedBox(height: 30),
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
        left: 16, right: 16
      ),
      color: AppColors.colorBackground,
      shape:
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: ScreenConstant.defaultWidthTwenty,
          ),
          child: Column(
            children: [
              SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
              Text("Add Notifications",
                  style: TextStyle(
                    fontSize: 18,
                    // fontWeight: FontWeight.w500,
                    fontFamily: 'Roboto-Regular',
                    color: Colors.white
                  )
              ),
              SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
              Text(
                "Would you like to set up a reminder?",
                textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14,
                      // fontWeight: FontWeight.w500,
                      fontFamily: 'Roboto-Regular',
                      color: Colors.white.withOpacity(0.4)
                  )
                ),
              SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      "Remind me:",
                      style: TextStyles.textStyleRegular.apply(color: Colors.white),
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
                      style: TextStyles.textStyleRegular.apply(color: Colors.white),
                    ),
                  ),
                  Expanded(flex: 2, child: _buildDropDown())
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
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                child: TextFormField(
                  inputFormatters: <TextInputFormatter>[],
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: ScreenConstant.sizeMedium,
                          vertical: ScreenConstant.defaultHeightTwenty),
                      hintText: "It's time to...",
                      hintStyle:
                      TextStyles.textStyleRegular.apply(color: Colors.black)),
                  textInputAction: TextInputAction.newline,
                  maxLines: 4,
                  minLines: 4,

                  // maxLength: 100,
                  // decoration: hintedInputDecoration(""),
                ),
              ),
              SizedBox(height: ScreenConstant.defaultHeightTen),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: ScreenConstant.defaultWidthTen * 1.5,
                    backgroundColor: AppColors.colorArrowButton,
                    child: Icon(
                      Icons.add,
                      size: FontSize.s11,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: ScreenConstant.sizeDefault),
                  Text(
                    "Add Notifications",
                    style: TextStyles.textStyleRegular.apply(color: AppColors.white),
                  )
                ],
              ),
              SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
            ],
          )
      ),
    );
  }

  _buildMyNotifications() {
    return Column(
      children: [
        SizedBox(
          height: 40,
        ),
        Center(
          child: Text(
              "My Notifications",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                fontFamily: 'Roboto-Regular',
                color: HexColor('4A358B'),
              )
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: EdgeInsets.only(
              left: 40, right: 40
          ),
          child: Text(
              "The following notifications have been set in this app. "
                  "Some of the notifications may be in relation to your treatment plan. "
                  "Changing your notifications here will change any notifications set for your treatment plan.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: 'Roboto-Regular',
                color: HexColor('4A358B'),
              )
          ),
        ),
        SizedBox(
          height: 36,
        ),
        Card(
          margin: EdgeInsets.only(
              left: 16, right: 16
          ),
          color: AppColors.colorBackground,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ScreenConstant.defaultWidthTwenty,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 35,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "All Reminders",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Roboto-Regular',
                                color: Colors.white,
                              )
                          ),
                          CustomSwitch(
                            value: true,
                            color: AppColors.colorYesButton,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 1,
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "General ",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Roboto-Regular',
                            color: Colors.white,
                          )
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.access_time_sharp,
                                size: 24,
                                color: HexColor('D2C5FC'),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                  "Daily at 4:00 PM",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Roboto-Regular',
                                    color: Colors.white,
                                  )
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                  "Edit",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Roboto-Regular',
                                    color: HexColor('D5C9E1'),
                                  )
                              ),
                            ],
                          ),
                          CustomSwitch(
                            value: true,
                            color: AppColors.colorYesButton,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 1,
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          "Treatment Plan: Improve Sleep ",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Roboto-Regular',
                            color: Colors.white,
                          )
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.access_time_sharp,
                                size: 24,
                                color: HexColor('D2C5FC'),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                  "Daily at 4:00 PM",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Roboto-Regular',
                                    color: Colors.white,
                                  )
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                  "Edit",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Roboto-Regular',
                                    color: HexColor('D5C9E1'),
                                  )
                              ),
                            ],
                          ),
                          CustomSwitch(
                            value: true,
                            color: AppColors.colorYesButton,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 1,
                        color: Colors.white.withOpacity(0.1),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.access_time_sharp,
                                size: 24,
                                color: HexColor('D2C5FC'),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                  "Daily at 4:00 PM",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Roboto-Regular',
                                    color: Colors.white,
                                  )
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                  "Edit",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Roboto-Regular',
                                    color: HexColor('D5C9E1'),
                                  )
                              ),
                            ],
                          ),
                          CustomSwitch(
                            value: true,
                            color: AppColors.colorYesButton,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 1,
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          "Treatment Plan: Prescription Medication",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Roboto-Regular',
                            color: Colors.white,
                          )
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.access_time_sharp,
                                size: 24,
                                color: HexColor('D2C5FC'),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                  "Daily at 4:00 PM",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Roboto-Regular',
                                    color: Colors.white,
                                  )
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                  "Edit",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Roboto-Regular',
                                    color: HexColor('D5C9E1'),
                                  )
                              ),
                            ],
                          ),
                          CustomSwitch(
                            value: true,
                            color: AppColors.colorYesButton,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 1,
                        color: Colors.white.withOpacity(0.1),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.access_time_sharp,
                                size: 24,
                                color: HexColor('D2C5FC'),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                  "Daily at 4:00 PM",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Roboto-Regular',
                                    color: Colors.white,
                                  )
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                  "Edit",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Roboto-Regular',
                                    color: HexColor('D5C9E1'),
                                  )
                              ),
                            ],
                          ),
                          CustomSwitch(
                            value: true,
                            color: AppColors.colorYesButton,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 1,
                        color: Colors.white.withOpacity(0.1),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.access_time_sharp,
                                size: 24,
                                color: HexColor('D2C5FC'),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                  "Daily at 4:00 PM",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Roboto-Regular',
                                    color: Colors.white,
                                  )
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                  "Edit",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Roboto-Regular',
                                    color: HexColor('D5C9E1'),
                                  )
                              ),
                            ],
                          ),
                          CustomSwitch(
                            value: true,
                            color: AppColors.colorYesButton,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 1,
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          "Treatment Plan: Exercise",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Roboto-Regular',
                            color: Colors.white,
                          )
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.access_time_sharp,
                                size: 24,
                                color: HexColor('D2C5FC'),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                  "Daily at 4:00 PM",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Roboto-Regular',
                                    color: Colors.white,
                                  )
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                  "Edit",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Roboto-Regular',
                                    color: HexColor('D5C9E1'),
                                  )
                              ),
                            ],
                          ),
                          CustomSwitch(
                            value: true,
                            color: AppColors.colorYesButton,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              )
          ),
        ),
        SizedBox(
          height: 30,
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
      child: DropdownButton<String>(
          isExpanded: true,
          dropdownColor: AppColors.white,
          value: "Every Day",
          elevation: 30,
          icon: Icon(
            Icons.keyboard_arrow_down_outlined,
            color: AppColors.colordropdownArrow,
          ),
          iconSize: 20,
          underline: SizedBox(),
          onChanged: (String newValue) {
            // setState(() {T
            //   dropdownValue = newValue;
            // });
          },
          items: <String>["Every Day", "Monday", "Tuesday", "Wednesday", "Thursday", "All Day"]
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value.toString(),
              child: Text(value.toString(), style: TextStyles.textStyleRegular),
            );
          }).toList()),
    );
  }
}
