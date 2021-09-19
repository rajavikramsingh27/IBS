import 'package:flutter/material.dart';
import 'package:flutter_ibs/services/url.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/ScreenControls/RenderItemChildrenWidget.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class BristolScaleWidget extends StatefulWidget  {
  final TrackableItem trackableItem;
  final bool isFirst;
  final bool isLast;
  final bool isChild;
  final Function(TrackableSubmitItem) onValueChanged;

  const BristolScaleWidget({
    Key key,
    this.trackableItem,
    this.isFirst,
    this.isLast,
    this.isChild,
    this.onValueChanged,
  }) : super(key: key);


  @override
  _BristolScaleWidgetState createState() => _BristolScaleWidgetState();
}

class _BristolScaleWidgetState extends State<BristolScaleWidget> {

  double _currentValue; // this.trackableItem.rating.value.toDouble();

  @override
  void initState() {
    _currentValue = widget.trackableItem.rating.value.toDouble();
    // As this is tracked, set its initial tracking state:
    widget.onValueChanged(TrackableSubmitItem(
      tid: widget.trackableItem.tid,
      category: widget.trackableItem.category,
      kind: widget.trackableItem.kind,
      dtype: "num",
      value: TrackableSubmitItemValue(number: _currentValue),
    ));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: ScreenConstant.defaultWidthTen),
      child: Column(
        children: [
          Text(
            widget.trackableItem.name.tr,
            style: TextStyles.textStyleIntroDescription
                .apply(color: Colors.black, fontSizeDelta: -2),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: ScreenConstant.defaultHeightTwenty * 1.5),
          Center(
            child: Stack(
              children: [
                getImage(
                    item:  widget.trackableItem
                        .rating.options[ widget.trackableItem.rating.value.toInt() - 1]),
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
                        horizontal: ScreenConstant.sizeExtraSmall, vertical: 1),
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text("Type ${widget.trackableItem.rating.value.toInt()}",
                          textAlign: TextAlign.center,
                          style: TextStyles.textStyleIntroDescription
                              .apply(color: Colors.white, fontSizeDelta: -9)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: ScreenConstant.sizeMedium),
          getDesc(
              item: widget.trackableItem.rating.options[widget.trackableItem.rating.value.toInt() - 1]),
          SizedBox(height: ScreenConstant.sizeMedium),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: ScreenConstant.defaultWidthTen),
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
              child: SfSlider(
                showDividers: true,
                min: 1.0,
                max: widget.trackableItem.rating.range ?? 2,
                interval: 1,
                stepSize: 1,
                showLabels: true,
                labelFormatterCallback:
                    (dynamic actualValue, String formattedText) {
                  if (actualValue == 1.0) {
                    return "Type 1";
                  }
                  if (actualValue == widget.trackableItem.rating.range) {
                    return "Type ${widget.trackableItem.rating.range}";
                  }
                  return "";
                },
                value: widget.trackableItem.rating.value,
                onChanged: (dynamic newValue) {
                  setState(() {
                    _currentValue = newValue;
                    widget.trackableItem.rating.value = newValue;
                  });
                  //widget.trackableItem.rating.ratingDefault = newValue;
                  /*controller.initModel(
                      data: data,
                      dType: "num",
                      value: data.rating.ratingDefault);
                  _signUpController.bowelMovements.refresh();

                   */
                },
              ),
            ),
          ),
          SizedBox(height: ScreenConstant.defaultHeightForty),
        ],
      ),
    );
  }


  getImage({RatingOption item}) {
    Widget image = FadeInImage(
      width: ScreenConstant.defaultWidthOneHundredSeven,
      height: ScreenConstant.defaultHeightOneHundred,
      image: NetworkImage(item.image.normal),
      placeholder: NetworkImage(BLANK_PLACEHOLDER),
      imageErrorBuilder: (context, error, stackTrace) {
        return Image.network(BLANK_PLACEHOLDER,
            width: ScreenConstant.defaultWidthOneHundredSeven,
            height: ScreenConstant.defaultHeightOneHundred,
            fit: BoxFit.fitWidth);
      },
      fit: BoxFit.fitWidth,
    );
    return image;
  }

  getDesc({RatingOption item}) {
    return Text(item.description.tr ?? "",
        textAlign: TextAlign.center, style: TextStyles.textStyleRegular);
  }
}
