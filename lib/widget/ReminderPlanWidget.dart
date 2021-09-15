import 'package:flutter/material.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/CustomSwitch.dart';

class ReminderPlanWidget extends StatelessWidget {
  final String title;
  final String childText;
  final bool valueReminder;
  final bool valueChild;
  final Function() onPressed;

  final Function(bool) onChanged;
  final Function(bool) onChangedChild;

  final String editText;

  const ReminderPlanWidget({
    Key key,
    this.title = "ABX",
    this.childText = "af",
    this.valueReminder = false,
    this.valueChild = false,
    this.onChanged,
    this.onChangedChild,
    this.editText = "Edit",
    this.onPressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(height: ScreenConstant.defaultHeightTwenty * 1.5),
      Card(
          margin: EdgeInsets.zero,
          color: AppColors.colorBackground,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ScreenConstant.defaultWidthTwenty,
              ),
              child: Column(
                children: [
                  SizedBox(height: ScreenConstant.defaultHeightForty),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(title,
                          style: TextStyles.textStyleIntroDescription
                              .apply(color: Colors.white, fontSizeDelta: -2)),
                      CustomSwitch(
                        value: valueReminder,
                        color: AppColors.colorYesButton,
                        onChanged: onChanged,
                      ),
                    ],
                  ),
                  SizedBox(height: ScreenConstant.defaultHeightTen),
                  Divider(
                      thickness: 1, color: AppColors.white.withOpacity(0.12)),
                  _buildTimeList(),
                  SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
                ],
              )))
    ]);
  }

  _buildTimeList() {
    return ListView.separated(
      itemCount: 2,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return Row(
          children: [
            Icon(
              Icons.access_time_filled,
              color: AppColors.colorIcons,
            ),
            SizedBox(width: ScreenConstant.sizeDefault),
            Text(
              childText,
              style: TextStyles.textStyleRegular.apply(color: Colors.white),
            ),
            TextButton(
                onPressed: onPressed,
                child: Text(
                  editText,
                  style: TextStyles.textStyleRegular.apply(
                      color: AppColors.colorSkipButton, fontSizeDelta: -2),
                )),
            Spacer(),
            CustomSwitch(
              color: AppColors.colorIcons,
              value: valueChild,
              onChanged: onChangedChild,
            ),
          ],
        );
      },
      separatorBuilder: (BuildContext context, int index) =>
          Divider(thickness: 1, color: AppColors.white.withOpacity(0.12)),
    );
  }
}
