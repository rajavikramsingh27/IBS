import 'package:flutter/material.dart';
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/TrackableItemUtils.dart';
import 'package:flutter_ibs/widget/ScreenControls/RenderWidgetByType.dart';

class RenderItemChildrenWidget extends StatelessWidget {
  final TrackableItem trackableItem;
  final bool isFirst;
  final bool isLast;
  final bool isChild;
  final Function(TrackableSubmitItem) onValueChanged;
  final Function(TrackableItem) onValueRemoved;

  const RenderItemChildrenWidget({
    Key key,
    this.trackableItem,
    this.isFirst,
    this.isLast,
    this.isChild,
    this.onValueChanged,
    this.onValueRemoved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          top: 0,
          bottom: 0,
          child: Container(
            color: AppColors.colorYesButton,
          ),
        ),
        ListView.builder(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemCount: trackableItem.children.length,
            itemBuilder: (_, childCount) {
              bool doRender = _validateCondition(
                  trackableItem.children[childCount], trackableItem);
              if (!doRender) {
                return Offstage();
              }
              return ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: trackableItem.children[childCount].items.length,
                  itemBuilder: (_, count) {
                    return RenderWidgetByType().renderTrackableItem(
                        trackableItem.children[childCount].items[count],
                        isChild: true,
                        isFirst: false,
                        isLast: false,
                        onValueChanged: onValueChanged,
                        onValueRemoved: onValueRemoved);
                  });
            }),
      ],
    );
  }

  bool _validateCondition(TrackableChild child, TrackableItem parent) {
    var condition = child.condition;
    var parentValue = TrackableItemUtils().getItemValue(parent);

    bool isRendered = false;

    switch (condition.conditionOperator) {
      case "ALWAYS":
        isRendered = true;
        break;
      case "GT":
        isRendered = parentValue > child.condition.value;
        break;
      case "LT":
        isRendered = parentValue < child.condition.value;
        break;
      case "EQ":
        isRendered = parentValue == child.condition.value;
        break;
      default:
        print("_validateCondition unmatched, returning default true for: " +
            parent.tid);
        isRendered = true;
        break;
    }

    if (!isRendered){
      child.items.forEach((childItem) {
        childItem.reset();
      });
    }
    return isRendered;
  }

  _getTrackableItemValue(TrackableItem item) {}
}
