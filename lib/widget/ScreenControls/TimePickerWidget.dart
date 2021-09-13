import 'package:flutter/material.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/DropDownList.dart';
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:get/get.dart';


class TimePickerWidget extends StatelessWidget {
  final TrackableItem trackableItem;
  final bool isFirst;
  final bool isLast;
  final bool isChild;


  const TimePickerWidget({
    //Key key,
    this.trackableItem,
    this.isFirst,
    this.isLast,
    this.isChild,
  }) : super();

  @override
  Widget build(BuildContext context) {
    List<String> timeList = ["01:00","02:00","03:00","04:00","05:00","06:00","07:00","08:00","09:00","10:00","11:00","12:00","13:00","14:00","15:00","16:00","17:00","18:00","19:00","20:00","21:00","22:00","23:00","24:00",];

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
                child: CustomDropdown(
                  value: "01:00",
                  /*timeItem.selectedValue == null
                      ? _healthWellnessController.selectedTime.value
                      : timeItem.selectedValue,*/
                  dropdownMenuItemList:
                  buildTimeDropList(timeList),
                  onChanged: (optionItem) {
                    trackableItem.selectedValue = optionItem;
                    /*
                    _healthWellnessController.onBedTimeTapped(
                        kind: trackableItem.kind,
                        tid: trackableItem.tid,
                        selectedTime: optionItem);
                    _signUpController.healthWellness.refresh();
                    */
                  },
                  isEnabled: true,
                ),
              ),
            )
          ],
        ),
        Container(
          height: ScreenConstant.sizeMedium,
        ),
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
