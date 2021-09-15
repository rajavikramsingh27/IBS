import 'package:flutter/material.dart';
import 'package:flutter_ibs/controllers/treatment_plan/TreatmentPlanController.dart';
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/GridImageCommonWidget.dart.dart';
import 'package:flutter_ibs/widget/GridTextCommonWidget.dart';
import 'package:flutter_ibs/widget/RatingWidget.dart';
import 'package:get/get.dart';

import 'AdditionalNoteWidget.dart';
import 'DropDownList.dart';

class DynamicWidget extends StatefulWidget {
  final List<dynamic> data;

  DynamicWidget({
    this.data,
  });

  @override
  _DynamicWidgetState createState() => _DynamicWidgetState();
}

class _DynamicWidgetState extends State<DynamicWidget> {
  final TreatmentPlanController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      itemCount: widget.data.length,
      itemBuilder: (BuildContext context, int index) {
        switch (widget.data[index].kind) {
          case "textInput":
            {
              return AdditionalNoteWidget(
                bottomText: "",
                messageText: widget.data[index].name,
                hintText: "It's time to...",
              );
            }
            break;

          case "timePicker":
            {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(widget.data[index].name,
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
                          EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                      decoration: BoxDecoration(
                          color: AppColors.colordropdownArrowBg,
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: CustomDropdown<String>(
                        value: widget
                                    .data[index].timePicker.timePickerDefault ==
                                null
                            ? "01:00"
                            : widget.data[index].timePicker.timePickerDefault,
                        dropdownMenuItemList: buildTimeDropList([
                          "01:00",
                          "02:00",
                          "03:00",
                          "04:00",
                          "05:00",
                          "06:00",
                          "07:00",
                          "08:00",
                          "09:00",
                          "10:00",
                          "11:00",
                          "12:00",
                          "13:00",
                          "14:00",
                          "15:00",
                          "16:00",
                          "17:00",
                          "18:00",
                          "19:00",
                          "20:00",
                          "21:00",
                          "22:00",
                          "23:00",
                          "24:00",
                        ]),
                        onChanged: (optionItem) {
                          setState(() {
                            widget.data[index].timePicker.timePickerDefault =
                                optionItem;
                          });
                        },
                        isEnabled: true,
                      ),
                    ),
                  )
                ],
              );
            }
            break;
          case "select":
            {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(widget.data[index].name,
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
                          EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                      decoration: BoxDecoration(
                          color: AppColors.colordropdownArrowBg,
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: CustomDropdown<SelectOption>(
                        value: widget.data[index].select.selectDefault.label ==
                                null
                            ? widget.data[index].select.options.first
                            : widget.data[index].select.selectDefault,
                        dropdownMenuItemList:
                            buildDropList(widget.data[index].select.options),
                        onChanged: (optionItem) {
                          setState(() {
                            widget.data[index].select.selectDefault =
                                optionItem;
                          });
                        },
                        isEnabled: true,
                      ),
                    ),
                  )
                ],
              );
            }
            break;
          case "tags":
            {
              return GridTextCommonWidget(
                title: widget.data[index].name,
                description: widget.data[index].description,
                dataList: widget.data[index].tags,
              );
            }
            break;
          case "rating":
            {
              return RatingWidget(
                title: widget.data[index].name,
                description: widget.data[index].description,
                max: widget.data[index].rating.range,
                currentSelectedValue: widget.data[index].rating.ratingDefault,
                onChanged: (dynamic newValue) {
                  setState(() {
                    widget.data[index].rating.ratingDefault = newValue;
                  });
                },
              );
            }
            break;
          case "list":
            {
              return GridImageCommonWidget(
                title: widget.data[index].name,
                description: widget.data[index].description,
              );
            }
            break;

          default:
            {
              return Offstage();
            }
            break;
        }
      },
      separatorBuilder: (BuildContext context, int index) {
        return Container(
          height: ScreenConstant.sizeDefault,
        );
      },
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
