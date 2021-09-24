import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ibs/controllers/exercise/ExerciseController.dart';
import 'package:flutter_ibs/utils/Assets.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/CustomArcPainter.dart';
import 'package:flutter_ibs/widget/CustomDialog.dart';
import 'package:flutter_ibs/widget/CustomElevatedButton.dart';
import 'package:flutter_ibs/widget/CustomSwitch.dart';
import 'package:flutter_ibs/widget/DateTimeCardWidget.dart';
import 'package:flutter_ibs/widget/utils.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class SleepTreatmentPlan extends StatelessWidget {
  final _controller = Get.put(ExerciseController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(height: ScreenConstant.defaultHeightTen),
            CustomElevatedButton(
              widthFactor: 0.7,
              text: "Save Changes",
              onTap: () {},
            ),
            TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text("Cancel",
                    style: TextStyles.textStyleIntroDescription.apply(
                      color: AppColors.colorskip_also_proceed,
                    )))
          ],
        ),
      ),
      backgroundColor: Color(0xff1A103E).withOpacity(0.6),
      body: InkWell(
        onTap: () {
          dismissKeyboard(context);
        },
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: [
            Padding(
              padding:
                  EdgeInsets.only(top: ScreenConstant.defaultHeightOneThirty),
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: ScreenConstant.defaultHeightTwenty),
                    child: Card(
                      margin: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      )),
                      child: Column(
                        children: [
                          SizedBox(height: ScreenConstant.defaultHeightSixty),
                          Text(
                            "Treatment Plan: Improve Sleep",
                            style: TextStyles.textStyleIntroDescription
                                .apply(color: Colors.black, fontSizeDelta: -2),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: ScreenConstant.defaultHeightForty),
                          DateTimeCardWidget(),
                          SizedBox(height: ScreenConstant.sizeDefault),
                          CustomElevatedButton2(
                            elevation: 16,
                            widthFactor: 0.7,
                            onTap: () {
                              Get.dialog(CustomDialog2());
                            },
                            textColor: AppColors.colorTextStop,
                            text: "Stop Plan",
                            buttonColor: AppColors.white,
                          ),
                          SizedBox(
                              height: ScreenConstant.defaultHeightTwentyFour),
                          Stack(
                            children: [
                              Positioned.fill(
                                top: ScreenConstant.defaultHeightOneHundred,
                                child: _buildSleepImprovementBg(),
                              ),
                              Container(
                                  margin: EdgeInsets.symmetric(
                                    horizontal:
                                        ScreenConstant.defaultWidthTwenty,
                                  ),
                                  child: Column(
                                    children: [
                                      _buildSleepImprovement(),
                                      _buildPlanDetails(),
                                    ],
                                  )),
                            ],
                          ),
                          SizedBox(height: ScreenConstant.defaultHeightTwenty),
                        ],
                      ),
                    ),
                  ),
                  Positioned(right: 0, left: 0, child: CustomArcPainter())
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildSleepImprovement() {
    return Stack(
      alignment: Alignment.center,
      children: [
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
                Text("Sleep Improvement",
                    style: TextStyles.textStyleIntroDescription
                        .apply(color: Colors.white, fontSizeDelta: -2)),
                SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
                Text(
                  "Track your sleep patterns to help understand how fatigue may be negatively impacting your IBS symptoms",
                  textAlign: TextAlign.center,
                  style: TextStyles.textStyleRegular
                      .apply(color: Colors.white.withOpacity(0.39)),
                ),
                SizedBox(height: ScreenConstant.defaultHeightForty),
                _buildSleepActivities(),
                SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
                Divider(thickness: 1, color: AppColors.white.withOpacity(0.12)),
                SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
                Text("Tiredness Upon Waking",
                    style: TextStyles.textStyleIntroDescription
                        .apply(color: Colors.white, fontSizeDelta: -3)),
                SizedBox(height: ScreenConstant.defaultHeightTen),
                Text(
                  "I woke up groggy and feeling moderately tired",
                  textAlign: TextAlign.center,
                  style: TextStyles.textStyleRegular
                      .apply(color: AppColors.colorSkipButton),
                ),
                SizedBox(height: ScreenConstant.defaultHeightTen),
                _buildSleepImprovementIntensitySlider(),
                SizedBox(height: ScreenConstant.defaultHeightTwenty),
                Divider(thickness: 1, color: AppColors.white.withOpacity(0.12)),
                _buildNotification(),
                SizedBox(height: ScreenConstant.defaultHeightForty * 1.4),
              ],
            ),
          ),
        ),
        // Positioned(
        //     bottom: -50,
        //     child: CustomArcPainter2(
        //         height: 100,
        //         width: 100,
        //         quarterTurns: 0,
        //         painter:
        //             MyPainter(AppColors.colorSymptomsGridBg.withOpacity(0.5)))),
        // Positioned(
        //     bottom: -100,
        //     child: CustomArcPainter2(
        //         height: 200,
        //         width: 200,
        //         quarterTurns: 0,
        //         painter: MyPainter(
        //             AppColors.colorSymptomsGridBg.withOpacity(0.20)))),
      ],
    );
  }

  _buildSleepActivities() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Text(
                "Normal Bedtime:",
                style: TextStyles.textStyleRegular.apply(color: Colors.white),
              ),
            ),
            Expanded(flex: 1, child: _buildDropDown())
          ],
        ),
        SizedBox(height: ScreenConstant.sizeDefault),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Text(
                "Time you awaken:",
                style: TextStyles.textStyleRegular.apply(color: Colors.white),
              ),
            ),
            Expanded(flex: 1, child: _buildDropDown())
          ],
        ),
        SizedBox(height: ScreenConstant.sizeDefault),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Text(
                "Sleep interruptions:",
                style: TextStyles.textStyleRegular.apply(color: Colors.white),
              ),
            ),
            Expanded(flex: 1, child: _buildDropDown())
          ],
        ),
      ],
    );
  }

  _buildSleepImprovementBg() {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.colorProfileBg,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(24),
              bottomRight: Radius.circular(24))),
      margin: EdgeInsets.only(top: ScreenConstant.defaultHeightTwenty * 1.5),
      width: Get.context.mediaQuerySize.width,
      child: Image.asset(
        Assets.lowFoodbg,
        filterQuality: FilterQuality.high,
        fit: BoxFit.fill,
      ),
    );
  }

  _buildNotification() {
    return Column(
      children: [
        SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
        Text("Notifications",
            style: TextStyles.textStyleIntroDescription
                .apply(color: Colors.white, fontSizeDelta: -3)),
        SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
        Text(
          "Would you like to set up app notifications to remind you?",
          textAlign: TextAlign.center,
          style: TextStyles.textStyleRegular
              .apply(color: Colors.white.withOpacity(0.39)),
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
      ],
    );
  }

  _buildSleepImprovementIntensitySlider() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: ScreenConstant.defaultWidthTen),
      child: SfSliderTheme(
        data: SfSliderThemeData(
          thumbColor: AppColors.colorArrowButton,
          thumbStrokeWidth: 5,
          thumbRadius: 16,
          thumbStrokeColor: Colors.white,
          activeTrackHeight: 4,
          overlayRadius: 0,
          disabledActiveTrackColor: AppColors.colorTrackSlider,
          disabledInactiveTrackColor: AppColors.colorTrackSlider,
          activeDividerStrokeWidth: 2,
          inactiveDividerStrokeWidth: 2,
          inactiveTrackHeight: 4,
          activeTrackColor: AppColors.colorTrackSlider,
          inactiveTrackColor: AppColors.colorTrackSlider,
          inactiveDividerStrokeColor: AppColors.white,
          inactiveDividerRadius: 8,
          inactiveDividerColor: AppColors.colorInactiveDividerSlider,
          activeDividerColor: AppColors.colorInactiveDividerSlider,
          activeDividerStrokeColor: Colors.white,
          activeDividerRadius: 8,
          activeLabelStyle: TextStyles.textStyleRegular
              .apply(color: AppColors.colorTrackSlider),
          inactiveLabelStyle: TextStyles.textStyleRegular
              .apply(color: AppColors.colorTrackSlider),
        ),
        child: Obx(
          () => SfSlider(
            showDividers: true,
            min: 1.0,
            max: 4.0,
            interval: 1,
            stepSize: 1,
            showLabels: true,
            value: _controller.sliderValue.value,
            onChanged: (dynamic newValue) {
              print("cahnged");
              _controller.sliderValue.value = newValue;
            },
            labelFormatterCallback:
                (dynamic actualValue, String formattedText) {
              return actualValue == 1
                  ? "Well-Rested"
                  : actualValue == 2
                      ? ""
                      : actualValue == 3
                          ? ""
                          : "Exhaustion";
            },
          ),
        ),
      ),
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

  _buildPlanDetails() {
    return Column(children: [
      SizedBox(height: ScreenConstant.defaultHeightForty * 1.3),
      Text("My Plan Details",
          style: TextStyles.textStyleIntroDescription
              .apply(color: Colors.black, fontSizeDelta: -2)),
      SizedBox(height: ScreenConstant.defaultHeightForty * 1.2),
      Card(
          margin: EdgeInsets.zero,
          color: AppColors.colorBackground,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ScreenConstant.defaultWidthTwenty,
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.symmetric(
                          vertical: ScreenConstant.sizeDefault),
                      height: ScreenConstant.defaultHeightNinety,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      alignment: Alignment.center,
                      child: Image.asset(
                        Assets.sleepemoji,
                        width: ScreenConstant.sizeExtraLarge,
                      ),
                    ),
                  ),
                  SizedBox(width: ScreenConstant.sizeLarge),
                  Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CustomSwitch(
                                value: true,
                                color: AppColors.colorYesButton,
                              ),
                              SizedBox(width: ScreenConstant.sizeMedium),
                              Text(
                                "Reminder",
                                style: TextStyles.textStyleIntroDescription
                                    .apply(
                                        fontSizeDelta: -4, color: Colors.white),
                              )
                            ],
                          ),
                          Divider(
                              thickness: 1,
                              color: AppColors.white.withOpacity(0.12)),
                          _buildTimeList()
                        ],
                      ))
                ],
              ))),
      SizedBox(
        height: ScreenConstant.sizeXL,
      )
    ]);
  }

  _buildTimeList() {
    return ListView.separated(
      itemCount: 1,
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
              "Daily at 4:00 PM",
              style: TextStyles.textStyleRegular.apply(color: Colors.white),
            ),
          ],
        );
      },
      separatorBuilder: (BuildContext context, int index) =>
          Divider(thickness: 1, color: AppColors.white.withOpacity(0.12)),
    );
  }
}
