import 'package:flutter/material.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class RatingWidget extends StatelessWidget {
  final TrackableItem ratingItem;
  final bool isFirst;
  final bool isLast;
  final bool isChild;
  final List<TrackableItem> submissionList;

  const RatingWidget({
    //Key key,
    this.ratingItem,
    this.isFirst,
    this.isLast,
    this.isChild,
    this.submissionList
  }) : super();

  @override
  Widget build(BuildContext context) {
        //(TrackableItem ratingItem,
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
                  horizontal: ScreenConstant.defaultWidthTwenty, vertical: 1),
              child: Column(
                children: [
                  SizedBox(height: ScreenConstant.defaultHeightTwenty),
                  Text(ratingItem.name.tr,
                      style: TextStyles.textStyleIntroDescription
                          .apply(color: Colors.white, fontSizeDelta: -3)),
                  SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
                  Text(
                    //ratingItem.description.tr,
                    ratingItem
                        .rating
                        .options[(ratingItem.rating.ratingDefault.toInt() - 1)]
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
                        max: ratingItem.rating.range,
                        interval: 1,
                        stepSize: 1,
                        showLabels: true,
                        value: ratingItem.rating.ratingDefault,
                        onChanged: (dynamic newValue) {
                          ratingItem.rating.ratingDefault = newValue;
                          /*
                          if (_healthWellnessController
                              .healthWellnessModel.value.items ==
                              null) {
                            _healthWellnessController
                                .healthWellnessModel.value.items = [];
                          }
                          Item item = Item(
                              tid: ratingItem.tid,
                              kind: ratingItem.kind,
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
