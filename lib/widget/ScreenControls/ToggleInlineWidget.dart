import 'package:flutter/material.dart';
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/CustomSwitch.dart';
import 'package:flutter_ibs/widget/ScreenControls/RenderItemChildrenWidget.dart';
import 'package:get/get.dart';

class ToggleInlineWidget extends StatefulWidget {
  final TrackableItem trackableItem;
  final bool isFirst;
  final bool isLast;
  final bool isChild;
  final Function(TrackableSubmitItem) onValueChanged;
  final Function(TrackableItem)  onValueRemoved;

  const ToggleInlineWidget({
    Key key,
    this.trackableItem,
    this.isFirst,
    this.isLast,
    this.isChild,
    this.onValueChanged,
    this.onValueRemoved,
  }) : super(key: key);

  @override
  _ToggleInlineWidgetState createState() => _ToggleInlineWidgetState();
}

class _ToggleInlineWidgetState extends State<ToggleInlineWidget> {

  @override
  void initState() {
    //_currentValue = widget.trackableItem.ToggleInline.value.toDouble();
    super.initState();
  }



  @override
  void deactivate() {
    super.deactivate();
    widget.onValueRemoved(widget.trackableItem);
  }



  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          top: widget.isFirst ? ScreenConstant.defaultHeightOneHundred : 0,
          child: Container(
            color: AppColors.colorBackground,
          ),
        ),
        Card(
          color: AppColors.nestedToggle,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          margin: EdgeInsets.only(
            // left:  ScreenConstant.defaultWidthTen,
            //  right: ScreenConstant.defaultWidthTen,
            bottom: ScreenConstant.defaultHeightTwenty,
          ),
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: ScreenConstant.defaultWidthTwenty),
            child: Column(
              children: [
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Text(widget.trackableItem.name.tr,
                          style: TextStyles.textStyleIntroDescription
                              .apply(color: Colors.black, fontSizeDelta: -5)),
                    ),
                    Expanded(
                        flex: 1,
                        child: CustomSwitch(
                          value: widget.trackableItem.toggle.value,
                          onChanged: onToggleChanged,
                        ))
                  ],
                ),
                RenderItemChildrenWidget(
                  trackableItem: widget.trackableItem,
                  isChild: true,
                  isFirst: false,
                  isLast: false,
                  onValueChanged: widget.onValueChanged,
                  onValueRemoved: widget.onValueRemoved,
                ),
                SizedBox(
                    height: ScreenConstant.defaultHeightTwenty, width: 800),
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

  onToggleChanged(bool val) {
    widget.trackableItem.toggle.value = val;

    widget.onValueChanged(TrackableSubmitItem(
      tid: widget.trackableItem.tid,
      category: widget.trackableItem.category,
      kind: widget.trackableItem.kind,
      dtype: "bool",
      value: TrackableSubmitItemValue(boolean: val),
    ));
  }
}
