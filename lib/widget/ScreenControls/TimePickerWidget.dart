import 'package:flutter/material.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/DropDownList.dart';
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:get/get.dart';

class TimeDisplay {
  TimeDisplay({
    this.label,
    this.value,
  });

  String label;
  String value;
}


class TimePickerWidget extends StatefulWidget {
  final TrackableItem trackableItem;
  final bool isFirst;
  final bool isLast;
  final bool isChild;
  final Function(TrackableSubmitItem) onValueChanged;

  const TimePickerWidget({
    //Key key,
    this.trackableItem,
    this.isFirst,
    this.isLast,
    this.isChild,
    this.onValueChanged,
  }) : super();


  @override
  _TimePickerWidgetState createState() => _TimePickerWidgetState();
}

class _TimePickerWidgetState extends State<TimePickerWidget> {

  TimeOfDay _selectedTime;

  @override
  void initState() {
    _selectedTime = TimeOfDay.now();
    super.initState();
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
                  child: Text(_selectedTime.format(context)),

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
      initialTime: _selectedTime,
      initialEntryMode: TimePickerEntryMode.dial,

    );
    if(timeOfDay != null && timeOfDay != _selectedTime)
    {
      setState(() {
        _selectedTime = timeOfDay;
      });
    }
  }
}
