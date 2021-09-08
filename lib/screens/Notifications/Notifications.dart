

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


class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {

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
                style: TextStyles.textStyleSettingQuestionaireBlue
            ),
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
        left: ScreenConstant.defaultHeightSixteen, right: ScreenConstant.defaultHeightSixteen
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
                  style: TextStyles.textStyleSettingQuestionaireBlack.apply(
                    color: Colors.white
                  )
              ),
              SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
              Text(
                "Would you like to set up a reminder?",
                textAlign: TextAlign.center,
                  style: TextStyles.textStyleSettingDescription.apply(
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
                      size: FontSize.s20,
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
          height: ScreenConstant.defaultHeightForty,
        ),
        Center(
          child: Text(
              "My Notifications",
              style: TextStyles.textStyleSettingTitle
          ),
        ),
        SizedBox(
          height: ScreenConstant.defaultHeightTen,
        ),
        Padding(
          padding: EdgeInsets.only(
              left: ScreenConstant.defaultHeightForty, right: ScreenConstant.defaultHeightForty
          ),
          child: Text(
              "The following notifications have been set in this app. "
                  "Some of the notifications may be in relation to your treatment plan. "
                  "Changing your notifications here will change any notifications set for your treatment plan.",
              textAlign: TextAlign.center,
              style: TextStyles.textStyleSettingDescription
          ),
        ),
        SizedBox(
          height: ScreenConstant.sizeExtraLarge,
        ),
        Card(
          margin: EdgeInsets.only(
              left: ScreenConstant.defaultHeightSixteen, right: ScreenConstant.defaultHeightSixteen
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
                    height: ScreenConstant.defaultHeightThirty,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "All Reminders",
                              style: TextStyles.textStyleSettingQuestionaireBlack.apply(
                                color: AppColors.white
                              )
                          ),
                          CustomSwitch(
                            value: true,
                            color: AppColors.colorYesButton,
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
                      Text(
                        "General ",
                          style: TextStyles.textStyleSettingNotificationsTitle
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
                                  "Daily at 4:00 PM",
                                  style: TextStyles.textStyleSettingNotificationsSubTitle
                              ),
                              SizedBox(
                                width: ScreenConstant.defaultHeightTen,
                              ),
                              Text(
                                  "Edit",
                                  style: TextStyles.textStyleSettingNotificationsSubTitle.apply(
                                    color: HexColor('#D5C9E1')
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
                      Text(
                          "Treatment Plan: Improve Sleep ",
                          style: TextStyles.textStyleSettingNotificationsTitle
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
                                  "Daily at 4:00 PM",
                                  style: TextStyles.textStyleSettingNotificationsSubTitle.apply(

                                  )
                              ),
                              SizedBox(
                                width: ScreenConstant.defaultHeightTen,
                              ),
                              Text(
                                  "Edit",
                                  style: TextStyles.textStyleSettingNotificationsSubTitle.apply(
                                      color: HexColor('#D5C9E1')
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
                                  "Daily at 4:00 PM",
                                  style: TextStyles.textStyleSettingNotificationsSubTitle.apply(

                                  )
                              ),
                              SizedBox(
                                width: ScreenConstant.defaultHeightTen,
                              ),
                              Text(
                                  "Edit",
                                  style: TextStyles.textStyleSettingNotificationsSubTitle.apply(
                                      color: HexColor('#D5C9E1')
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
                      Text(
                          "Treatment Plan: Prescription Medication",
                          style: TextStyles.textStyleSettingNotificationsTitle
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
                                  "Daily at 4:00 PM",
                                  style: TextStyles.textStyleSettingNotificationsSubTitle.apply(

                                  )
                              ),
                              SizedBox(
                                width: ScreenConstant.defaultHeightTen,
                              ),
                              Text(
                                  "Edit",
                                  style: TextStyles.textStyleSettingNotificationsSubTitle.apply(
                                      color: HexColor('#D5C9E1')
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
                                  "Daily at 4:00 PM",
                                  style: TextStyles.textStyleSettingNotificationsSubTitle.apply(

                                  )
                              ),
                              SizedBox(
                                width: ScreenConstant.defaultHeightTen,
                              ),
                              Text(
                                  "Edit",
                                  style: TextStyles.textStyleSettingNotificationsSubTitle.apply(
                                      color: HexColor('#D5C9E1')
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
                                  "Daily at 4:00 PM",
                                  style: TextStyles.textStyleSettingNotificationsSubTitle.apply(

                                  )
                              ),
                              SizedBox(
                                width: ScreenConstant.defaultHeightTen,
                              ),
                              Text(
                                  "Edit",
                                  style: TextStyles.textStyleSettingNotificationsSubTitle.apply(
                                      color: HexColor('#D5C9E1')
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
                      Text(
                          "Treatment Plan: Exercise",
                          style: TextStyles.textStyleSettingNotificationsTitle
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
                                  "Daily at 4:00 PM",
                                  style: TextStyles.textStyleSettingNotificationsSubTitle.apply(

                                  )
                              ),
                              SizedBox(
                                width: ScreenConstant.defaultHeightTen,
                              ),
                              Text(
                                  "Edit",
                                  style: TextStyles.textStyleSettingNotificationsSubTitle.apply(
                                      color: HexColor('#D5C9E1')
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
                    height: ScreenConstant.sizeExtraLarge,
                  ),
                ],
              )
          ),
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
      child: DropdownButton<String>(
          isExpanded: true,
          dropdownColor: AppColors.white,
          value: "Every Day",
          elevation: 30,
          icon: Icon(
            Icons.keyboard_arrow_down_outlined,
            color: AppColors.colordropdownArrow,
          ),
          iconSize: ScreenConstant.defaultHeightTwenty,
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
