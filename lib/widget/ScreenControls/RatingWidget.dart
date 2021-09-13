import 'package:flutter/material.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class RatingWidget extends StatelessWidget {
  final TrackableItem trackableItem;
  final bool isFirst;
  final bool isLast;
  final bool isChild;
  final Function(TrackableSubmitItem) onValueChanged;

  const RatingWidget({
    //Key key,
    this.trackableItem,
    this.isFirst,
    this.isLast,
    this.isChild,
    this.onValueChanged
  }) : super();

  @override
  Widget build(BuildContext context) {
        //(TrackableItem trackableItem,
       // {bool isFirst, bool isLast, bool isChild}) {
      return Stack(
        children: [
          Positioned.fill(
            top: isFirst ? ScreenConstant.defaultHeightOneHundred : 0,
            child: Container(
              color: AppColors.colorYesButton,
            ),
          ),
          Card(
            color: AppColors.colorBackground,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(isFirst ? 20 : 0),
                    topRight: Radius.circular(isFirst ? 20 : 0),
                    bottomLeft: Radius.circular(isLast ? 20 : 0),
                    bottomRight: Radius.circular(isLast ? 20 : 0))),
            margin: EdgeInsets.only(
              left: isChild ? 0 : ScreenConstant.defaultWidthTwenty,
              right: isChild ? 0 : ScreenConstant.defaultWidthTwenty,
            ),
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: isChild ? 0 : ScreenConstant.defaultWidthTwenty, vertical: 1),
              child: Column(
                children: [
                  SizedBox(height: ScreenConstant.defaultHeightTwenty),
                  Text(trackableItem.name.tr,
                      style: TextStyles.textStyleIntroDescription
                          .apply(color: Colors.white, fontSizeDelta: -3)),
                  SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
                  Text(
                    //trackableItem.description.tr,
                    trackableItem
                        .rating
                        .options[(trackableItem.rating.value.toInt() - 1)]
                        .description
                        .tr,
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
                        disabledInactiveTrackColor: AppColors.colorTrackSlider,
                        activeDividerStrokeWidth: 2,
                        inactiveDividerStrokeWidth: 2,
                        inactiveTrackHeight: 4,
                        activeTrackColor: AppColors.colorTrackSlider,
                        inactiveTrackColor: AppColors.colorTrackSlider,
                        inactiveDividerStrokeColor: AppColors.white,
                        inactiveDividerRadius: 8,
                        inactiveDividerColor:
                        AppColors.colorInactiveDividerSlider,
                        activeDividerColor: AppColors.colorInactiveDividerSlider,
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
                        max: trackableItem.rating.range,
                        interval: 1,
                        stepSize: 1,
                        showLabels: true,
                        value: trackableItem.rating.value,
                        onChanged: (dynamic newValue) {
                          trackableItem.rating.value = newValue;
                          onValueChanged(TrackableSubmitItem(
                            tid: trackableItem.tid,
                            category: trackableItem.category,
                            kind: trackableItem.kind,
                            dtype: "num",
                            value: newValue,
                          ));
                         // onValueChanged(newValue.toInt());
                          /*
                          if (_healthWellnessController
                              .healthWellnessModel.value.items ==
                              null) {
                            _healthWellnessController
                                .healthWellnessModel.value.items = [];
                          }
                          Item item = Item(
                              tid: trackableItem.tid,
                              kind: trackableItem.kind,
                              dtype: "num",
                              value: ItemValue(numValue: newValue));
                          _healthWellnessController
                              .healthWellnessModel.value.items
                              .add(item);
                          _healthWellnessController.healthWellnessModel.refresh();
                          _signUpController.healthWellness.refresh();

                           */
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
                  SizedBox(height: ScreenConstant.defaultHeightTwenty),
                  Visibility(
                      visible: !isChild,
                      child: Divider(
                          thickness: 1,
                          color: AppColors.white.withOpacity(0.12))),
                ],
              ),
            ),
          ),
        ],
      );
  }
}
