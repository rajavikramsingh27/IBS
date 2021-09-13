import 'package:flutter/material.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/DropDownList.dart';
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:get/get.dart';


class SelectWidget extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: Text(trackableItem.name.tr,
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
                  value: trackableItem.select.selectDefault.label != null
                      ? trackableItem.select.selectDefault
                      : trackableItem.select.options.first,
                  dropdownMenuItemList:
                  buildDropList(trackableItem.select.options),
                  onChanged: (SelectOption optionItem) {/*
                    trackableItem.select.selectDefault = optionItem;
                    _healthWellnessController.onSleepQualityTapped(
                        tid: trackableItem.tid,
                        kind: trackableItem.kind,
                        quality: optionItem.value);
                    _signUpController.healthWellness.refresh();
                  */},
                  isEnabled: true,
                ),
              ),
            )
          ],
        ),
        Container(
          height: ScreenConstant.sizeXL,
        ),
        Divider(thickness: 1, color: AppColors.white.withOpacity(0.12)),
        SizedBox(height: ScreenConstant.defaultHeightTwenty),
      ],
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
