import 'package:flutter/material.dart';
import 'package:flutter_ibs/controllers/home/symptoms/SymptomsController.dart';
import 'package:flutter_ibs/controllers/signup/SignUpController.dart';
import 'package:flutter_ibs/models/response_model/TrackablesListModel.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/DummyData.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/AdditionalNoteWidget.dart';
import 'package:flutter_ibs/widget/CustomArcPainter.dart';
import 'package:flutter_ibs/widget/CustomElevatedButton.dart';
import 'package:flutter_ibs/widget/DateTimeCardWidget.dart';
import 'package:flutter_ibs/widget/OvalPainterWidget.dart';
import 'package:flutter_ibs/widget/WavePainter.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class Symptoms extends StatelessWidget {
  final SymptomsController _symptomsController = Get.put(SymptomsController());
  final SignUpController _signUpController = Get.put(SignUpController());

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
      backgroundColor: AppColors.barrierColor.withOpacity(0.6),
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
                        Stack(
                          children: [
                            Positioned.fill(
                              top: ScreenConstant.defaultHeightOneHundred,
                              child: Container(
                                margin: EdgeInsets.only(top: ScreenConstant.defaultHeightTwenty * 1.5),
                                width: Get.context.mediaQuerySize.width,
                                child: CustomPaint(
                                  size: Size(Get.context.mediaQuerySize.width,
                                      Get.context.mediaQuerySize.height),
                                  painter: WavePainter(),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal:
                                    ScreenConstant.defaultWidthTen * 1.6,
                              ),
                              child: Card(
                                margin: EdgeInsets.zero,
                                color: AppColors.colorBackground,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                child: Stack(
                                  children: [
                                    Column(
                                      children: [
                                        Obx(
                                          () => ListView.builder(
                                              shrinkWrap: true,
                                              physics: ClampingScrollPhysics(),
                                              itemCount: _signUpController
                                                      .symptoms
                                                      .value
                                                      ?.items
                                                      ?.length ??
                                                  0,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                if (_signUpController
                                                        .symptoms
                                                        .value
                                                        .items[index]
                                                        .tid ==
                                                    "symptoms-notes") {
                                                  return Offstage();
                                                } else {
                                                  return ListView(
                                                    shrinkWrap: true,
                                                    physics:
                                                    ClampingScrollPhysics(),
                                                    children: [
                                                      SizedBox(
                                                          height: ScreenConstant
                                                              .defaultHeightTwenty *
                                                              1.6),
                                                      Text(
                                                        _signUpController
                                                            .symptoms
                                                            .value
                                                            .items[index]
                                                            .tid,
                                                        style: TextStyles
                                                            .textStyleIntroDescription
                                                            .apply(
                                                            color: Colors
                                                                .white,
                                                            fontSizeDelta:
                                                            -3),
                                                        textAlign:
                                                        TextAlign.center,
                                                      ),
                                                      SizedBox(
                                                          height: ScreenConstant
                                                              .defaultHeightTen),
                                                      Text(
                                                        "I have no ${_signUpController.symptoms.value.items[index].tid}",
                                                        style: TextStyles
                                                            .textStyleRegular
                                                            .apply(
                                                            color: AppColors
                                                                .colorSkipButton),
                                                        textAlign:
                                                        TextAlign.center,
                                                      ),
                                                      SizedBox(
                                                          height: ScreenConstant
                                                              .defaultHeightTwenty),
                                                      Padding(
                                                        padding: EdgeInsets.symmetric(
                                                            horizontal:
                                                            ScreenConstant
                                                                .defaultWidthTen),
                                                        child: SfSliderTheme(
                                                          data:
                                                          SfSliderThemeData(
                                                            thumbColor: AppColors
                                                                .colorArrowButton,
                                                            thumbStrokeWidth: 5,
                                                            thumbRadius: 16,
                                                            thumbStrokeColor:
                                                            Colors.white,
                                                            activeTrackHeight:
                                                            4,
                                                            overlayRadius: 0,
                                                            disabledActiveTrackColor:
                                                            AppColors
                                                                .colorTrackSlider,
                                                            disabledInactiveTrackColor:
                                                            AppColors
                                                                .colorTrackSlider,
                                                            activeDividerStrokeWidth:
                                                            2,
                                                            inactiveDividerStrokeWidth:
                                                            2,
                                                            inactiveTrackHeight:
                                                            4,
                                                            activeTrackColor:
                                                            AppColors
                                                                .colorTrackSlider,
                                                            inactiveTrackColor:
                                                            AppColors
                                                                .colorTrackSlider,
                                                            inactiveDividerStrokeColor:
                                                            AppColors.white,
                                                            inactiveDividerRadius:
                                                            8,
                                                            inactiveDividerColor:
                                                            AppColors
                                                                .colorInactiveDividerSlider,
                                                            activeDividerColor:
                                                            AppColors
                                                                .colorInactiveDividerSlider,
                                                            activeDividerStrokeColor:
                                                            Colors.white,
                                                            activeDividerRadius:
                                                            8,
                                                            activeLabelStyle: TextStyles
                                                                .textStyleRegular
                                                                .apply(
                                                                color: AppColors
                                                                    .colorTrackSlider),
                                                            inactiveLabelStyle: TextStyles
                                                                .textStyleRegular
                                                                .apply(
                                                                color: AppColors
                                                                    .colorTrackSlider),
                                                          ),
                                                          child: SfSlider(
                                                            showDividers: true,
                                                            min: 1.0,
                                                            max: _signUpController
                                                                .symptoms
                                                                .value
                                                                .items[
                                                            index]
                                                                ?.rating
                                                                ?.range ??
                                                                2,
                                                            interval: 1,
                                                            stepSize: 1,
                                                            showLabels: true,
                                                            value: _signUpController
                                                                .symptoms
                                                                .value
                                                                .items[index]
                                                                .rating
                                                                .ratingDefault,
                                                            onChanged: (dynamic
                                                            newValue) {
                                                              print(
                                                                  "New Value : $newValue");
                                                              _signUpController
                                                                  .symptoms
                                                                  .value
                                                                  .items[index]
                                                                  .rating
                                                                  .ratingDefault =
                                                                  newValue;
                                                              _signUpController.symptoms.refresh();
                                                            },
                                                            labelFormatterCallback:
                                                                (dynamic
                                                            actualValue,
                                                                String
                                                                formattedText) {
                                                              if (actualValue ==
                                                                  1.0) {
                                                                return "None";
                                                              }
                                                              if (actualValue ==
                                                                  _signUpController
                                                                      .symptoms
                                                                      .value
                                                                      .items
                                                                      .length +
                                                                      1) {
                                                                return "Severe";
                                                              }
                                                              return "";
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                      _signUpController
                                                          .symptoms
                                                          .value
                                                          .items[index]
                                                          .rating
                                                          .ratingDefault !=
                                                          1
                                                          ? Padding(
                                                        padding:
                                                        ScreenConstant
                                                            .spacingAllMedium,
                                                        child: Column(
                                                          children: [
                                                            SizedBox(
                                                                height: ScreenConstant
                                                                    .defaultHeightTwenty),
                                                            Text(
                                                                _signUpController
                                                                    .symptoms
                                                                    .value
                                                                    .items[index].children.first.items.first.tid,
                                                                textAlign:
                                                                TextAlign
                                                                    .center,
                                                                style: TextStyles
                                                                    .textStyleIntroDescription
                                                                    .apply(
                                                                    color: Colors.white,
                                                                    fontSizeDelta: -3)),
                                                            SizedBox(
                                                                height: ScreenConstant
                                                                    .defaultHeightTen),
                                                            Text(
                                                              _signUpController
                                                                  .symptoms
                                                                  .value
                                                                  .items[index].children.first.items.first.description,
                                                              textAlign:
                                                              TextAlign
                                                                  .center,
                                                              style: TextStyles
                                                                  .textStyleRegular
                                                                  .apply(
                                                                  color:
                                                                  AppColors.colorSkipButton),
                                                            ),
                                                            SizedBox(
                                                                height: ScreenConstant
                                                                    .defaultHeightTwentyFour),
                                                            GridView
                                                                .builder(
                                                              //   padding: EdgeInsets.symmetric(
                                                              //       horizontal: ScreenConstant.defaultWidthTwenty),
                                                              shrinkWrap:
                                                              true,
                                                              physics:
                                                              NeverScrollableScrollPhysics(),
                                                              itemCount: _signUpController
                                                                  .symptoms
                                                                  .value
                                                                  .items[index].children.first.items.first.list.options.length,
                                                              itemBuilder:
                                                                  (BuildContext
                                                              context,
                                                                  int optIdx) {
                                                                var model =_signUpController
                                                                    .symptoms
                                                                    .value
                                                                    .items[index].children.first.items.first.list.options[optIdx];
                                                                var imageModel = DummyData.symptoms[optIdx];
                                                                return Card(
                                                                    elevation:
                                                                    0,
                                                                    color: AppColors
                                                                        .colorSymptomsGridBg,
                                                                    shape:
                                                                    RoundedRectangleBorder(
                                                                      borderRadius:
                                                                      BorderRadius.circular(16),
                                                                    ),
                                                                    child:
                                                                    Padding(
                                                                      padding:
                                                                      ScreenConstant.spacingAllDefault,
                                                                      child:
                                                                      Column(
                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                        children: [
                                                                          Image.asset(
                                                                            model.image.normal,
                                                                            width: ScreenConstant.defaultWidthTwenty * 1.5,
                                                                          ),
                                                                          SizedBox(height: ScreenConstant.defaultHeightTen),
                                                                          Text("${model.label}", textAlign: TextAlign.center, style: TextStyles.textStyleRegular.apply(color: AppColors.white, fontSizeDelta: -2)),
                                                                        ],
                                                                      ),
                                                                    ));
                                                              },
                                                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                                  crossAxisCount:
                                                                  3,
                                                                  childAspectRatio:
                                                                  1),
                                                            ),
                                                            SizedBox(
                                                                height: ScreenConstant
                                                                    .defaultHeightForty *
                                                                    1.25),
                                                            Column(
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
                                                                SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
                                                                Container(
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
                                                                )
                                                              ],
                                                            ),
                                                            SizedBox(
                                                                height: ScreenConstant
                                                                    .defaultHeightTwentyFour),
                                                            Divider(
                                                                thickness:
                                                                1,
                                                                color: AppColors
                                                                    .white
                                                                    .withOpacity(
                                                                    0.12)),
                                                            SizedBox(
                                                                height: ScreenConstant
                                                                    .defaultHeightTwenty),
                                                          ],
                                                        ),
                                                      )
                                                          : Offstage(),
                                                      SizedBox(
                                                          height: ScreenConstant
                                                              .defaultHeightTwenty),
                                                    ],
                                                  );
                                                }
                                              }),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      height: ScreenConstant
                                          .defaultHeightOneHundred,
                                      child: OvalPainterWidget(),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: ScreenConstant.defaultHeightForty),

                        AdditionalNoteWidget(),
                        SizedBox(
                            height: ScreenConstant.defaultHeightTwentyFour),

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
}
