import 'package:flutter/material.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/DropDownList.dart';
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:get/get.dart';

class SelectInlineWidget extends StatefulWidget {
  final TrackableItem trackableItem;
  final bool isFirst;
  final bool isLast;
  final bool isChild;
  final Function(TrackableSubmitItem) onValueChanged;

  const SelectInlineWidget({
    //Key key,
    this.trackableItem,
    this.isFirst,
    this.isLast,
    this.isChild,
    this.onValueChanged,
  }) : super();

  @override
  _SelectInlineWidgetState createState() => _SelectInlineWidgetState();
}

class _SelectInlineWidgetState extends State<SelectInlineWidget> {
  SelectOption _selectedOption;

  @override
  void initState() {
    _selectedOption = widget.trackableItem.select.selectDefault.label != null
        ? widget.trackableItem.select.selectDefault
        : widget.trackableItem.select.options.first;

    // As this is tracked, set its initial tracking state:
    widget.onValueChanged(TrackableSubmitItem(
      tid: widget.trackableItem.tid,
      category: widget.trackableItem.category,
      kind: widget.trackableItem.kind,
      dtype: "str",
      value: TrackableSubmitItemValue(str: _selectedOption.value),
    ));
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      color:  AppColors.colorBackground,
      child: Column(
        children: [
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
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  decoration: BoxDecoration(
                      color: AppColors.colordropdownArrowBg,
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: CustomDropdown<SelectOption>(
                    value: _selectedOption,
                    dropdownMenuItemList:
                    buildDropList(widget.trackableItem.select.options),
                    onChanged: (SelectOption optionItem) {
                      setState(() {
                        _selectedOption = optionItem;
                      });

                      widget.onValueChanged(TrackableSubmitItem(
                        tid: widget.trackableItem.tid,
                        category: widget.trackableItem.category,
                        kind: widget.trackableItem.kind,
                        dtype: "str",
                        value: TrackableSubmitItemValue(str: _selectedOption.value),
                      ));
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
    );
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
