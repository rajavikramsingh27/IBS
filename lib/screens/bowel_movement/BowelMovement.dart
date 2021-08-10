import 'package:flutter/material.dart';
import 'package:flutter_ibs/controllers/bowel_movement/BowelMovementController.dart';
import 'package:flutter_ibs/utils/Assets.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/AdditionalNoteWidget.dart';
import 'package:flutter_ibs/widget/CustomArcPainter.dart';
import 'package:flutter_ibs/widget/CustomElevatedButton.dart';
import 'package:flutter_ibs/widget/CustomSwitch.dart';
import 'package:flutter_ibs/widget/DateTimeCardWidget.dart';
import 'package:flutter_ibs/widget/OvalPainterWidget.dart';
import 'package:flutter_ibs/widget/WavePainter.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class BowelMovement extends StatelessWidget {
  final _controller = Get.put(BowelMovementController());

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
              text: "Save",
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
      body: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Padding(
            padding:
                EdgeInsets.only(top: ScreenConstant.defaultHeightOneThirty),
            child: Stack(
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(top: ScreenConstant.defaultHeightTwenty),
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
                          "Track Bowel Movement",
                          style: TextStyles.textStyleIntroDescription
                              .apply(color: Colors.black, fontSizeDelta: -2),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: ScreenConstant.defaultHeightForty),
                        DateTimeCardWidget(),
                        SizedBox(
                            height: ScreenConstant.defaultHeightForty * 1.25),
                        Text(
                          "What does your poop look like?",
                          style: TextStyles.textStyleIntroDescription
                              .apply(color: Colors.black, fontSizeDelta: -2),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                            height: ScreenConstant.defaultHeightTwenty * 1.5),
                        Center(
                          child: Stack(
                            children: [
                              Image.asset(
                                Assets.hard_lump,
                                width:
                                    ScreenConstant.defaultWidthOneHundredSeven,
                                height: ScreenConstant.defaultHeightOneHundred,
                              ),
                              Positioned(
                                bottom: 0,
                                left: ScreenConstant.defaultWidthTwenty,
                                right: ScreenConstant.defaultWidthTwenty,
                                child: Container(
                                  height: ScreenConstant.defaultHeightTwenty,
                                  width: ScreenConstant.sizeXXXL,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: AppColors.colorButton,
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: ScreenConstant.sizeExtraSmall,
                                      vertical: 1),
                                  child: FittedBox(
                                    fit: BoxFit.contain,
                                    child: Text("Type 1",
                                        textAlign: TextAlign.center,
                                        style: TextStyles
                                            .textStyleIntroDescription
                                            .apply(
                                                color: Colors.white,
                                                fontSizeDelta: -9)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: ScreenConstant.sizeMedium),
                        Text("Separate hard lumps, like nuts ",
                            textAlign: TextAlign.center,
                            style: TextStyles.textStyleRegular),
                        SizedBox(height: ScreenConstant.sizeMedium),
                        _buildBowelTypeSlider(),
                        SizedBox(height: ScreenConstant.defaultHeightForty),
                        Stack(
                          children: [
                            Positioned.fill(
                              top: ScreenConstant.defaultHeightOneHundred,
                              bottom: ScreenConstant.defaultHeightOneHundred,
                              child: _buildWavePainter(),
                            ),
                            Container(
                              margin: ScreenConstant.spacingAllMedium,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                children: [
                                  _buildUrgency(),
                                  _buildColorPOrtion(),
                                  _buildRelief(),
                                ],
                              ),
                            ),
                          ],
                        ),
                        AdditionalNoteWidget(),
                        SizedBox(
                            height: ScreenConstant.defaultHeightTwentyFour),
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
    );
  }

  _buildBowelTypeSlider() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: ScreenConstant.defaultWidthTen),
      child: SfSliderTheme(
        data: SfSliderThemeData(
            thumbColor: AppColors.colorArrowButton,
            thumbStrokeWidth: 5,
            thumbRadius: 16,
            thumbStrokeColor: AppColors.colorBackground,
            activeTrackHeight: 4,
            overlayRadius: 0,
            disabledActiveTrackColor: AppColors.colorTrackSlider,
            disabledInactiveTrackColor: AppColors.colorTrackSlider,
            activeDividerStrokeWidth: 2,
            inactiveDividerStrokeWidth: 2,
            inactiveTrackHeight: 4,
            activeTrackColor: AppColors.colorTrackSlider,
            inactiveTrackColor: AppColors.colorTrackSlider,
            inactiveDividerStrokeColor: AppColors.colorTrackSlider,
            inactiveDividerRadius: 8,
            inactiveDividerColor: AppColors.white,
            activeDividerColor: AppColors.white,
            activeDividerStrokeColor: AppColors.colorTrackSlider,
            activeDividerRadius: 8,
            activeLabelStyle: TextStyles.textStyleRegular,
            inactiveLabelStyle: TextStyles.textStyleRegular),
        child: Obx(
          () => SfSlider(
            showDividers: true,
            min: 1.0,
            max: 7.0,
            interval: 1,
            stepSize: 1,
            showLabels: true,

            labelFormatterCallback:
                (dynamic actualValue, String formattedText) {
              return actualValue == 1
                  ? ' Type 1'
                  : actualValue == 2
                      ? "Type 2"
                      : actualValue == 3
                          ? "Type 3"
                          : actualValue == 4
                              ? "Type4"
                              : actualValue == 5
                                  ? "Type 5"
                                  : actualValue == 6
                                      ? " Type 6"
                                      : "Type 7";
            },
            value: _controller.sliderValue.value,
            onChanged: (dynamic newValue) {
              print("cahnged");
              // _controller.sliderValue.value = newValue;
            },
            // labelFormatterCallback: (String,newval){},
          ),
        ),
      ),
    );
  }

  _buildUrgency() {
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 1.3,
          child: Card(
            margin: EdgeInsets.zero,
            color: AppColors.colorBackground,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                SizedBox(height: ScreenConstant.defaultHeightForty),
                Text("Urgency",
                    style: TextStyles.textStyleIntroDescription
                        .apply(color: Colors.white, fontSizeDelta: -3)),
                SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
                Text(
                  "I needed to get to the washroom quite quickly",
                  textAlign: TextAlign.center,
                  style: TextStyles.textStyleRegular
                      .apply(color: AppColors.colorSkipButton),
                ),
                SizedBox(height: ScreenConstant.defaultHeightTwenty),
                _buildUrgencySlider(),
              ],
            ),
          ),
        ),
        Container(
          height: ScreenConstant.defaultHeightOneHundred,
          child: OvalPainterWidget(),
        ),
      ],
    );
  }

  _buildColorPOrtion() {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: ScreenConstant.sizeMedium,
          vertical: ScreenConstant.defaultHeightTwentyFour),
      child: Column(
        children: [
          Text("Colour",
              style: TextStyles.textStyleIntroDescription
                  .apply(color: Colors.black, fontSizeDelta: -3)),
          SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.black,
              ),
              CircleAvatar(
                radius: 20,
                backgroundColor: AppColors.colorArrowButton,
              ),
              CircleAvatar(
                radius: 20,
                backgroundColor: AppColors.colorBackground,
              )
            ],
          ),
          SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
          Text(
            "I feel only a little relief after bowel mowement",
            textAlign: TextAlign.center,
            style: TextStyles.textStyleRegular.apply(),
          ),
        ],
      ),
    );
  }

  _buildRelief() {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Card(
        margin: EdgeInsets.zero,
        color: AppColors.colorBackground,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            SizedBox(height: ScreenConstant.defaultHeightForty),
            Text("Relief",
                style: TextStyles.textStyleIntroDescription
                    .apply(color: Colors.white, fontSizeDelta: -3)),
            SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
            Text(
              "I feel only a little relief after bowel mowement",
              textAlign: TextAlign.center,
              style: TextStyles.textStyleRegular
                  .apply(color: AppColors.colorSkipButton),
            ),
            SizedBox(height: ScreenConstant.defaultHeightTwenty),
            _buildReliefSlider(),
            SizedBox(height: ScreenConstant.defaultHeightTwenty),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Straining at defecation",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyles.textStyleRegular
                        .apply(color: Colors.black, fontSizeDelta: 2),
                  ),
                  Obx(
                    () => CustomSwitch(
                      value: _controller.switchValue.value,
                      onChanged: (val) {
                        _controller.switchValue.value = val;
                      },
                    ),
                  )
                ],
              ),
              margin: ScreenConstant.spacingAllLarge,
              padding: ScreenConstant.spacingAllLarge,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16), color: Colors.white),
            )
          ],
        ),
      ),
    );
  }

  _buildWavePainter() {
    return CustomPaint(
      size: Size(Get.context!.mediaQuerySize.width,
          Get.context!.mediaQuerySize.height),
      painter: WavePainter(),
    );
  }

  _buildUrgencySlider() {
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
                  ? "Not at All"
                  : actualValue == 2
                      ? ""
                      : actualValue == 3
                          ? ""
                          : "Extremely";
            },
          ),
        ),
      ),
    );
  }

  _buildReliefSlider() {
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
                  ? "Complete"
                  : actualValue == 2
                      ? ""
                      : actualValue == 3
                          ? ""
                          : "No relief";
            },
          ),
        ),
      ),
    );
  }
}
