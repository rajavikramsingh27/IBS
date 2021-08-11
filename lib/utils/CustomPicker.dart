import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ibs/utils/DummyData.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';

class CustomPicker extends StatefulWidget {
  @override
  _CustomPickerState createState() => _CustomPickerState();
}

class _CustomPickerState extends State<CustomPicker> {
  String selectedDropdownValue;

  @override
  Widget build(BuildContext context) {
    return getPicker();
  }

  Widget getPicker() {
    return Platform.isIOS ? iosPicker() : androidDropdown();
  }

  DropdownButton<String> androidDropdown() {
    List<DropdownMenuItem> dropDownitems = [];
    for (var i = 0; i < DummyData.symptomsList.length; i++) {
      TrackingOptionsModel value = DummyData.symptomsList[i];
      var newItem = DropdownMenuItem(
        child: Text("$value"),
        value: value,
      );
      dropDownitems.add(newItem);
    }

    return DropdownButton<String>(
      value: selectedDropdownValue,
      items: dropDownitems as List<DropdownMenuItem<String>>,
      onChanged: (val) {
        selectedDropdownValue = val;
      },
    );
  }

  CupertinoPicker iosPicker() {
    List<Text> pickerItems = [];
    for (var items in DummyData.symptomsList) {
      pickerItems.add(Text("$items"));
    }

    return CupertinoPicker(
        itemExtent: ScreenConstant.defaultHeightForty,
        onSelectedItemChanged: (val) {},
        children: pickerItems);
  }
}
