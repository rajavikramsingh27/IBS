import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ibs/controllers/health/HealthController.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/CustomArcPainter.dart';
import 'package:flutter_ibs/widget/CustomElevatedButton.dart';
import 'package:flutter_ibs/widget/DateTimeCardWidget.dart';
import 'package:flutter_ibs/widget/WavePainter.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class Health extends StatelessWidget {
  final _controller = Get.put(HealthController());

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
                          "Track Wellness",
                          style: TextStyles.textStyleIntroDescription
                              .apply(color: Colors.black, fontSizeDelta: -2),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: ScreenConstant.defaultHeightForty),
                        DateTimeCardWidget(),
                        SizedBox(height: ScreenConstant.defaultHeightForty),
                        Stack(
                          children: [
                            Positioned.fill(
                              top: ScreenConstant.defaultHeightOneHundred,
                              child: _buildWavePainter(),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: ScreenConstant.defaultWidthTwenty,
                                  vertical: ScreenConstant.defaultHeightSixty),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              child: _buildStress(),
                            ),
                          ],
                        ),
                        SizedBox(height: ScreenConstant.defaultHeightTwenty),
                        Text("Additional Notes",
                            textAlign: TextAlign.center,
                            style: TextStyles.textStyleIntroDescription
                                .apply(color: Colors.black, fontSizeDelta: -3)),
                        Padding(
                          padding: ScreenConstant.spacingAllMedium,
                          child: Card(
                            shadowColor: Colors.grey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)),
                            child: TextFormField(
                              inputFormatters: <TextInputFormatter>[],
                              readOnly: true,
                              decoration:
                                  InputDecoration(border: InputBorder.none),
                              textInputAction: TextInputAction.newline,
                              maxLines: 4,
                              minLines: 4,
                              // maxLength: 100,
                              // decoration: hintedInputDecoration(""),
                            ),
                          ),
                        ),
                        SizedBox(
                            height: ScreenConstant.defaultHeightTwentyThree),
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

  _buildWavePainter() {
    return Container(
      margin: EdgeInsets.only(top: ScreenConstant.defaultHeightTwenty * 1.5),
      width: Get.context.mediaQuerySize.width,
      child: CustomPaint(
        size: Size(Get.context.mediaQuerySize.width,
            Get.context.mediaQuerySize.height),
        painter: WavePainter(),
      ),
    );
  }

  _buildStress() {
    return Card(
      margin: EdgeInsets.zero,
      color: AppColors.colorBackground,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: ScreenConstant.defaultWidthTwenty),
        child: Column(
          children: [
            SizedBox(height: ScreenConstant.defaultHeightForty),
            Text("Stress",
                style: TextStyles.textStyleIntroDescription
                    .apply(color: Colors.white, fontSizeDelta: -3)),
            SizedBox(height: ScreenConstant.defaultHeightTwentyThree),
            Text(
              "I’m feeling a heightened degree of stress",
              textAlign: TextAlign.center,
              style: TextStyles.textStyleRegular
                  .apply(color: AppColors.colorSkipButton),
            ),
            SizedBox(height: ScreenConstant.defaultHeightTwenty),
            _buildStressSlider(),
            SizedBox(height: ScreenConstant.defaultHeightTwenty),
            Divider(thickness: 1, color: AppColors.white.withOpacity(0.12)),
            SizedBox(height: ScreenConstant.defaultHeightForty),
            Text("Fatigue",
                style: TextStyles.textStyleIntroDescription
                    .apply(color: Colors.white, fontSizeDelta: -3)),
            SizedBox(height: ScreenConstant.defaultHeightTwentyThree),
            Text(
              "I feel very tired but am still able to do most things",
              textAlign: TextAlign.center,
              style: TextStyles.textStyleRegular
                  .apply(color: AppColors.colorSkipButton),
            ),
            SizedBox(height: ScreenConstant.defaultHeightTwenty),
            _buildFatigueSlider(),
            SizedBox(height: ScreenConstant.defaultHeightTwenty),
            Divider(thickness: 1, color: AppColors.white.withOpacity(0.12)),
            SizedBox(height: ScreenConstant.defaultHeightForty),
            Text("Activity level",
                style: TextStyles.textStyleIntroDescription
                    .apply(color: Colors.white, fontSizeDelta: -3)),
            SizedBox(height: ScreenConstant.defaultHeightTwentyThree),
            Text(
              "I’ve been moving a lot today",
              textAlign: TextAlign.center,
              style: TextStyles.textStyleRegular
                  .apply(color: AppColors.colorSkipButton),
            ),
            SizedBox(height: ScreenConstant.defaultHeightTwenty),
            _buildActivityLevelSlider(),
            SizedBox(height: ScreenConstant.defaultHeightForty),
          ],
        ),
      ),
    );
  }

  _buildStressSlider() {
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
            value: _controller.sliderStressValue.value,
            onChanged: (dynamic newValue) {
              print("cahnged");
              _controller.sliderStressValue.value = newValue;
            },
            labelFormatterCallback:
                (dynamic actualValue, String formattedText) {
              return actualValue == 1
                  ? "None"
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

  _buildFatigueSlider() {
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
            value: _controller.sliderFatigueValue.value,
            onChanged: (dynamic newValue) {
              print("cahnged");
              _controller.sliderFatigueValue.value = newValue;
            },
            labelFormatterCallback:
                (dynamic actualValue, String formattedText) {
              return actualValue == 1
                  ? "Well Rested"
                  : actualValue == 2
                      ? ""
                      : actualValue == 3
                          ? ""
                          : "Exhausted";
            },
          ),
        ),
      ),
    );
  }

  _buildActivityLevelSlider() {
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
            value: _controller.sliderActivityValue.value,
            onChanged: (dynamic newValue) {
              print("cahnged");
              _controller.sliderActivityValue.value = newValue;
            },
            labelFormatterCallback:
                (dynamic actualValue, String formattedText) {
              return actualValue == 1
                  ? " Very Active"
                  : actualValue == 2
                      ? ""
                      : actualValue == 3
                          ? ""
                          : "No Activity";
            },
          ),
        ),
      ),
    );
  }
}
