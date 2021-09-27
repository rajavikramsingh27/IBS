import 'package:flutter/material.dart';
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:get/get.dart';

class TimePickerInlineWidget extends StatefulWidget {
  final TrackableItem trackableItem;
  final bool isFirst;
  final bool isLast;
  final bool isChild;
  final Function(TrackableSubmitItem) onValueChanged;
  final Function(TrackableItem)  onValueRemoved;

  const TimePickerInlineWidget({
    //Key key,
    this.trackableItem,
    this.isFirst,
    this.isLast,
    this.isChild,
    this.onValueChanged,
    this.onValueRemoved,
  }) : super();

  @override
  _TimePickerInlineWidgetState createState() => _TimePickerInlineWidgetState();
}

class _TimePickerInlineWidgetState extends State<TimePickerInlineWidget> {
  TimeOfDay selectedTime;

  @override
  void initState() {
    if (widget.trackableItem.timePicker != null){
      selectedTime = widget.trackableItem.timePicker;
    }else{
      selectedTime = TimeOfDay.now();
    }

    // As this is tracked, set its initial tracking state:
    widget.onValueChanged(TrackableSubmitItem(
      tid: widget.trackableItem.tid,
      category: widget.trackableItem.category,
      kind: widget.trackableItem.kind,
      dtype: "str",
      value: TrackableSubmitItemValue(
          str: selectedTime.hour.toString() +
              ":" +
              selectedTime.minute.toString()),
    ));
    super.initState();
  }



  @override
  void deactivate() {
    super.deactivate();
    widget.onValueRemoved(widget.trackableItem);
  }




  @override
  Widget build(BuildContext context) {
    /*List<TimeDisplay> timeList = [
      TimeDisplay(
          label:"00:00",
          value: "12:00 AM",
      ),
    ];*/
    // "02:00","03:00","04:00","05:00","06:00","07:00","08:00","09:00","10:00","11:00","12:00","13:00","14:00","15:00","16:00","17:00","18:00","19:00","20:00","21:00","22:00","23:00","24:00",];

    return Column(
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
                child: TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.black87,
                  ),
                  onPressed: () {
                    _selectTime(context);
                  },
                  child: Text(selectedTime.format(context)),
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

  _selectTime(BuildContext context) async {
    final TimeOfDay timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.input,
    );
    if (timeOfDay != null && timeOfDay != selectedTime) {
      setState(() {
        selectedTime = timeOfDay;
      });

      widget.onValueChanged(TrackableSubmitItem(
        tid: widget.trackableItem.tid,
        category: widget.trackableItem.category,
        kind: widget.trackableItem.kind,
        dtype: "str",
        value: TrackableSubmitItemValue(
            str: selectedTime.hour.toString() +
                ":" +
                selectedTime.minute.toString()),
      ));
    }
  }
}
