import 'package:flutter/material.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class SliderWidget extends StatelessWidget {
  final String title;
  final String description;
  final int max;
  final dynamic currentSelectedValue;

  final Function(dynamic) onChanged;

  const SliderWidget(
      {Key key,
      this.title,
      this.description,
      this.max,
      this.currentSelectedValue,
      this.onChanged})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: ScreenConstant.defaultWidthTwenty),
      child: Column(
        children: [
          SizedBox(height: ScreenConstant.defaultHeightForty),
          Text(title,
              style: TextStyles.textStyleIntroDescription
                  .apply(color: Colors.white, fontSizeDelta: -3)),
          SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
          Text(
            description,
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
                inactiveDividerColor: AppColors.colorInactiveDividerSlider,
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
                max: max,
                interval: 1,
                stepSize: 1,
                showLabels: true,
                value: currentSelectedValue,
                onChanged: onChanged,
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
        ],
      ),
    );
  }
}
