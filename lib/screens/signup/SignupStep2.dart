import 'package:flutter/material.dart';
import 'package:flutter_ibs/controllers/signup/SignUpController.dart';
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

  _buildTrackingList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: _controller.trackList.value.data?.length ?? 0,
      itemBuilder: (_, index) {
        var model = _controller.trackList.value.data[index];

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
                      value: _controller.trackList.value.data[index].enabled,
                      onChanged: (val) {
                        _controller.trackList.value.data[index].enabled =
                            !_controller.trackList.value.data[index].enabled;
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
                    itemCount:
                        _controller.trackList.value.data[index].items.length,
                    itemBuilder: (BuildContext context, int idx) {
                      var subModel =
                          _controller.trackList.value.data[index].items[idx];
                      return Visibility(
                        visible: _controller.trackList.value.data[index].items[idx].isVisible,
                        child: CustomExpansionTile(
                          tilePadding: EdgeInsets.zero,
                          onExpansionChanged: (isExpanding) {},
                          initiallyExpanded: true,
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CustomCheckBox(
                                /*value: model.enabled == false
                                    ? false
                                    : _controller.trackList.value.data[index]
                                        .items[idx].enabledDefault,*/
                                value: _controller.trackList.value.data[index].items[idx].enabledDefault,
                          onChanged: (val) {
                                  _controller.trackList.value.data[index]
                                          .items[idx].enabledDefault =
                                      !_controller.trackList.value.data[index]
                                          .items[idx].enabledDefault;
                                  _controller.trackList.refresh();
                                },
                              ),
                              Expanded(
                                child: InkWell(
                                    onTap: () {},
                                    child: Text(
                                      "${subModel.name}".tr,
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

                                      return Visibility(
                                        visible: subModel.isVisible ,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            CustomCheckBox(
                                              value: subModel.enabledDefault,/* ==
                                                          false ||
                                                      model.enabled == false
                                                  ? false
                                                  : subModelChild.enabledDefault ??
                                                      true,*/
                                              onChanged: (val) {
                                                subModelChild.enabledDefault =
                                                    !subModelChild.enabledDefault;
                                                _controller.trackList.refresh();
                                              },
                                            ),
                                            Expanded(
                                              child: InkWell(
                                                  onTap: () {},
                                                  child: Text(
                                                    "${subModelChild.name}".tr,
                                                    maxLines: 1,
                                                    textAlign: TextAlign.left,
                                                    overflow: TextOverflow.ellipsis,
                                                  )),
                                            )
                                          ],
                                        ),
                                      );
                                    })
                          ],
                        ),
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
