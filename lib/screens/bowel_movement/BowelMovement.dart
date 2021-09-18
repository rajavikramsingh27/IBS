import 'package:flutter/material.dart';
import 'package:flutter_ibs/controllers/bowel_movement/BowelMovementController.dart';
import 'package:flutter_ibs/controllers/signup/SignUpController.dart';
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:flutter_ibs/services/url.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/AdditionalNoteWidget.dart';
import 'package:flutter_ibs/widget/CustomArcPainter.dart';
import 'package:flutter_ibs/widget/CustomElevatedButton.dart';
import 'package:flutter_ibs/widget/CustomSwitch.dart';
import 'package:flutter_ibs/widget/DateTimeCardWidget.dart';
import 'package:flutter_ibs/widget/OvalPainterWidget.dart';
import 'package:flutter_ibs/widget/ScreenControls/RenderWidgetByType.dart';
import 'package:flutter_ibs/widget/WavePainter.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class BowelMovement extends StatelessWidget {
  final controller = Get.put(BowelMovementController());
  final SignUpController _signUpController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(height: ScreenConstant.defaultHeightTen),
            controller.loader.value
                ? Offstage()
                : CustomElevatedButton(
                    widthFactor: 0.7,
                    text: "Save",
                    onTap: controller.onSave,
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
      body: Obx(
            () => ListView(
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
                            "Track Bowel Movements",
                            style: TextStyles.textStyleIntroDescription.apply(
                                color: Colors.black, fontSizeDelta: -2),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: ScreenConstant.defaultHeightForty),
                          DateTimeCardWidget(),
                          SizedBox(height: ScreenConstant.defaultHeightForty),
                          controller.loader.value
                              ? Center(
                              child: Padding(
                                padding: ScreenConstant.spacingAllLarge,
                                child: Container(
                                    height:
                                    ScreenConstant.screenHeightThird,
                                    child: Center(
                                        child:
                                        CircularProgressIndicator())),
                              ))
                              : ListView.builder(
                              shrinkWrap: true,
                              physics: ClampingScrollPhysics(),
                              itemCount: controller.formWidgetList.length,
                              itemBuilder: (_, mainIndex) {
                                bool isFirst = mainIndex == 0;
                                bool isLast = false;
                                int listLength = controller.formWidgetList.length;

                                if (mainIndex ==  (listLength - 2)
                                    || mainIndex ==  (listLength - 1 )){
                                  // If it's the last one or two... because additional notes could be after.
                                  isLast = true;
                                }

                                // Check for above/below class:
                                if (mainIndex > 0){
                                  TrackableItem previous = controller.formWidgetList[mainIndex - 1];
                                  if (previous.style == TrackableStyle.WHITE_WHITE || previous.style == TrackableStyle.BLUE_WHITE){
                                    isFirst = true;
                                  }
                                }

                                if (mainIndex < listLength-1){
                                  TrackableItem next = controller.formWidgetList[mainIndex + 1];
                                  if (next.style == TrackableStyle.WHITE_WHITE || next.style == TrackableStyle.BLUE_WHITE){
                                    isLast = true;
                                  }
                                }

                                return RenderWidgetByType().renderTrackableItem(
                                    controller.formWidgetList[mainIndex],
                                    isFirst: isFirst,
                                    isLast: isLast,
                                    onValueChanged: controller.valueChanged
                                );
                              }),
                          SizedBox(
                              height: ScreenConstant.defaultHeightTwenty),
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



  _buildUrgency({TrackableItem data}) {
    return Container(
      color: AppColors.white,
      child: Stack(
        children: [
          AspectRatio(
            aspectRatio: 1.3,
            child: Card(
              margin: EdgeInsets.zero,
              color: AppColors.colorBackground,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: ScreenConstant.spacingAllMedium,
                child: Column(
                  children: [
                    SizedBox(height: ScreenConstant.defaultHeightForty),
                    Text(data.name.tr,
                        style: TextStyles.textStyleIntroDescription
                            .apply(color: Colors.white, fontSizeDelta: -3)),
                    SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
                    Text(
                      data.description.tr,
                      textAlign: TextAlign.center,
                      style: TextStyles.textStyleRegular
                          .apply(color: AppColors.colorSkipButton),
                    ),
                    SizedBox(height: ScreenConstant.defaultHeightTwenty),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: ScreenConstant.defaultWidthTen),
                      child: SfSliderTheme(
                        data: SfSliderThemeData(
                          thumbColor: AppColors.colorArrowButton,
                          thumbStrokeWidth: 5,
                          thumbRadius: 16,
                          thumbStrokeColor: Colors.white,
                          activeTrackHeight: 4,
                          overlayRadius: 0,
                          disabledActiveTrackColor: AppColors.colorTrackSlider,
                          disabledInactiveTrackColor:
                              AppColors.colorTrackSlider,
                          activeDividerStrokeWidth: 2,
                          inactiveDividerStrokeWidth: 2,
                          inactiveTrackHeight: 4,
                          activeTrackColor: AppColors.colorTrackSlider,
                          inactiveTrackColor: AppColors.colorTrackSlider,
                          inactiveDividerStrokeColor: AppColors.white,
                          inactiveDividerRadius: 8,
                          inactiveDividerColor:
                              AppColors.colorInactiveDividerSlider,
                          activeDividerColor:
                              AppColors.colorInactiveDividerSlider,
                          activeDividerStrokeColor: Colors.white,
                          activeDividerRadius: 8,
                          activeLabelStyle: TextStyles.textStyleRegular
                              .apply(color: AppColors.colorTrackSlider),
                          inactiveLabelStyle: TextStyles.textStyleRegular
                              .apply(color: AppColors.colorTrackSlider),
                        ),
                        child: SfSlider(
                          showDividers: true,
                          min: 1.0,
                          max: data.rating.range,
                          interval: 1,
                          stepSize: 1,
                          showLabels: true,
                          value: data.rating.ratingDefault,
                          onChanged: (dynamic newValue) {
                            data.rating.ratingDefault = newValue;
                            /*
                            controller.initModel(
                                data: data,
                                dType: "num",
                                value: data.rating.ratingDefault);
                            _signUpController.bowelMovements.refresh();
                            */

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
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: ScreenConstant.defaultHeightOneHundred,
            child: OvalPainterWidget(),
          ),
        ],
      ),
    );
  }

  _buildColorPortion({TrackableItem data}) {

  }

  _buildRelief({TrackableItem data}) {
    return Container(
      color: AppColors.white,
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 1.2,
            child: Card(
              margin: EdgeInsets.zero,
              color: AppColors.colorBackground,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: ScreenConstant.spacingAllMedium,
                child: Column(
                  children: [
                    SizedBox(height: ScreenConstant.sizeLarge),
                    Text(data.name.tr,
                        style: TextStyles.textStyleIntroDescription
                            .apply(color: Colors.white, fontSizeDelta: -3)),
                    SizedBox(height: ScreenConstant.sizeLarge),
                    Text(
                      data.description.tr,
                      textAlign: TextAlign.center,
                      style: TextStyles.textStyleRegular
                          .apply(color: AppColors.colorSkipButton),
                    ),
                    SizedBox(height: ScreenConstant.sizeLarge),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: ScreenConstant.defaultWidthTen),
                      child: SfSliderTheme(
                        data: SfSliderThemeData(
                          thumbColor: AppColors.colorArrowButton,
                          thumbStrokeWidth: 5,
                          thumbRadius: 16,
                          thumbStrokeColor: Colors.white,
                          activeTrackHeight: 4,
                          overlayRadius: 0,
                          disabledActiveTrackColor: AppColors.colorTrackSlider,
                          disabledInactiveTrackColor:
                              AppColors.colorTrackSlider,
                          activeDividerStrokeWidth: 2,
                          inactiveDividerStrokeWidth: 2,
                          inactiveTrackHeight: 4,
                          activeTrackColor: AppColors.colorTrackSlider,
                          inactiveTrackColor: AppColors.colorTrackSlider,
                          inactiveDividerStrokeColor: AppColors.white,
                          inactiveDividerRadius: 8,
                          inactiveDividerColor:
                              AppColors.colorInactiveDividerSlider,
                          activeDividerColor:
                              AppColors.colorInactiveDividerSlider,
                          activeDividerStrokeColor: Colors.white,
                          activeDividerRadius: 8,
                          activeLabelStyle: TextStyles.textStyleRegular
                              .apply(color: AppColors.colorTrackSlider),
                          inactiveLabelStyle: TextStyles.textStyleRegular
                              .apply(color: AppColors.colorTrackSlider),
                        ),
                        child: SfSlider(
                          showDividers: true,
                          min: 1.0,
                          max: data.rating.range,
                          interval: 1,
                          stepSize: 1,
                          showLabels: true,
                          value: data.rating.ratingDefault,
                          onChanged: (dynamic newValue) {
                            data.rating.ratingDefault = newValue;
                            controller.initModel(
                              data: data,
                              dType: "num",
                              value: data.rating.ratingDefault,
                            );
                            _signUpController.bowelMovements.refresh();
                          },
                          labelFormatterCallback:
                              (dynamic actualValue, String formattedText) {
                            if (actualValue == 1) {
                              return "Complete";
                            }
                            if (actualValue == data.rating.range) {
                              return "No relief";
                            }
                            return "";
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: ScreenConstant.sizeLarge),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemCount: data.children.first.items.length,
                        itemBuilder: (_, index) {
                          switch (data.children.first.items[index].tid) {
                            case "bowelMovements-relief-straining":
                              {
                                return Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        data.children.first.items[index].toggle
                                                .toggleDefault
                                            ? data
                                                .children
                                                .first
                                                .items[index]
                                                .toggle
                                                .label
                                                .tr
                                            : data
                                                .children
                                                .first
                                                .items[index]
                                                .toggle
                                                .label
                                                .tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                        style: TextStyles.textStyleRegular
                                            .apply(
                                                color: Colors.black,
                                                fontSizeDelta: 2),
                                      ),
                                      CustomSwitch(
                                        value: data.children.first.items[index]
                                            .toggle.toggleDefault,
                                        onChanged: (val) {
                                          data.children.first.items[index]
                                              .toggle.toggleDefault = val;
                                          controller.initSubModel(
                                              data: data
                                                  .children.first.items[index],
                                              dType: "bool",
                                              value: data
                                                  .children
                                                  .first
                                                  .items[index]
                                                  .toggle
                                                  .toggleDefault,
                                              kind: data.kind,
                                              tid: data.tid,
                                              mainType: "num");
                                          _signUpController.symptoms.refresh();
                                        },
                                      ),
                                    ],
                                  ),
                                  margin: ScreenConstant.spacingAllLarge,
                                  padding: ScreenConstant.spacingAllLarge,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      color: Colors.white),
                                );
                              }
                              break;
                            default:
                              {
                                return Offstage();
                              }
                              break;
                          }
                        }),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: ScreenConstant.sizeXL),
        ],
      ),
    );
  }

  _buildWavePainter() {
    return CustomPaint(
      size: Size(
          Get.context.mediaQuerySize.width, Get.context.mediaQuerySize.height),
      painter: WavePainter(),
    );
  }



}
