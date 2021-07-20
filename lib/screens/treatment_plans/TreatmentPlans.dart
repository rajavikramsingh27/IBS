import 'package:flutter/material.dart';
import 'package:flutter_ibs/controllers/treatment_plan/TreatmentPlanController.dart';
import 'package:flutter_ibs/routes/RouteConstants.dart';
import 'package:flutter_ibs/utils/Assets.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/Indicator.dart';
import 'package:flutter_ibs/widget/LeadingBackButton.dart';
import 'package:get/get.dart';

class TreatmentPlans extends StatelessWidget {
  final _controller = Get.put(TreatmentPlanController());

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
          "TREATMENT PLANS",
          style: TextStyles.appBarTitle,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: ScreenConstant.defaultWidthTwenty),
            child: Image.asset(
              Assets.settings,
              width: ScreenConstant.defaultWidthTwenty,
            ),
          )
        ],
      ),
      body: ListView(
        padding: ScreenConstant.spacingAllMedium,
        physics: ClampingScrollPhysics(),
        children: [
          Center(
              child: Image.asset(Assets.treatment,
                  width: ScreenConstant.defaultHeightTwoHundredTen)),
          SizedBox(height: ScreenConstant.defaultHeightFifteen),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: ScreenConstant.defaultWidthTwenty * 2),
            child: Text(
              "There is no cure for IBS but several treatments exist to help you manage your symptoms.",
              textAlign: TextAlign.center,
              style: TextStyles.textStyleRegular.apply(color: Colors.black),
            ),
          ),
          SizedBox(height: ScreenConstant.defaultHeightFifteen),
          Indicator(
            controller: _controller.pageController,
            itemCount: 4,
          ),
          SizedBox(height: ScreenConstant.defaultHeightTwentyThree),
          Text(
            "Lifestyle and Dietary Changes",
            style: TextStyles.textStyleIntroDescription
                .apply(color: Colors.black, fontSizeDelta: -4),
            textAlign: TextAlign.start,
          ),
          SizedBox(height: ScreenConstant.defaultHeightTen),
          _buildTreatmentPlans("Stress management ", () {
            Get.toNamed(stressManagement);
          }),
          SizedBox(height: ScreenConstant.sizeDefault),
          _buildTreatmentPlans("Low FODMAP diet", () {}),
          SizedBox(height: ScreenConstant.sizeDefault),
          _buildTreatmentPlans("Increase exercise", () {}),
          SizedBox(height: ScreenConstant.sizeDefault),
          _buildTreatmentPlans("Improve sleep", () {}),
          SizedBox(height: ScreenConstant.defaultHeightTwenty),
          Text(
            "Physician Prescribed Changes",
            style: TextStyles.textStyleIntroDescription
                .apply(color: Colors.black, fontSizeDelta: -4),
            textAlign: TextAlign.start,
          ),
          SizedBox(height: ScreenConstant.defaultHeightTen),
          _buildTreatmentPlans("Medication and supplements", () {}),
          SizedBox(height: ScreenConstant.sizeDefault),
          _buildTreatmentPlans("Cognitive Behavioural Therapy", () {}),
          SizedBox(height: ScreenConstant.defaultHeightTwentyThree),
        ],
      ),
    );
  }

  Widget _buildTreatmentPlans(String title, Function onPressed) {
    return Container(
      padding: ScreenConstant.spacingAllSmall,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.colorBorder, width: 1)),
      child: ListTile(
        dense: true,
        contentPadding: EdgeInsets.zero,
        title: Padding(
          padding: EdgeInsets.only(left: ScreenConstant.sizeXXL),
          child: Text(
            title,
            style: TextStyles.textStyleIntroDescription
                .apply(color: Colors.black, fontSizeDelta: -6),
          ),
        ),
        trailing: Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.colorArrowButton, width: 1)),
          child: IconButton(
            icon: Icon(Icons.arrow_forward_ios_outlined,
                color: AppColors.colorArrowButton),
            onPressed: onPressed,
          ),
        ),
      ),
    );
  }
}
