

import 'package:flutter/material.dart';
import 'package:flutter_ibs/controllers/TrackablesController.dart';
import 'package:flutter_ibs/controllers/signup/SignUpController.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/HexColor.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/CustomCheckBox.dart';
import 'package:flutter_ibs/widget/CustomExpansionTile.dart';
import 'package:flutter_ibs/widget/LeadingBackButton.dart';
import 'package:get/get.dart';


class TrackingOptions extends StatelessWidget {
  final _controller = Get.put(SignUpController());
  final TrackablesController _trackablesController = Get.find();

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
        body: Obx(() => _controller.loader.value
            ? Center(
          child: CircularProgressIndicator(),
        )
            : Stack(
          children: [
            ListView(
              // physics: ClampingScrollPhysics(),
              padding: ScreenConstant.spacingAllLarge,
              children: [
                _buildTrackingOptions(),
                _buildTrackingList(),
              ],
            ),

          ],
        )));
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
        ));

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

  _buildTrackingList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: _trackablesController.trackList.value.data?.length ?? 0,
      itemBuilder: (_, index) {
        var model = _trackablesController.trackList.value.data[index];
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
                      value: _trackablesController.trackList.value.data[index].enabled,
                      onChanged: (val) {
                        _trackablesController.trackList.value.data[index].enabled =
                        !_trackablesController.trackList.value.data[index].enabled;
                        _trackablesController.trackList.refresh();
                      },
                    ),
                    Text("${_trackablesController.trackList.value.data[index].tid}",
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
                    itemCount:
                    _trackablesController.trackList.value.data[index].items.length,
                    itemBuilder: (BuildContext context, int idx) {
                      var subModel =
                      _trackablesController.trackList.value.data[index].items[idx];
                      return CustomExpansionTile(
                        tilePadding: EdgeInsets.zero,
                        onExpansionChanged: (isExpanding) {},
                        initiallyExpanded: true,
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CustomCheckBox(
                              value: model.enabled == false
                                  ? false
                                  : _trackablesController.trackList.value.data[index]
                                  .items[idx].enabledDefault,
                              onChanged: (val) {
                                _trackablesController.trackList.value.data[index]
                                    .items[idx].enabledDefault =
                                !_trackablesController.trackList.value.data[index]
                                    .items[idx].enabledDefault;
                                _trackablesController.trackList.refresh();
                              },
                            ),
                            Expanded(
                              child: InkWell(
                                  onTap: () {},
                                  child: Text(
                                    "${subModel.tid}",
                                    style: TextStyles.textStyleRegular
                                        .apply(color: Colors.black),
                                    maxLines: 1,
                                    textAlign: TextAlign.left,
                                    overflow: TextOverflow.ellipsis,
                                  )),
                            )
                          ],
                        ),
                        children: [
                          subModel?.children?.isEmpty ?? true
                              ? Offstage()
                              : ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.only(
                                  left: ScreenConstant.sizeExtraLarge),
                              shrinkWrap: true,
                              itemCount:
                              subModel.children.last.items.length,
                              itemBuilder: (BuildContext context, int idx) {
                                var subModelChild =
                                subModel.children.last.items[idx];

                                return Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.start,
                                  children: [
                                    CustomCheckBox(
                                      value: subModel.enabledDefault ==
                                          false ||
                                          model.enabled == false
                                          ? false
                                          : subModelChild.enabledDefault ??
                                          true,
                                      onChanged: (val) {
                                        subModelChild.enabledDefault =
                                        !subModelChild.enabledDefault;
                                        _trackablesController.trackList.refresh();
                                      },
                                    ),
                                    Expanded(
                                      child: InkWell(
                                          onTap: () {},
                                          child: Text(
                                            "${subModelChild.tid}",
                                            maxLines: 1,
                                            textAlign: TextAlign.left,
                                            overflow: TextOverflow.ellipsis,
                                          )),
                                    )
                                  ],
                                );
                              })
                        ],
                      );
                    },
                  ),
                ),
              ]),
        );
      },
    );
  }
}
