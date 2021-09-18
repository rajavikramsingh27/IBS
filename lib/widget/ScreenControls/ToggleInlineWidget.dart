import 'package:flutter/material.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/ScreenControls/RenderItemChildrenWidget.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class ToggleInlineWidget extends StatefulWidget  {
  final TrackableItem trackableItem;
  final bool isFirst;
  final bool isLast;
  final bool isChild;
  final Function(TrackableSubmitItem) onValueChanged;

  const ToggleInlineWidget({
    Key key,
    this.trackableItem,
    this.isFirst,
    this.isLast,
    this.isChild,
    this.onValueChanged,
  }) : super(key: key);


  @override
  _ToggleInlineWidgetState createState() => _ToggleInlineWidgetState();
}

class _ToggleInlineWidgetState extends State<ToggleInlineWidget> {

  double _currentValue; // this.trackableItem.ToggleInline.value.toDouble();

  @override
  void initState() {
    //_currentValue = widget.trackableItem.ToggleInline.value.toDouble();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        Positioned.fill(
          top: widget.isFirst ? ScreenConstant.defaultHeightOneHundred : 0,
          child: Container(
            color: AppColors.shadow,
          ),
        ),
        Card(
          color: AppColors.colorBackground,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(widget.isFirst ? 20 : 0),
                  topRight: Radius.circular(widget.isFirst ? 20 : 0),
                  bottomLeft: Radius.circular(widget.isLast ? 20 : 0),
                  bottomRight: Radius.circular(widget.isLast ? 20 : 0))),
          margin: EdgeInsets.only(
            left: widget.isChild ? 0 : ScreenConstant.defaultWidthTwenty,
            right: widget.isChild ? 0 : ScreenConstant.defaultWidthTwenty,
          ),
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: widget.isChild ? 0 : ScreenConstant.defaultWidthTwenty, vertical: 1),
            child: Column(
              children: [
                SizedBox(height: ScreenConstant.defaultHeightTwenty),
                Text(widget.trackableItem.name.tr,
                    style: TextStyles.textStyleIntroDescription
                        .apply(color: Colors.white, fontSizeDelta: -3)),
                SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
                SizedBox(
                  height: 34,
                  child: Text(
                    //trackableItem.description.tr,
                    widget.trackableItem
                        .toggle.options.optionsTrue
                        .label
                        .tr,
                    textAlign: TextAlign.center,
                    style: TextStyles.textStyleRegular
                        .apply(color: AppColors.colorSkipButton),
                  ),
                ),
                SizedBox(height: ScreenConstant.defaultHeightTwenty),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenConstant.defaultWidthTen),
                  child: Text("Hello there")
                ),
                RenderItemChildrenWidget(
                  trackableItem: widget.trackableItem,
                  isChild: true,
                  isFirst: false,
                  isLast: false,
                  onValueChanged: widget.onValueChanged,
                ),
                SizedBox(height: ScreenConstant.defaultHeightTwenty,
                    width: 800),
                Visibility(
                    visible: !widget.isChild && !widget.isLast,
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
