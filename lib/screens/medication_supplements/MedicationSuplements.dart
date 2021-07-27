import 'package:flutter/material.dart';
import 'package:flutter_ibs/utils/Assets.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/DummyData.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/CustomElevatedButton.dart';
import 'package:flutter_ibs/widget/LeadingBackButton.dart';
import 'package:get/get.dart';

class MedicationSuplements extends StatelessWidget {
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
          "Medication and Supplements".toUpperCase(),
          style: TextStyles.appBarTitle,
        ),
      ),
      body: ListView(
        padding: ScreenConstant.spacingAllMedium,
        physics: ClampingScrollPhysics(),
        children: [
          Center(
              child: Image.asset(Assets.medicationSuplements,
                  width: ScreenConstant.defaultHeightTwoHundredTen)),
          SizedBox(height: ScreenConstant.defaultHeightSixteen),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: ScreenConstant.defaultWidthTwenty * 2),
            child: Text(
              "Your health care provider will help you determine if prescription medication is right for you.",
              textAlign: TextAlign.center,
              style: TextStyles.textStyleRegular.apply(color: Colors.black),
            ),
          ),
          SizedBox(height: ScreenConstant.defaultHeightTwenty),
          _buildExercise("Prescription medication for IBS", () {}),
          SizedBox(height: ScreenConstant.defaultHeightSixteen),
          CustomElevatedButton(
            text: "Start Plan",
            widthFactor: 0.95,
            onTap: () {},
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

  Widget _buildExercise(String title, Function onPressed) {
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
            color: AppColors.colorYesButton,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            visualDensity: VisualDensity(horizontal: -4, vertical: -4),
            icon: Icon(Icons.arrow_forward_ios_outlined,
                color: AppColors.white, size: FontSize.s14),
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
      itemCount: DummyData.medicationAdditionalResourcesList.length,
      itemBuilder: (BuildContext context, int index) {
        var model = DummyData.medicationAdditionalResourcesList[index];
        return _buildExercise(model.title, () {});
      },
      separatorBuilder: (BuildContext context, int index) => SizedBox(
        height: ScreenConstant.sizeDefault,
      ),
    );
  }
}
