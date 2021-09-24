import 'package:flutter_ibs/widget/ScreenControls/BristolScaleWidget.dart';
import 'package:flutter_ibs/widget/ScreenControls/ColorPickerWidget.dart';
import 'package:flutter_ibs/widget/ScreenControls/FixedTagListWidget.dart';
import 'package:flutter_ibs/widget/ScreenControls/GroupWidget.dart';
import 'package:flutter_ibs/widget/ScreenControls/ListWidget.dart';
import 'package:flutter_ibs/widget/ScreenControls/NumberInputWidget.dart';
import 'package:flutter_ibs/widget/ScreenControls/RatingWidget.dart';
import 'package:flutter_ibs/widget/ScreenControls/SelectInlineWidget.dart';
import 'package:flutter_ibs/widget/ScreenControls/SelectWidget.dart';
import 'package:flutter_ibs/widget/ScreenControls/TextInputWidget.dart';
import 'package:flutter_ibs/widget/ScreenControls/TimePickerInlineWidget.dart';
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ibs/widget/ScreenControls/ToggleInlineWidget.dart';

class RenderWidgetByType {
  renderTrackableItem(TrackableItem trackableItem,
      {bool isFirst = false, bool isLast = false, bool isChild = false,
        Function(TrackableSubmitItem) onValueChanged
      }) {
    switch (trackableItem.kind) {
      case "rating":
        {
          //return _renderRatingWidget(widget,
          //    isFirst: isFirst, isLast: isLast, isChild: isChild);
          return RatingWidget(
              trackableItem: trackableItem,
              onValueChanged: onValueChanged,
              isFirst: isFirst,
              isLast: isLast,
              isChild: isChild);
        }
        break;
      case "list":
        {
          return ListWidget(
              trackableItem: trackableItem,
              onValueChanged: onValueChanged,
              isFirst: isFirst,
              isLast: isLast,
              isChild: isChild
          );
        }
        break;
      case "tags":
        {
          if (trackableItem.tags.userAddable == false) {
            return FixedTagListWidget(
                trackableItem: trackableItem,
                onValueChanged: onValueChanged,
                isFirst: isFirst,
                isLast: isLast,
                isChild: isChild
            );
          }else{
            return FixedTagListWidget(
                trackableItem: trackableItem,
                onValueChanged: onValueChanged,
                isFirst: isFirst,
                isLast: isLast,
                isChild: isChild
            );
          }
        }
        break;
      case "group":
        {
          return GroupWidget(
              trackableItem: trackableItem,
              onValueChanged: onValueChanged,
              isFirst: isFirst,
              isLast: isLast,
              isChild: isChild
          );

        }
        break;
      case "select":
        {
          return SelectWidget(
              trackableItem: trackableItem,
              isFirst: isFirst,
              isLast: isLast,
              isChild: isChild
          );
        }
        break;
      case "selectInline":
        {
          return SelectInlineWidget(
              trackableItem: trackableItem,
              isFirst: isFirst,
              isLast: isLast,
              isChild: isChild
          );
        }
        break;
      case "textInput":
        {
          return TextInputWidget(
              trackableItem: trackableItem,
              isFirst: isFirst,
              isLast: isLast,
              isChild: isChild
          );
        }
        break;
      case "timePickerInline":
        {
          return TimePickerInlineWidget(
              trackableItem: trackableItem,
              onValueChanged: onValueChanged,
              isFirst: isFirst,
              isLast: isLast,
              isChild: isChild
          );
        }
      case "numberInput":
        {
          return NumberInputWidget(
              trackableItem: trackableItem,
              onValueChanged: onValueChanged,
              isFirst: isFirst,
              isLast: isLast,
              isChild: isChild
          );
        }
      case "toggleInline":
        {
          return ToggleInlineWidget(
              trackableItem: trackableItem,
              onValueChanged: onValueChanged,
              isFirst: isFirst,
              isLast: isLast,
              isChild: isChild
          );
        }
      case "bristolScale":
        {
          return BristolScaleWidget(
              trackableItem: trackableItem,
              onValueChanged: onValueChanged,
              isFirst: isFirst,
              isLast: isLast,
              isChild: isChild
          );
        }
      case "color":
        {
          return ColorPickerWidget(
              trackableItem: trackableItem,
              onValueChanged: onValueChanged,
              isFirst: isFirst,
              isLast: isLast,
              isChild: isChild
          );
        }
      default:
        {
          print("Getting offstage: " + trackableItem.kind);
          return Offstage();
        }
        break;
    }
  }

}
