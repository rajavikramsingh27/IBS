import 'package:flutter/material.dart';
import 'package:flutter_ibs/routes/RouteConstants.dart';
import 'package:flutter_ibs/screens/stress_management/StressTreatmentPlan.dart';
import 'package:flutter_ibs/utils/Assets.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/DummyData.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/CustomElevatedButton.dart';
import 'package:flutter_ibs/widget/LeadingBackButton.dart';
import 'package:get/get.dart';

class StressManagement extends StatelessWidget {
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
          Center(
              child: Image.asset(Assets.stressManage,
                  width: ScreenConstant.defaultHeightTwoHundredTen)),
          SizedBox(height: ScreenConstant.defaultHeightSixteen),
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
          _buildStrssManage("Stress management plan details", () {}),
          SizedBox(height: ScreenConstant.defaultHeightSixteen),
          CustomElevatedButton(
            text: "Start Plan",
            widthFactor: 0.95,
            onTap: () {
              Get.bottomSheet(StressTreatmentPlan(),
                  isScrollControlled: true,
                  barrierColor: AppColors.barrierColor.withOpacity(0.60));
            },
          ),
          SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
          Text(
            "Additional Resources",
            style: TextStyles.textStyleIntroDescription
                .apply(color: Colors.black, fontSizeDelta: -4),
            textAlign: TextAlign.start,
          ),
          SizedBox(height: ScreenConstant.defaultHeightTen),
          _buildListAdditionalResources(),
          SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
        ],
      ),
    );
  }

  Widget _buildStrssManage(String title, Function onPressed) {
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
            visualDensity: VisualDensity(horizontal: -4, vertical: -4),
            icon: Icon(Icons.arrow_forward_ios_outlined,
                color: AppColors.colorArrowButton, size: FontSize.s14),
            onPressed: onPressed,
          ),
        ),
      ),
    );
  }

  _buildListAdditionalResources() {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: DummyData.stressadditionalResourcesList.length,
      itemBuilder: (BuildContext context, int index) {
        var model = DummyData.stressadditionalResourcesList[index];
        return _buildStrssManage(model.title, () {
          Get.toNamed(stressManagementDetails);
        });
      },
      separatorBuilder: (BuildContext context, int index) => SizedBox(
        height: ScreenConstant.sizeDefault,
      ),
    );
  }
}
