

import 'package:flutter/material.dart';
import 'package:flutter_ibs/controllers/MyAccount/MyAccountController.dart';
import 'package:flutter_ibs/controllers/trackables/TrackablesController.dart';
import 'package:flutter_ibs/controllers/signup/SignUpController.dart';
import 'package:flutter_ibs/controllers/user/UserController.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/HexColor.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/CustomCheckBox.dart';
import 'package:flutter_ibs/widget/CustomExpansionTile.dart';
import 'package:flutter_ibs/widget/LeadingBackButton.dart';
import 'package:get/get.dart';
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:flutter_ibs/widget/CustomElevatedButton.dart';
import 'dart:convert';


class TrackingOptions extends StatelessWidget {
  // final _controller = Get.put(MyAccountController());
  final TrackablesController _trackablesController = Get.find();
  final UserController _userController = Get.find();


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
          "TRACKING OPTIONS",
          style: TextStyles.appBarTitle,
        ),
      ),

      body: GetBuilder<MyAccountController>(
          init: MyAccountController(),
          initState: (state) {
            // print('HomePageController state initialized');
          },

          builder: (authController) {
            //authController.getTrackList();
            return Obx(() =>
            false // _controller.loader.value
                ? Center(
              child: CircularProgressIndicator(),
            ) : Stack(
              children: [
                ListView(
                  // physics: ClampingScrollPhysics(),
                  padding: ScreenConstant.spacingAllLarge,
                  children: [
                    _buildTrackingOptions(),
                    _buildTrackingList(),
                    SizedBox(height: ScreenConstant.screenWidthThird / 4),
                    Container(
                        child: CustomElevatedButton2(
                          textColor: Colors.white,
                          buttonColor: AppColors.colorBackground,
                          widthFactor: 0.8,
                          text: "Save Changes",

                          onTap: () {
                            authController.updateTrackingOption();
                          },

                        )

                    ),

                  ],
                ),
              ],
            ));
          }
      ),
    );
  }

  _buildTrackingOptions() {
    return Container(
        padding: EdgeInsets.only(
          bottom: 20,
          top: 20,
          left: 40,
          right: 40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Your tracking options",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                fontFamily: 'Roboto-Regular',
                color: HexColor('4A358B'),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: ScreenConstant.sizeDefault),
            Text(
              "You may change your "
                  "tracking options at any time. Note that some of "
                  "the tracking options could be related to a treatment plan. "
                  "Changing the options could interfere with tracking for your treatment plan.",
              style: TextStyle(
                fontSize: 13,
                fontFamily: 'Roboto-Regular',
                // fontWeight: FontWeight.w400,
                color: HexColor('4A358B'),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        )
    );
  }

  _buildTrackingList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: _trackablesController.trackList.value.data?.length ?? 0,
      itemBuilder: (_, index) {
        var topLevelItem = _trackablesController.trackList.value.data[index];

        return Theme(
            data: Get.theme.copyWith(dividerColor: Colors.transparent),
            child: CustomExpansionTile(
                tilePadding: EdgeInsets.zero,
                onExpansionChanged: (isExpanding) {},
                initiallyExpanded: topLevelItem.enabledDefault,
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
                          _setEnabledStateOfChildrenForTrackable(
                              topLevelItem, topLevelItem);
                          _trackablesController.trackList.refresh();
                        },
                      ),
                      Text("${_trackablesController.trackList.value.data[index]
                          .name}".tr,
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
                              bottomRight: Radius.circular(16)
                          )
                      ),
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: _trackablesController
                              .trackList.value.data[index].items.length,
                          itemBuilder: (BuildContext context, int idx) {
                            return _renderSubItem(
                                topLevelItem.items[idx], topLevelItem);
                          })
                  ),
                ]
            )
        );
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
                    _trackablesController.trackList.refresh();
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
  _renderChildren(List<TrackableChild> children, TrackableItem parent,
      TrackableItem topLevelItem) {
    List<Widget> widgets = [];
    children.forEach((child) {
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

  _setEnabledStateOfChildrenForTrackable(TrackableItem item,
      TrackableItem topLevelItem) {
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
    if (item.enabled) {
      topLevelItem.enabled = true;
    }
  }
}

/*
class TrackingSendModel {
  TrackingSendModel({
    this.symptoms,
    this.bowelMovements,
    this.food,
    this.healthWellness,
    this.medications,
    this.journal,
  });

  List<TrackableItem> symptoms;
  List<TrackableItem> bowelMovements;
  List<TrackableItem> food;
  List<TrackableItem> healthWellness;
  List<TrackableItem> medications;
  List<TrackableItem> journal;

  factory TrackingSendModel.fromRawJson(String str) =>
      TrackingSendModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TrackingSendModel.fromJson(Map<String, dynamic> json) =>
      TrackingSendModel(
        symptoms: json["symptoms"] == null
            ? null
            : List<TrackableItem>.from(
            json["symptoms"].map((x) => TrackableItem.fromJson(x))),
        bowelMovements: json["bowelMovements"] == null
            ? null
            : List<TrackableItem>.from(json["bowelMovements"].map((x) => x)),
        food: json["foods"] == null
            ? null
            : List<TrackableItem>.from(json["foods"].map((x) => x)),
        healthWellness: json["healthWellness"] == null
            ? null
            : List<TrackableItem>.from(
            json["healthWellness"].map((x) => TrackableItem.fromJson(x))),
        medications: json["medications"] == null
            ? null
            : List<TrackableItem>.from(json["medications"].map((x) => x)),
        journal: json["journal"] == null
            ? null
            : List<TrackableItem>.from(json["journal"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
    "symptoms": symptoms == null
        ? []
        : List<dynamic>.from(symptoms.map((x) => x.toJson())),
    "bowelMovements": bowelMovements == null
        ? null
        : List<dynamic>.from(bowelMovements.map((x) => x.toJson())),
    "foods": food == null
        ? null
        : List<dynamic>.from(food.map((x) => x.toJson())),
    "healthWellness": healthWellness == null
        ? null
        : List<dynamic>.from(healthWellness.map((x) => x.toJson())),
    "medications": medications == null
        ? null
        : List<dynamic>.from(medications.map((x) => x.toJson())),
    "journal": journal == null
        ? null
        : List<dynamic>.from(journal.map((x) => x.toJson())),
  };
}
*/
