import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ibs/utils/Assets.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/CustomElevatedButton.dart';
import 'package:flutter_ibs/widget/ReminderWidget.dart';
import 'package:flutter_ibs/widget/ShowMoreWidget.dart';
import 'package:get/get.dart';

class CustomDialog extends StatelessWidget {
  final double height;
  final String title;
  final String description;

  const CustomDialog({Key key, this.height, this.title, this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildDialog();
  }

  _buildDialog() {
    return Material(
      type: MaterialType.transparency,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: ScreenConstant.defaultHeightTwenty),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16)),
                      ),
                      height: height,
                      margin: EdgeInsets.symmetric(
                          horizontal: ScreenConstant.defaultWidthTwenty),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: ScreenConstant.defaultHeightForty),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: ScreenConstant.defaultWidthTwenty),
                            child: Text("$title",
                                textAlign: TextAlign.start,
                                style: TextStyles.textStyleIntroDescription
                                    .apply(color: Colors.black87)),
                          ),
                          SizedBox(height: ScreenConstant.defaultHeightSixteen),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: ScreenConstant.defaultWidthTwenty),
                            child: Text('''$description''',
                                textAlign: TextAlign.start,
                                style: TextStyles.textStyleRegular.apply(
                                    color: AppColors.colorDialogDescription)),
                          ),
                          SizedBox(height: ScreenConstant.defaultHeightForty),
                        ],
                      ),
                    ),
                    Container(
                      height: ScreenConstant.screenHeightTwelve,
                      margin: EdgeInsets.symmetric(
                          horizontal: ScreenConstant.defaultWidthTwenty),

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(16),
                            bottomRight: Radius.circular(16)),
                        color: AppColors.colorBackground,
                      ),
                      child: Row(
                        children: [
                          Expanded(child: Image.asset(Assets.curl6)),
                          SizedBox(width: ScreenConstant.defaultWidthTwenty),
                          Expanded(child: Image.asset(Assets.curl5))
                        ],
                      ),
                      // padding: ScreenConstant.spacingAllLarge,
                      // margin: ScreenConstant.spacingAllLarge,
                    )
                  ],
                ),
              ),
              Positioned(
                right: 10,
                top: 10,
                child: GestureDetector(
                  onTap: () => Get.back(),
                  child: CircleAvatar(
                    backgroundColor: AppColors.colorCloseLight,
                    radius: 20,
                    child: CircleAvatar(
                        backgroundColor: AppColors.colorCloseLight,
                        radius: 18,
                        child: Icon(
                          Icons.close,
                          color: Colors.white,
                          size: FontSize.s15,
                        )),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomDialog2 extends StatelessWidget {
  final double height;
  final String title;
  final String description;

  const CustomDialog2({Key key, this.height, this.title, this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildDialog();
  }

  _buildDialog() {
    return Material(
      type: MaterialType.transparency,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: ScreenConstant.defaultHeightTwenty),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16)),
                      ),
                      height: height,
                      margin: EdgeInsets.symmetric(
                          horizontal: ScreenConstant.defaultWidthTwenty),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: ScreenConstant.defaultHeightForty),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: ScreenConstant.defaultWidthTwenty),
                            child: RichText(
                              text: TextSpan(
                                text: 'Are you sure you want to stop the  ',
                                style: TextStyles.textStyleIntroDescription
                                    .apply(color: Colors.black),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "STRESS MANAGEMENT",
                                    style: TextStyles.textStyleIntroDescription
                                        .apply(
                                            color: AppColors.colorArrowButton),
                                  ),
                                  TextSpan(
                                    text: " treatment plan?",
                                    style: TextStyles.textStyleIntroDescription
                                        .apply(color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: ScreenConstant.defaultHeightSixteen),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: ScreenConstant.defaultWidthTwenty),
                            child: Text(
                                '''Stoping this plan will move this plan into past treatment plans area.\n\nAny data collected for this plan will be retained.''',
                                textAlign: TextAlign.start,
                                style: TextStyles.textStyleRegular.apply(
                                    color: AppColors.colorDialogDescription)),
                          ),
                          SizedBox(
                              height:
                                  ScreenConstant.defaultHeightTwentyFour * 2.2),
                          Center(
                            child: CustomElevatedButton2(
                              onTap: () {},
                              text: "Yes, Stop this Treatment Plan",
                              widthFactor: 0.9,
                              textColor: Colors.white,
                              buttonColor: AppColors.colorArrowButton,
                            ),
                          ),
                          SizedBox(
                              height: ScreenConstant.defaultHeightTwentyFour),
                          Center(
                              child: TextButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: Text(
                                    "Cancel",
                                    style: TextStyles.textStyleRegular.apply(
                                        color: AppColors.colorBackground,
                                        fontSizeDelta: 3),
                                  ))),
                          SizedBox(height: ScreenConstant.defaultHeightForty),
                        ],
                      ),
                    ),
                    Container(
                      height: ScreenConstant.screenHeightTwelve,
                      margin: EdgeInsets.symmetric(
                          horizontal: ScreenConstant.defaultWidthTwenty),

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(16),
                            bottomRight: Radius.circular(16)),
                        color: AppColors.colorBackground,
                      ),
                      child: Row(
                        children: [
                          Image.asset(Assets.curl6),
                          SizedBox(width: ScreenConstant.defaultWidthTwenty),
                          Image.asset(Assets.curl5)
                        ],
                      ),
                      // padding: ScreenConstant.spacingAllLarge,
                      // margin: ScreenConstant.spacingAllLarge,
                    )
                  ],
                ),
              ),
              Positioned(
                right: 10,
                top: 10,
                child: GestureDetector(
                  onTap: () => Get.back(),
                  child: CircleAvatar(
                    backgroundColor: AppColors.colorCloseLight,
                    radius: 20,
                    child: CircleAvatar(
                        backgroundColor: AppColors.colorCloseLight,
                        radius: 18,
                        child: Icon(
                          Icons.close,
                          color: Colors.white,
                          size: FontSize.s15,
                        )),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomDialog3 extends StatelessWidget {
  final double height;
  final String title;
  final String description;

  const CustomDialog3({Key key, this.height, this.title, this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildDialog();
  }

  _buildDialog() {
    return Material(
      borderRadius: BorderRadius.circular(ScreenConstant.sizeMedium),
      type: MaterialType.transparency,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            height: height,
            margin: EdgeInsets.symmetric(
                horizontal: ScreenConstant.defaultWidthTwenty),
            padding: ScreenConstant.spacingAllLarge,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  Assets.stop,
                  width: ScreenConstant.sizeXXXL,
                ),
                SizedBox(height: ScreenConstant.defaultHeightSixteen),
                Text(
                  title,
                  style: TextStyles.textStyleIntroDescription
                      .apply(color: AppColors.colorDialogTitle),
                ),
                SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
                Text(
                  description,
                  style: TextStyles.textStyleRegular
                      .apply(color: AppColors.colorDialogTitle),
                ),
                SizedBox(height: ScreenConstant.defaultHeightTwenty),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: ScreenConstant.defaultWidthOneForty,
                      child: CustomElevatedButton2(
                        text: "Cancel",
                        buttonColor: AppColors.colorBtnCancel,
                        onTap: () {},
                        textColor: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: ScreenConstant.defaultWidthOneForty,
                      child: CustomElevatedButton2(
                        text: "Stop",
                        buttonColor: AppColors.colorArrowButton,
                        onTap: () {},
                        textColor: Colors.white,
                      ),
                    )
                  ],
                ),
                SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomDialog4 extends StatelessWidget {
  final double height;
  final String title;
  final String description;

  const CustomDialog4({Key key, this.height, this.title, this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildDialog();
  }

  _buildDialog() {
    return Material(
      borderRadius: BorderRadius.circular(ScreenConstant.sizeMedium),
      type: MaterialType.transparency,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              height: height,
              margin: EdgeInsets.symmetric(
                  horizontal: ScreenConstant.defaultWidthTwenty),
              padding: ScreenConstant.spacingAllLarge,
              child: ReminderWidget(
                title: "Edit Notification",
                description:
                    "To edit the notification, modify the options below and click Save.",
                textRemindMe: "Remind me:",
                textTime: "At time:",
                textMessage: "With message:",
              )),
        ],
      ),
    );
  }
}

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

  final String editText;

  const ReminderWidget({
    Key key,
    this.title,
    this.description,
    this.valueReminder,
    this.valueChild,
    this.onChanged,
    this.onChangedChild,
    this.editText,
    this.onPressed,
    this.textRemindMe,
    this.textTime,
    this.textMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: ScreenConstant.defaultHeightForty),
        Text(title,
            style: TextStyles.textStyleIntroDescription
                .apply(color: AppColors.colorDialogTitle, fontSizeDelta: -3)),
        SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
        Text(
          description,
          textAlign: TextAlign.center,
          style: TextStyles.textStyleRegular
              .apply(color: AppColors.colorDialogDescription),
        ),
        SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Text(
                textRemindMe,
                style: TextStyles.textStyleRegular.apply(color: Colors.black),
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
                textTime,
                style: TextStyles.textStyleRegular.apply(color: Colors.black),
              ),
            ),
            Expanded(flex: 2, child: _buildDropDown())
          ],
        ),
        SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            textMessage,
            textAlign: TextAlign.start,
            style: TextStyles.textStyleRegular.apply(color: Colors.black),
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
                hintText: "It’s time to meditate!",
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: ScreenConstant.defaultWidthOneForty,
              child: CustomElevatedButton2(
                text: "Cancel",
                buttonColor: AppColors.colorBtnCancel,
                onTap: () {},
                textColor: Colors.white,
              ),
            ),
            SizedBox(
              width: ScreenConstant.defaultWidthOneForty,
              child: CustomElevatedButton2(
                text: "Save",
                buttonColor: AppColors.colorArrowButton,
                onTap: () {},
                textColor: Colors.white,
              ),
            )
          ],
        ),
        SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
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
          value: "Under 20 years",
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
          items: <String>["Under 20 years", "2", "3", "4", "5", "more"]
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value.toString(),
              child: Text(value.toString(), style: TextStyles.textStyleRegular),
            );
          }).toList()),
    );
  }
}
