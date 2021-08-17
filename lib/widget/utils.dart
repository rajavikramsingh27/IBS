import 'package:flutter/material.dart';

dismissKeyboard(BuildContext context) {
  FocusScopeNode currentFocus = FocusScope.of(context);

  if (!currentFocus.hasPrimaryFocus) {
    currentFocus.unfocus();
  }
}



// Widget getPicker() {
//     return Platform.isIOS ? iosPicker() : androidDropdown();
//   }

//   DropdownButton<String> androidDropdown() {
//     List<DropdownMenuItem<String>> dropDownitems = [];
//     for (var items in _controller.ageList) {
//       // TrackingOptionsModel value = DummyData.symptomsList[i];
//       var newItem = DropdownMenuItem(
//         child: Text("$items"),
//         value: items,
//       );
//       dropDownitems.add(newItem);
//     }

//     return DropdownButton<String>(
//       value: _controller.selectedAge.value,
//       items: dropDownitems,
//       onChanged: (val) {
//         _controller.selectedAge.value = val;
//       },
//     );
//   }

//   CupertinoPicker iosPicker() {
//     List<Text> pickerItems = [];
//     for (var items in _controller.ageList) {
//       pickerItems.add(Text("$items"));
//     }

//     return CupertinoPicker(
//         itemExtent: ScreenConstant.defaultHeightForty,
//         onSelectedItemChanged: (val) {
//           _controller.selectedAge.value = val as String;
//         },
//         children: pickerItems);
//   }
