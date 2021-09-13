import 'package:flutter_ibs/widget/ScreenControls/FixedTagListWidget.dart';
import 'package:flutter_ibs/widget/ScreenControls/GroupWidget.dart';
import 'package:flutter_ibs/widget/ScreenControls/ListWidget.dart';
import 'package:flutter_ibs/widget/ScreenControls/RatingWidget.dart';
import 'package:flutter_ibs/widget/ScreenControls/SelectWidget.dart';
import 'package:flutter_ibs/widget/ScreenControls/TextInputWidget.dart';
import 'package:flutter_ibs/widget/ScreenControls/TimePickerWidget.dart';
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:flutter/material.dart';

class RenderWidgetByType {
  renderTrackableItem(TrackableItem widget,
      {bool isFirst = false, bool isLast = false, bool isChild = false,
        Function(TrackableSubmitItem) onValueChanged
      }) {
    switch (widget.kind) {
      case "rating":
        {
          //return _renderRatingWidget(widget,
          //    isFirst: isFirst, isLast: isLast, isChild: isChild);
          return RatingWidget(
              trackableItem: widget,
              onValueChanged: onValueChanged,
              isFirst: isFirst,
              isLast: isLast,
              isChild: isChild);
        }
        break;
      case "list":
        {
          return ListWidget(
              trackableItem: widget,
              onValueChanged: onValueChanged,
              isFirst: isFirst,
              isLast: isLast,
              isChild: isChild
          );
        }
        break;
      case "tags":
        {
          return FixedTagListWidget(
              trackableItem: widget,
              isFirst: isFirst,
              isLast: isLast,
              isChild: isChild
          );
        }
        break;
      case "group":
        {
          return GroupWidget(
              trackableItem: widget,
              isFirst: isFirst,
              isLast: isLast,
              isChild: isChild
          );

        }
        break;
      case "select":
        {
          return SelectWidget(
              trackableItem: widget,
              isFirst: isFirst,
              isLast: isLast,
              isChild: isChild
          );
        }
        break;
      case "textInput":
        {
          return TextInputWidget(
              trackableItem: widget,
              isFirst: isFirst,
              isLast: isLast,
              isChild: isChild
          );
        }
        break;
      case "timePicker":
        {
          return TimePickerWidget(
              trackableItem: widget,
              isFirst: isFirst,
              isLast: isLast,
              isChild: isChild
          );
        }
      default:
        {
          return Offstage();
        }
        break;
    }
  }

}
