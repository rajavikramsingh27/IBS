import 'package:flutter/material.dart';
import 'package:flutter_ibs/controllers/treatment_plan/TreatmentPlanController.dart';
import 'package:flutter_ibs/models/TreatmentPlanModel/TreatmentPlanResponseModel.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/CustomSwitch.dart';
import 'package:get/get.dart';

import 'CustomDialog.dart';

class ReminderPlanWidget extends StatelessWidget {
  final String title;
  final String childText;
  final bool valueReminder;
  final bool valueChild;
  final Function() onPressed;
  final List<dynamic> listData;
  final List<Trackable> listOption;
  final Function(bool) onChanged;
  final Function(bool) onChangedChild;

  final String editText;

  ReminderPlanWidget({
    Key key,
    this.title = "Reminders set for this plan",
    this.childText = "af",
    this.valueReminder = false,
    this.valueChild = false,
    this.onChanged,
    this.onChangedChild,
    this.editText = "Edit",
    this.onPressed,
    this.listData,
    this.listOption,
  }) : super(key: key);
  final TreatmentPlanController _treatmentPlanController =
      Get.put(TreatmentPlanController());
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
                  Obx(
                    () => ListView.separated(
                      itemCount: listData.length,
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        var model = listData[index];

                        return Row(
                          children: [
                            Icon(
                              Icons.access_time_filled,
                              color: AppColors.colorIcons,
                            ),
                            SizedBox(width: ScreenConstant.sizeDefault),
                            Obx(
                              () => Text(
                                "${listData[index].day} at ${listData[index].time}",
                                style: TextStyles.textStyleRegular
                                    .apply(color: Colors.white),
                              ),
                            ),
                            TextButton(
                                onPressed: () {
                                  Get.dialog(CustomDialog4(
                                          data: model, listOption: listOption))
                                      .then((value) {
                                    model.day = value.day;
                                    model.time = value.time;
                                    model.message = value.message;
                                  });
                                },
                                child: Text(
                                  editText,
                                  style: TextStyles.textStyleRegular.apply(
                                      color: AppColors.colorSkipButton,
                                      fontSizeDelta: -2),
                                )),
                            Spacer(),
                            CustomSwitch(
                              color: AppColors.colorYesButton,
                              value: !listData[index].enabled,
                              onChanged: onChangedChild,
                            ),
                          ],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          Divider(
                              thickness: 1,
                              color: AppColors.white.withOpacity(0.12)),
                    ),
                  ),
                  SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
                ],
              )))
    ]);
  }
}
