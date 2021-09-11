import 'package:flutter/material.dart';
import 'package:flutter_ibs/controllers/signup/SignUpController.dart';
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:flutter_ibs/routes/RouteConstants.dart';
import 'package:flutter_ibs/utils/Assets.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/BottomWidget.dart';
import 'package:flutter_ibs/widget/CustomCheckBox.dart';
import 'package:flutter_ibs/widget/CustomExpansionTile.dart';
import 'package:flutter_ibs/widget/LeadingBackButton.dart';
import 'package:get/get.dart';

class SignupStep2 extends StatelessWidget {
  final _controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.colorMyProfileBackground,
        appBar: AppBar(
          elevation: 0,
          leading: LeadingBackButton(
            onPressed: () => Get.back(),
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "MY PROFILE",
            style: TextStyles.appBarTitle,
          ),
        ),
        // bottomNavigationBar: Container(
        //   padding: ScreenConstant.spacingAllLarge,
        //   color: Colors.white,
        //   child: CustomElevatedButton(
        //     widthFactor: 0.8,
        //     text: "Track Selected Options",
        //     onTap: () {
        //       Get.toNamed(signup3);
        //     },
        //   ),
        // ),
        body: Obx(() => _controller.loader.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Stack(
                children: [
                  ListView(
                    physics: ClampingScrollPhysics(),
                    padding: ScreenConstant.spacingAllLarge,
                    children: [
                      _buildTrackingOptions(),
                      _buildTrackingList(),
                      SizedBox(height: ScreenConstant.defaultHeightSixteen),
                      SizedBox(height: ScreenConstant.defaultHeightOneHundred)
                    ],
                  ),
                  BottomWidget(
                      onContinueTap: () => Get.toNamed(signup3),
                      onCircleTap: () => Get.toNamed(signup3))
                ],
              )));
  }

  /// Builds the Graphic Title Block
  _buildTrackingOptions() {
    return Stack(
      children: [
        AspectRatio(aspectRatio: 1.6, child: Image.asset(Assets.signupBg2)),
        Positioned(
            bottom: ScreenConstant.defaultHeightTwentyFour,
            left: ScreenConstant.sizeXXXL,
            right: ScreenConstant.sizeXXXL,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Set your tracking options",
                  style: TextStyles.textStyleIntroDescription
                      .apply(color: Colors.white, fontSizeDelta: -3),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: ScreenConstant.sizeDefault),
                Text(
                  "Default tracking options are selected below. These can be changed later in settings.",
                  style: TextStyles.textStyleRegular
                      .apply(color: Colors.white, fontSizeDelta: -1),
                  textAlign: TextAlign.center,
                ),
              ],
            ))
      ],
    );

    // Column(
    //   children: [
    //     SizedBox(height: ScreenConstant.defaultHeightTwenty),
    //     HeaderCard(
    //       height: ScreenConstant.defaultHeightTwoHundred,
    //       imageText: Assets.book,
    //       title: "Tracking Options",
    //       description: "These can be changed later in settings.",
    //     ),
    //     SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
    //   ],
    // );
  }

  /// Builds the list of all trackables.
  /// Creates the top-level category toggle widgets
  /// Calls supporting functions to build the nested set of children.
  /// The nested functions, _renderSubItem and _renderChildren
  /// get called recursively to walk down the tree.
  _buildTrackingList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: _controller.trackList.value.data?.length ?? 0,
      itemBuilder: (_, index) {
        var topLevelItem = _controller.trackList.value.data[index];

        return Theme(
            data: Get.theme.copyWith(dividerColor: Colors.transparent),
            child: CustomExpansionTile(
                tilePadding: EdgeInsets.zero,
                onExpansionChanged: (isExpanding) {},
                initiallyExpanded: true,
                title: Container(
                  decoration: BoxDecoration(
                      color: AppColors.colorBackground,
                      borderRadius: BorderRadius.circular(16)),
                  child: Row(
                    children: [
                      CustomCheckBox(
                        checkedFillColor: AppColors.colorYesButton,
                        value: topLevelItem.enabled,
                        onChanged: (val) {
                          topLevelItem.enabled = !topLevelItem.enabled;
                          _setEnabledStateOfChildrenForTrackable(topLevelItem, topLevelItem);
                          _controller.trackList.refresh();
                        },
                      ),
                      Text("${_controller.trackList.value.data[index].name}".tr,
                          style: TextStyles.textStyleIntroDescription
                              .apply(color: Colors.white, fontSizeDelta: -3)),
                      Spacer(),
                      Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: Colors.white,
                      ),
                      SizedBox(width: ScreenConstant.defaultWidthTwenty)
                    ],
                  ),
                ),
                children: [
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[50],
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(16),
                              bottomRight: Radius.circular(16))),
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: _controller
                              .trackList.value.data[index].items.length,
                          itemBuilder: (BuildContext context, int idx) {
                            return _renderSubItem(topLevelItem.items[idx], topLevelItem);
                          })),
                ]));
      },
    );
  }

  /// Renders a specific TrackableItem
  /// This items children will be passed to
  /// _renderChildren for rendering.
  _renderSubItem(TrackableItem item, TrackableItem topLevelItem) {
    return Visibility(
        visible: item.isVisible,
        child: CustomExpansionTile(
            tilePadding: EdgeInsets.zero,
            onExpansionChanged: (isExpanding) {},
            initiallyExpanded: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomCheckBox(
                  value: item.enabled,
                  onChanged: (val) {
                    item.enabled = !item.enabled;
                    _setEnabledStateOfChildrenForTrackable(item, topLevelItem);
                    _controller.trackList.refresh();
                  },
                ),
                Expanded(
                  child: InkWell(
                      onTap: () {},
                      child: Text(
                        "${item.name}".tr,
                        style: TextStyles.textStyleRegular
                            .apply(color: Colors.black),
                        maxLines: 1,
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                      )),
                )
              ],
            ),
            children: _renderChildren(item.children, item, topLevelItem)
        )
    );
  }

  /// Iterates over a list of TrackableChild objects
  /// passing the child.items back to _renderSubItem
  /// (which may in tern call _renderChildren on those
  /// items to walk down the tree)
  _renderChildren(List<TrackableChild> children, TrackableItem parent, TrackableItem topLevelItem) {
    List<Widget> widgets = [];
    children.forEach( (child) {
      var listView = (
          IgnorePointer(
            ignoring: !parent.enabled,
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.only(
                  left: ScreenConstant.sizeExtraLarge),
              itemCount:
              child.items.length,
              itemBuilder: (BuildContext context, int idx) {
               // print ("Rendering child item: " + child.items[idx].tid + ", " + child.items[idx].isVisible.toString());
                return _renderSubItem(child.items[idx], topLevelItem);
              }
            )
          )
      );
      widgets.add(listView);
    });
    return widgets;
  }



  _setEnabledStateOfChildrenForTrackable(TrackableItem item, TrackableItem topLevelItem){
    // Set children:
    // Top level have item.items, which was bad data modelling, we can work around:
    item.items.forEach((nestedItem) {
      nestedItem.enabled = item.enabled;
      return _setEnabledStateOfChildrenForTrackable(nestedItem, topLevelItem);
    });

    item.children.forEach((child) {
      child.items.forEach((childItem) {
        childItem.enabled = item.enabled;
        return _setEnabledStateOfChildrenForTrackable(childItem, topLevelItem);
      });
    });

    // A child of a top level should always turn on the top level
    if (item.enabled){
      topLevelItem.enabled = true;
    }
  }

}
