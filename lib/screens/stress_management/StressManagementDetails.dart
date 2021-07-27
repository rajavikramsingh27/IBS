import 'package:flutter/material.dart';
import 'package:flutter_ibs/utils/Assets.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/Strings.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/LeadingBackButton.dart';
import 'package:get/get.dart';

class StressManagementDetails extends StatelessWidget {
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
          AspectRatio(
            aspectRatio: 2,
            child: Image.asset(
              Assets.gutBrain,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
          Text(
            "The Gut - Brain Connection",
            style:
                TextStyles.textStyleIntroDescription.apply(color: Colors.black),
          ),
          SizedBox(height: ScreenConstant.defaultHeightSixteen),
          Text(
            AppStrings.gutBrain,
            style: TextStyles.textStyleRegular.apply(
                color: AppColors.colorskip_also_proceed, fontSizeDelta: 1),
          ),
          SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
        ],
      ),
    );
  }
}
