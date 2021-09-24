import 'package:flutter/material.dart';
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/DropDownList.dart';
import 'package:get/get.dart';

class SelectWidget extends StatefulWidget {
  final TrackableItem trackableItem;
  final bool isFirst;
  final bool isLast;
  final bool isChild;
  final Function(TrackableSubmitItem) onValueChanged;

  const SelectWidget({
    //Key key,
    this.trackableItem,
    this.isFirst,
    this.isLast,
    this.isChild,
    this.onValueChanged,
  }) : super();

  @override
  _SelectWidgetState createState() => _SelectWidgetState();
}

class _SelectWidgetState extends State<SelectWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
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
                  child: Text(
                    //trackableItem.description.tr,
                    widget.trackableItem.description.tr,
                    textAlign: TextAlign.center,
                    style: TextStyles.textStyleRegular
                        .apply(color: AppColors.colorSkipButton),
                  ),
                ),
                SizedBox(height: ScreenConstant.defaultHeightTwenty),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(widget.trackableItem.name.tr,
                          style: TextStyles.textStyleIntroDescription
                              .apply(color: Colors.white, fontSizeDelta: -6)),
                    ),
                    Container(
                      width: ScreenConstant.sizeSmall,
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                        decoration: BoxDecoration(
                            color: AppColors.colordropdownArrowBg,
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: CustomDropdown<SelectOption>(
                          value:
                              widget.trackableItem.select.selectDefault.label !=
                                      null
                                  ? widget.trackableItem.select.selectDefault
                                  : widget.trackableItem.select.options.first,
                          dropdownMenuItemList: buildDropList(
                              widget.trackableItem.select.options),
                          onChanged: (SelectOption optionItem) {
                            setState(() {
                              widget.trackableItem.select.selectDefault =
                                  optionItem;
                            });
                          },
                          isEnabled: true,
                        ),
                      ),
                    )
                  ],
                ),
                Visibility(
                  visible: !widget.isChild,
                  child: Container(
                    height: ScreenConstant.sizeXL,
                  ),
                ),
                Visibility(
                    visible: !widget.isChild,
                    child: Divider(
                        thickness: 1,
                        color: AppColors.white.withOpacity(0.12))),
                SizedBox(height: ScreenConstant.defaultHeightTwenty),
              ],
            ),
          ))
    ]);
  }

  List<DropdownMenuItem<SelectOption>> buildDropList(
      List favouriteFoodModelList) {
    List<DropdownMenuItem<SelectOption>> items = [];
    for (SelectOption favouriteFoodModel in favouriteFoodModelList) {
      items.add(DropdownMenuItem(
        value: favouriteFoodModel,
        child: Text(
          favouriteFoodModel.label.tr,
          overflow: TextOverflow.ellipsis,
        ),
      ));
    }
    return items;
  }

  List<DropdownMenuItem<String>> buildTimeDropList(
      List favouriteFoodModelList) {
    List<DropdownMenuItem<String>> items = [];
    for (String favouriteFoodModel in favouriteFoodModelList) {
      items.add(DropdownMenuItem(
        value: favouriteFoodModel,
        child: Text(favouriteFoodModel.tr),
      ));
    }
    return items;
  }
}
