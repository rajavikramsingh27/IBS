import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:get/get.dart';

class NumberInputWidget extends StatefulWidget {
  final TrackableItem trackableItem;
  final bool isFirst;
  final bool isLast;
  final bool isChild;
  final Function(TrackableSubmitItem) onValueChanged;

  const NumberInputWidget({
    Key key,
    this.trackableItem,
    this.isFirst,
    this.isLast,
    this.isChild,
    this.onValueChanged,
  }) : super(key: key);

  @override
  _NumberInputWidgetState createState() => _NumberInputWidgetState();
}

class _NumberInputWidgetState extends State<NumberInputWidget> {
  int _currentValue; // this.trackableItem.rating.value.toDouble();

  @override
  void initState() {
    _currentValue = 0;
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
    return Stack(
      children: [
        Positioned.fill(
          top: widget.isFirst ? ScreenConstant.defaultHeightOneHundred : 0,
          child: Container(
            color: AppColors.colorYesButton,
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
                horizontal:
                    widget.isChild ? 0 : ScreenConstant.defaultWidthTwenty,
                vertical: 1),
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
                    widget.trackableItem.description.tr,
                    textAlign: TextAlign.center,
                    style: TextStyles.textStyleRegular
                        .apply(color: AppColors.colorSkipButton),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 90),
                  child: Card(
                    margin: ScreenConstant.spacingAllMedium,
                    shadowColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    child: TextFormField(
                        style: TextStyle(fontSize: 24),
                        textAlign: TextAlign.center,
                        cursorColor: Colors.white,
                        //controller: _controller,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        ],
                        decoration: InputDecoration(hintText: "0")),
                  ),
                ),
                SizedBox(
                    height: ScreenConstant.defaultHeightTwenty,
                    width:
                        800), // TODO: Fix this hack of forcing the width on children
                Visibility(
                    visible: !widget.isChild,
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
