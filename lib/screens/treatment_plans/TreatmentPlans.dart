import 'package:flutter/material.dart';
import 'package:flutter_ibs/controllers/treatment_plan/TreatmentPlanController.dart';
import 'package:flutter_ibs/utils/Assets.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/CustomDialog.dart';
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
            onTap: () {
              Get.dialog(CustomDialog4(
                title: "jg",
                description: "jg",
                // height: 300,
              ));
            },
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
          : ListView(
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
                    style:
                        TextStyles.textStyleRegular.apply(color: Colors.black),
                  ),
                ),
                SizedBox(height: ScreenConstant.defaultHeightSixteen),
                Indicator(
                  controller: _treatmentPlanController.pageController,
                  itemCount: 4,
                ),
                SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
                Text(
                  _treatmentPlanController.selectedCategory.value,
                  style: TextStyles.textStyleIntroDescription
                      .apply(color: Colors.black, fontSizeDelta: -4),
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: ScreenConstant.defaultHeightTen),
                ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount:
                        _treatmentPlanController.treatmentPlanItemData.length,
                    itemBuilder: (BuildContext context, int index) {
                      var model =
                          _treatmentPlanController.treatmentPlanItemData[index];
                      Future.delayed(Duration.zero, () {
                        _treatmentPlanController.category(model.planCategory);
                        _treatmentPlanController.treatmentPlanItemData
                            .refresh();
                      });
                      print(
                          "cat:${_treatmentPlanController.selectedCategory.value}");
                      return Column(
                        children: [
                          TreatmentPlanListItem(
                              _treatmentPlanController
                                  .treatmentPlanItemData[index]
                                  .planName
                                  .tr, () {
                            _treatmentPlanController.toTreatmentPlanListWidget(
                                data: _treatmentPlanController
                                    .treatmentPlanItemData[index]);
                          }),
                          SizedBox(height: ScreenConstant.sizeDefault),
                        ],
                      );
                    }),
                Text(
                  "Physician Prescribed Changes",
                  style: TextStyles.textStyleIntroDescription
                      .apply(color: Colors.black, fontSizeDelta: -4),
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: ScreenConstant.defaultHeightTen),
                TreatmentPlanListItem("Medication and supplements", () {
                  _treatmentPlanController.toTreatmentPlanListWidget();
                }),
                SizedBox(height: ScreenConstant.sizeDefault),
                TreatmentPlanListItem("Cognitive Behavioural Therapy", () {
                  _treatmentPlanController.toTreatmentPlanListWidget();
                }),
                SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
              ],
            )),
    );
  }
}
