import 'package:flutter/material.dart';
import 'package:flutter_ibs/controllers/treatment_plan/TreatmentPlanController.dart';
import 'package:flutter_ibs/utils/Assets.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/CustomBottomNavigation.dart';
import 'package:flutter_ibs/widget/Indicator.dart';
import 'package:flutter_ibs/widget/LeadingBackButton.dart';
import 'package:flutter_ibs/widget/TreatmentPlanListItem.dart';
import 'package:get/get.dart';

class TreatmentPlans extends StatelessWidget {
  final TreatmentPlanController _treatmentPlanController =
      Get.put(TreatmentPlanController());

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
                    Center(
                        child: Image.asset(Assets.treatment,
                            width: ScreenConstant.defaultHeightTwoHundredTen)),
                    SizedBox(height: ScreenConstant.defaultHeightSixteen),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: ScreenConstant.defaultWidthTwenty * 2),
                      child: Text(
                        "There is no cure for IBS but several treatments exist to help you manage your symptoms.",
                        textAlign: TextAlign.center,
                        style: TextStyles.textStyleRegular
                            .apply(color: Colors.black),
                      ),
                    ),
                    SizedBox(height: ScreenConstant.defaultHeightSixteen),
                    Indicator(
                      controller: _treatmentPlanController.pageController,
                      itemCount: 4,
                    ),
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
}
