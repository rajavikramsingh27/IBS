import 'package:flutter/material.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:flutter_number_picker/flutter_number_picker.dart';

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


                    CustomNumberPicker(
                      valueTextStyle:
                          TextStyle(color: Colors.white, fontSize: 30),
                      shape: Border(top: BorderSide.none),
                      initialValue: _currentValue,
                      maxValue: 180,
                      minValue: 0,
                      step: 5,
                      onValue: (value) {
                        setState(() {
                          _currentValue = value;
                        });
                      },
                      customMinusButton: TextButton(
                        child: Text("-",
                            style:
                                TextStyle(fontSize: 30, color: Colors.white)),
                      ),
                      customAddButton: TextButton(
                        child: Text("+",
                            style:
                                TextStyle(fontSize: 30, color: Colors.white)),
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
