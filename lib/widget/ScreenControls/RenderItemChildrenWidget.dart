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

  const RenderItemChildrenWidget({
    Key key,
    this.trackableItem,
    this.isFirst,
    this.isLast,
    this.isChild,
    this.onValueChanged,
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
                        onValueChanged: onValueChanged);
                  });
            }),
      ],
    );
  }

  bool _validateCondition(TrackableChild child, TrackableItem parent) {
    var condition = child.condition;
    var parentValue = TrackableItemUtils().getItemValue(parent);

    switch (condition.conditionOperator) {
      case "ALWAYS":
        return true;
      case "GT":
        return parentValue > child.condition.value;
      case "LT":
        return parentValue < child.condition.value;
      case "EQ":
        return parentValue == child.condition.value;
    }
    print("_validateCondition unmatched, returning default true for: " +
        parent.tid);
    return true;
  }

  _getTrackableItemValue(TrackableItem item) {}
}
