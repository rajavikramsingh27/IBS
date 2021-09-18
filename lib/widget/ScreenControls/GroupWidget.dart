import 'package:flutter/material.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:flutter_ibs/widget/ScreenControls/RenderWidgetByType.dart';
import 'package:get/get.dart';


class GroupWidget extends StatelessWidget {
  final TrackableItem trackableItem;
  final bool isFirst;
  final bool isLast;
  final bool isChild;
  final Function(TrackableSubmitItem) onValueChanged;

  const GroupWidget({
    //Key key,
    this.trackableItem,
    this.isFirst,
    this.isLast,
    this.isChild,
    this.onValueChanged,
  }) : super();

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
        Card(
          color: AppColors.colorBackground,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(isFirst ? 20 : 0),
                  topRight: Radius.circular(isFirst ? 20 : 0),
                  bottomLeft: Radius.circular(isLast ? 20 : 0),
                  bottomRight: Radius.circular(isLast ? 20 : 0))),
          margin: EdgeInsets.only(
            left: isChild ? 0 : ScreenConstant.defaultWidthTwenty,
            right: isChild ? 0 : ScreenConstant.defaultWidthTwenty,
          ),
          child: Padding(
            padding:
            (EdgeInsets.only(bottom: ScreenConstant.defaultHeightSixteen)),
            child: Column(
              children: [
                SizedBox(height: ScreenConstant.defaultHeightTwenty),
                Text(trackableItem.name.tr,
                    style: TextStyles.textStyleIntroDescription
                        .apply(color: Colors.white, fontSizeDelta: -3)),
                SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
                Text(
                  trackableItem.description.tr,
                  textAlign: TextAlign.center,
                  style: TextStyles.textStyleRegular
                      .apply(color: AppColors.colorSkipButton),
                ),
                SizedBox(height: ScreenConstant.defaultHeightTwenty),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenConstant.defaultWidthTwenty),
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemCount: trackableItem.children.first.items.length,
                      itemBuilder: (_, count) {
                        // TODO: This is only rendering the first child for now.
                        return RenderWidgetByType().renderTrackableItem(
                          trackableItem.children.first.items[count],
                          isChild: true,
                          onValueChanged: onValueChanged
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
