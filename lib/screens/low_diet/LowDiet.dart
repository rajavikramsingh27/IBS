import 'package:flutter/material.dart';
import 'package:flutter_ibs/routes/RouteConstants.dart';
import 'package:flutter_ibs/utils/Assets.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/DummyData.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/CustomElevatedButton.dart';
import 'package:flutter_ibs/widget/LeadingBackButton.dart';
import 'package:get/get.dart';

class LowDiet extends StatelessWidget {
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
          "LOW FODMAP DIET",
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
              child: Image.asset(Assets.lowDiet,
                  width: ScreenConstant.defaultHeightTwoHundredTen)),
          SizedBox(height: ScreenConstant.defaultHeightFifteen),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: ScreenConstant.defaultWidthTwenty * 2),
            child: Text(
              "Changing your eating habits to a diet that is low in FODMAPs could help your IBS symptoms.",
              textAlign: TextAlign.center,
              style: TextStyles.textStyleRegular.apply(color: Colors.black),
            ),
          ),
          SizedBox(height: ScreenConstant.defaultHeightTwenty),
          _buildLowFodmapDiet("Low FODMAP diet plan details", () {}),
          SizedBox(height: ScreenConstant.defaultHeightFifteen),
          CustomElevatedButton(
            text: "Start Plan",
            widthFactor: 0.95,
            onTap: () {
              Get.toNamed(lowDietTreatmentPlan);
            },
          ),
          SizedBox(height: ScreenConstant.defaultHeightTwentyThree),
          Text(
            "Additional Resources",
            style: TextStyles.textStyleIntroDescription
                .apply(color: Colors.black, fontSizeDelta: -4),
            textAlign: TextAlign.start,
          ),
          SizedBox(height: ScreenConstant.defaultHeightTen),
          _buildListAdditionalResources(),
          SizedBox(height: ScreenConstant.defaultHeightTwentyThree),
        ],
      ),
    );
  }

  Widget _buildLowFodmapDiet(String title, Function onPressed) {
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
      itemCount: DummyData.lowdietadditionalResourcesList.length,
      itemBuilder: (BuildContext context, int index) {
        var model = DummyData.lowdietadditionalResourcesList[index];
        return _buildLowFodmapDiet(model.title, () {
          Get.toNamed(stressManagementDetails);
        });
      },
      separatorBuilder: (BuildContext context, int index) => SizedBox(
        height: ScreenConstant.sizeDefault,
      ),
    );
  }
}
