import 'package:flutter/material.dart';
import 'package:flutter_ibs/controllers/home/symptoms/SymptomsController.dart';
import 'package:flutter_ibs/utils/Assets.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/DummyData.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/AdditionalNoteWidget.dart';
import 'package:flutter_ibs/widget/CustomArcPainter.dart';
import 'package:flutter_ibs/widget/CustomElevatedButton.dart';
import 'package:flutter_ibs/widget/DateTimeCardWidget.dart';
import 'package:flutter_ibs/widget/WavePainter.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class Symptoms extends StatelessWidget {
  final _controller = Get.put(SymptomsController());

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
                          "Track Symptoms",
                          style: TextStyles.textStyleIntroDescription
                              .apply(color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: ScreenConstant.defaultHeightForty),
                        DateTimeCardWidget(),
                        SizedBox(height: ScreenConstant.defaultHeightForty),
                        _buildAbdominal(),
                        SizedBox(height: ScreenConstant.defaultHeightForty),

                        AdditionalNoteWidget(),
                        SizedBox(
                            height: ScreenConstant.defaultHeightTwentyThree),

                        // _buildExcerciseDuration()
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

  _buildAbdominalSlider() {
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
                  ? "None"
                  : actualValue == 2
                      ? ""
                      : actualValue == 3
                          ? ""
                          : "Severe";
            },
          ),
        ),
      ),
    );
  }

  _buildBloatingSlider() {
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
                  ? "None"
                  : actualValue == 2
                      ? ""
                      : actualValue == 3
                          ? ""
                          : "Severe";
            },
          ),
        ),
      ),
    );
  }

  _buildAbdominal() {
    return Container(
      child: Stack(
        children: [
          Positioned.fill(
            child: _buildWavePainter(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ScreenConstant.defaultWidthTen * 1.6,
            ),
            child: Card(
              margin: EdgeInsets.zero,
              color: AppColors.colorBackground,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  SizedBox(height: ScreenConstant.defaultHeightTwenty),
                  Text("Abdominal Pain",
                      style: TextStyles.textStyleIntroDescription
                          .apply(color: Colors.white, fontSizeDelta: -3)),
                  SizedBox(height: ScreenConstant.defaultHeightTen),
                  Text(
                    "I have no abdominal pain.",
                    style: TextStyles.textStyleRegular
                        .apply(color: AppColors.colorSkipButton),
                  ),
                  SizedBox(height: ScreenConstant.defaultHeightTen),
                  _buildAbdominalSlider(),
                  _abdominalPainList(),
                  Text("Bloating",
                      style: TextStyles.textStyleIntroDescription
                          .apply(color: Colors.white, fontSizeDelta: -3)),
                  SizedBox(height: ScreenConstant.defaultHeightTen),
                  Text(
                    "I have no bloating.",
                    style: TextStyles.textStyleRegular
                        .apply(color: AppColors.colorSkipButton),
                  ),
                  SizedBox(height: ScreenConstant.defaultHeightTen),
                  _buildBloatingSlider(),
                  _buildBloatingList(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  _abdominalPainList() {
    return Padding(
      padding: ScreenConstant.spacingAllMedium,
      child: Column(
        children: [
          SizedBox(height: ScreenConstant.defaultHeightTwenty),
          Text("Describe How Your Pain Feels",
              textAlign: TextAlign.center,
              style: TextStyles.textStyleIntroDescription
                  .apply(color: Colors.white, fontSizeDelta: -3)),
          SizedBox(height: ScreenConstant.defaultHeightTen),
          Text(
            "Select from list below to help describe what you are feeling.",
            textAlign: TextAlign.center,
            style: TextStyles.textStyleRegular
                .apply(color: AppColors.colorSkipButton),
          ),
          SizedBox(height: ScreenConstant.defaultHeightTwentyThree),
          GridView.builder(
            //   padding: EdgeInsets.symmetric(
            //       horizontal: ScreenConstant.defaultWidthTwenty),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: DummyData.symptoms.length,
            itemBuilder: (BuildContext context, int index) {
              var model = DummyData.symptoms[index];
              return Card(
                  elevation: 0,
                  color: AppColors.colorSymptomsGridBg,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: ScreenConstant.spacingAllDefault,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          model.image,
                          width: ScreenConstant.defaultWidthTwenty * 1.5,
                        ),
                        SizedBox(height: ScreenConstant.defaultHeightTen),
                        Text("${model.text}",
                            textAlign: TextAlign.center,
                            style: TextStyles.textStyleRegular.apply(
                                color: AppColors.white, fontSizeDelta: -2)),
                      ],
                    ),
                  ));
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, childAspectRatio: 1),
          ),
          SizedBox(height: ScreenConstant.defaultHeightForty * 1.25),
          _buildDuration(),
          SizedBox(height: ScreenConstant.defaultHeightTwentyThree),
          Divider(thickness: 1, color: AppColors.white.withOpacity(0.12)),
          SizedBox(height: ScreenConstant.defaultHeightTwenty),
        ],
      ),
    );
  }

  _buildBloatingList() {
    return Padding(
      padding: ScreenConstant.spacingAllMedium,
      child: Column(
        children: [
          SizedBox(height: ScreenConstant.defaultHeightTwenty),
          Text("Describe How Your Pain Feels",
              textAlign: TextAlign.center,
              style: TextStyles.textStyleIntroDescription
                  .apply(color: Colors.white, fontSizeDelta: -3)),
          SizedBox(height: ScreenConstant.defaultHeightTen),
          Text(
            "Select from list below to help describe what you are feeling.",
            textAlign: TextAlign.center,
            style: TextStyles.textStyleRegular
                .apply(color: AppColors.colorSkipButton),
          ),
          SizedBox(height: ScreenConstant.defaultHeightTwentyThree),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: DummyData.symptoms.length,
            itemBuilder: (BuildContext context, int index) {
              var model = DummyData.symptoms[index];
              return Card(
                  elevation: 0,
                  color: AppColors.colorSymptomsGridBg,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: ScreenConstant.spacingAllDefault,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          model.image,
                          width: ScreenConstant.defaultWidthTwenty * 1.5,
                        ),
                        SizedBox(height: ScreenConstant.defaultHeightTen),
                        Text("${model.text}",
                            textAlign: TextAlign.center,
                            style: TextStyles.textStyleRegular.apply(
                                color: AppColors.white, fontSizeDelta: -2)),
                      ],
                    ),
                  ));
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, childAspectRatio: 1),
          ),
          SizedBox(height: ScreenConstant.defaultHeightForty * 1.25),
          _buildDuration(),
          SizedBox(height: ScreenConstant.defaultHeightTwentyThree),
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

  _buildDuration() {
    return Column(
      children: [
        Text("Duration",
            textAlign: TextAlign.center,
            style: TextStyles.textStyleIntroDescription
                .apply(color: Colors.white, fontSizeDelta: -3)),
        SizedBox(height: ScreenConstant.defaultHeightTen),
        Text(
          "How long have you been experiencing abdominal pain ?",
          textAlign: TextAlign.center,
          style: TextStyles.textStyleRegular
              .apply(color: AppColors.colorSkipButton),
        ),
        SizedBox(height: ScreenConstant.defaultHeightTwentyThree),
        _buildSelector()
      ],
    );
  }

  // _buildExcerciseDuration() {
  //   return Stack(
  //     children: [
  //       Image.asset(Assets.symptomsBg),
  //       Container(
  //         width: double.maxFinite,
  //         margin: EdgeInsets.symmetric(
  //             horizontal: ScreenConstant.defaultWidthTwenty),
  //         decoration: BoxDecoration(
  //             color: AppColors.colorBackground,
  //             borderRadius: BorderRadius.only(
  //                 bottomLeft: Radius.circular(20),
  //                 bottomRight: Radius.circular(20))),
  //         child: Column(
  //           children: [
  //             SizedBox(height: ScreenConstant.defaultHeightTwenty),
  //             Text(
  //               "Exercise Duration",
  //               style: TextStyles.textStyleIntroDescription
  //                   .apply(color: Colors.white, fontSizeDelta: -2),
  //               textAlign: TextAlign.center,
  //             ),
  //             SizedBox(height: ScreenConstant.defaultHeightTwenty),
  //             Text(
  //               "How long have you been experiencing \nthese sympsoms ?",
  //               style: TextStyles.textStyleRegular
  //                   .apply(color: Colors.white.withOpacity(0.40)),
  //               textAlign: TextAlign.center,
  //             ),
  //             SizedBox(height: ScreenConstant.defaultHeightTwentyThree),
  //             _buildSelector(),
  //             SizedBox(height: ScreenConstant.defaultHeightTwentyThree),

  //              Align(alignment: Alignment(-0.9,0),
  //                               child: Text(
  //                 "Notes",
  //                 style: TextStyles.textStyleRegular
  //                     .apply(color: Colors.white),
  //                 textAlign: TextAlign.start,
  //             ),
  //              ),
  //           ],
  //         ),
  //       )
  //     ],
  //   );
  // }

  _buildSelector() {
    return Container(
      height: ScreenConstant.defaultHeightForty,
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
          value: "Less than 1 hour",
          elevation: 30,
          icon: Icon(
            Icons.keyboard_arrow_down_outlined,
            color: AppColors.colorBackground,
          ),
          iconSize: 20,
          underline: SizedBox(),
          onChanged: (String newValue) {
            // setState(() {
            //   dropdownValue = newValue;
            // });
          },
          items: <String>["Less than 1 hour", "2", "3", "4", "5", "more"]
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value.toString(),
              child: Text(value.toString(), style: TextStyles.textStyleRegular),
            );
          }).toList()),
    );
  }
}
