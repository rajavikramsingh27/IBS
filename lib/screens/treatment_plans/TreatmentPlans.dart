import 'package:flutter/material.dart';
import 'package:flutter_ibs/controllers/treatment_plan/TreatmentPlanController.dart';
import 'package:flutter_ibs/utils/Assets.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/CustomBottomNavigation.dart';
import 'package:flutter_ibs/widget/LeadingBackButton.dart';
import 'package:flutter_ibs/widget/TreatmentPlanListItem.dart';
import 'package:get/get.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';

class TreatmentPlans extends StatefulWidget {
  @override
  State<TreatmentPlans> createState() => _TreatmentPlansState();
}

class _TreatmentPlansState extends State<TreatmentPlans> {
  final arrTreatmentPlansText = [
    '''There is no cure for IBS but several treatments exist to help you manage your symptoms.''',
    '''Discuss your treatment options with your Health Care Provider before starting any plan.''',
    '''Begin new treatment plans one at a time to understand their impact on your symptoms.''',
    '''Try each treatment plan for a full 3 weeks before stopping it or adding another.'''
  ];

  final TreatmentPlanController _treatmentPlanController =
      Get.put(TreatmentPlanController());

  final _pageController = PageController();

  final _currentPageNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorTracBg,
      appBar: AppBar(
        elevation: 0,
        leading: LeadingBackButton(
          onPressed: () => Get.back(),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "TREATMENT PLANS",
          style: TextStyles.appBarTitle,
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: ScreenConstant.defaultWidthTwenty),
              child: Image.asset(
                Assets.settings,
                width: ScreenConstant.defaultWidthTwenty,
              ),
            ),
          )
        ],
      ),
      body: Obx(() => _treatmentPlanController.loader.value
          ? Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                ListView(
                  padding: ScreenConstant.spacingAllMedium,
                  physics: ClampingScrollPhysics(),
                  children: [
                    _buildPageViewBuilder(),
                    _buildCircleIndicator(),
                    SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemCount: _treatmentPlanController.listCategory.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _treatmentPlanController.listCategory
                                  .toList()[index]
                                  .tr,
                              style: TextStyles.textStyleIntroDescription.apply(
                                  color: Colors.black, fontSizeDelta: -4),
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(height: ScreenConstant.defaultHeightTen),
                            ListView.builder(
                                shrinkWrap: true,
                                physics: ClampingScrollPhysics(),
                                itemCount: _treatmentPlanController
                                    .treatmentPlanItemData.length,
                                itemBuilder: (BuildContext context, int ind) {
                                  if (_treatmentPlanController.listCategory
                                          .toList()[index] ==
                                      _treatmentPlanController
                                          .treatmentPlanItemData[ind]
                                          .planCategory) {
                                    return Column(
                                      children: [
                                        TreatmentPlanListItem(
                                          title: _treatmentPlanController
                                              .treatmentPlanItemData[ind]
                                              .planName
                                              .tr,
                                          onPressed: () {
                                            _treatmentPlanController
                                                .toTreatmentPlanListWidget(
                                                    data: _treatmentPlanController
                                                            .treatmentPlanItemData[
                                                        ind]);
                                          },
                                          tid: _treatmentPlanController
                                              .treatmentPlanItemData[ind].pid,
                                        ),
                                        SizedBox(
                                            height: ScreenConstant.sizeDefault),
                                      ],
                                    );
                                  } else
                                    return Offstage();
                                }),
                          ],
                        );
                      },
                    ),
                    SizedBox(height: ScreenConstant.defaultHeightSeventy),
                  ],
                ),
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: CustomBottomNavigation()),
              ],
            )),
    );
  }

  _buildPageViewBuilder() {
    return Container(
      height: ScreenConstant.defaultHeightTwoHundredTen,
      child: PageView.builder(
          itemCount: arrTreatmentPlansText.length,
          controller: _pageController,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                Center(
                  child: Image.asset(
                    "assets/images/treatment_plans/tp$index.png",
                    fit: BoxFit.cover,
                    height: ScreenConstant.defaultHeightOneThirty,
                  ),
                ),
                SizedBox(height: ScreenConstant.defaultHeightSixteen),
                Text(
                  arrTreatmentPlansText[index],
                  maxLines: 3,
                  textAlign: TextAlign.center,
                  style: TextStyles.textStyleRegular.apply(color: Colors.black),
                )
              ],
            );
          },
          onPageChanged: (int index) {
            setState(() {
              _currentPageNotifier.value = index;
            });
          }),
    );
  }

  _buildCircleIndicator() {
    return CirclePageIndicator(
      dotSpacing: 14,
      size: 8,
      selectedSize: 14,
      borderWidth: 7,
      // borderColor: Colors.red,
      dotColor: AppColors.colorDotNotFocused,
      selectedDotColor: AppColors.white,
      selectedBorderColor: AppColors.colorDotNotFocused,
      itemCount: arrTreatmentPlansText.length,
      currentPageNotifier: _currentPageNotifier,
    );
  }
}
