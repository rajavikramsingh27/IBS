import 'package:flutter/material.dart';
import 'package:flutter_ibs/utils/Assets.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/CustomElevatedButton.dart';
import 'package:flutter_ibs/widget/LeadingBackButton.dart';
import 'package:get/get.dart';

class StressManagement extends StatelessWidget {
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
          "STRESS MANAGEMENT",
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
              child: Image.asset(Assets.stressManage,
                  width: ScreenConstant.defaultHeightTwoHundredTen)),
          SizedBox(height: ScreenConstant.defaultHeightFifteen),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: ScreenConstant.defaultWidthTwenty * 2),
            child: Text(
              "Managing stress can be an effective wayto help lessen your IBS symptoms.",
              textAlign: TextAlign.center,
              style: TextStyles.textStyleRegular.apply(color: Colors.black),
            ),
          ),
          SizedBox(height: ScreenConstant.defaultHeightTwenty),
          _buildTreatmentPlans("Stress management plan details", () {}),
          SizedBox(height: ScreenConstant.defaultHeightTwentyThree),
          CustomElevatedButton(
            text: "Start Plan",
            widthFactor: 0.9,
            onTap: () {},
          ),
          SizedBox(height: ScreenConstant.defaultHeightTwenty),
          Text(
            "Additional Resources",
            style: TextStyles.textStyleIntroDescription
                .apply(color: Colors.black, fontSizeDelta: -4),
            textAlign: TextAlign.start,
          ),
          SizedBox(height: ScreenConstant.defaultHeightTen),
          _buildTreatmentPlans("Understand the gut-brain connection", () {}),
          SizedBox(height: ScreenConstant.sizeDefault),
          _buildTreatmentPlans("Strategies for managing stress", () {}),
          SizedBox(height: ScreenConstant.sizeDefault),
          _buildTreatmentPlans("Cognitive Behavioural Therapy", () {}),
          SizedBox(height: ScreenConstant.sizeDefault),
          _buildTreatmentPlans("What to expect", () {}),
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
