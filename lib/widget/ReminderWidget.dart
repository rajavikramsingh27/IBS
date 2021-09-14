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
    this.textMessage = "", this.data, this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: ScreenConstant.defaultHeightForty),
        Text(title,textAlign: TextAlign.center,
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
        DynamicWidget(data: data,controller: controller,),
        /*Row(
          children: [
            Expanded(
              flex: 1,
              child: Text(
                textRemindMe,
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
                textTime,
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
            textMessage,
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
        ),*/
        SizedBox(height: ScreenConstant.defaultHeightTen),
        ShowMoreWidget()
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
