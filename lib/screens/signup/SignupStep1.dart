import 'package:flutter/material.dart';
import 'package:flutter_ibs/routes/RouteConstants.dart';
import 'package:flutter_ibs/utils/Assets.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/BottomWidget.dart';
import 'package:flutter_ibs/widget/CustomCheckBox.dart';
import 'package:flutter_ibs/widget/LeadingBackButton.dart';
import 'package:get/get.dart';

class SignupStep1 extends StatelessWidget {
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
        //     text: "Next",
        //     onTap: () {
        //       Get.toNamed(signup2);
        //     },
        //   ),
        // ),
        body: Stack(
          children: [
            ListView(
              physics: ClampingScrollPhysics(),
              padding: ScreenConstant.spacingAllLarge,
              children: [
                _buildAboutYourself(),
                SizedBox(height: ScreenConstant.defaultHeightSixteen),
                _buildGenderCard(),
                SizedBox(height: ScreenConstant.defaultHeightSixteen),
                _buildAgeCard(),
                SizedBox(height: ScreenConstant.defaultHeightSixteen),
                _buildFamilyIBSHistory(),
                SizedBox(height: ScreenConstant.defaultHeightOneHundred),
              ],
            ),
            BottomWidget(
                onContinueTap: () => Get.toNamed(signup2),
                onCircleTap: () => Get.toNamed(signup2))
          ],
        ));
  }

  _buildAboutYourself() {
    return Stack(
      children: [
        AspectRatio(aspectRatio: 1.6, child: Image.asset(Assets.signupBg1)),
        Positioned(
            bottom: ScreenConstant.defaultHeightSixty,
            left: ScreenConstant.sizeXXXL,
            right: ScreenConstant.sizeXXXL,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Tell us a bit about yourself",
                  style: TextStyles.textStyleIntroDescription
                      .apply(color: Colors.white, fontSizeDelta: -3),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: ScreenConstant.sizeDefault),
                Text(
                  "IBS can impact people differently. Sex, age and family history can play a role in IBS",
                  style: TextStyles.textStyleRegular
                      .apply(color: Colors.white, fontSizeDelta: -1),
                  textAlign: TextAlign.center,
                ),
              ],
            ))
      ],
    );
  }

  _buildGenderCard() {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: ScreenConstant.defaultWidthTen * 1.5,
                right: ScreenConstant.defaultWidthTen * 1.5,
                top: ScreenConstant.defaultHeightTen * 1.5),
            child: Text("What is your sex :",
                style: TextStyles.textStyleIntroDescription
                    .apply(color: Colors.black, fontSizeDelta: -6)),
          ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: ListTile(
                  horizontalTitleGap: 0,
                  minLeadingWidth: 0,
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  title: Text("Female", style: TextStyles.textStyleRegular),
                  leading: CustomCheckBox(
                    value: false,
                    onChanged: (val) {
                      //do your stuff here
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: ListTile(
                  horizontalTitleGap: 0,
                  minLeadingWidth: 0,
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  title: Text("Male", style: TextStyles.textStyleRegular),
                  leading: CustomCheckBox(
                    value: true,
                    onChanged: (val) {
                      //do your stuff here
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: ListTile(
                  horizontalTitleGap: 0,
                  minLeadingWidth: 0,
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  title: Text("Prefer not to respond",
                      style: TextStyles.textStyleRegular),
                  leading: CustomCheckBox(
                    value: false,
                    onChanged: (val) {
                      //do your stuff here
                    },
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  _buildAgeCard() {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: ScreenConstant.spacingAllMedium,
            child: Text("What is your age :",
                style: TextStyles.textStyleIntroDescription
                    .apply(color: Colors.black, fontSizeDelta: -6)),
          ),
          Container(
            height: ScreenConstant.defaultHeightForty,
            width: double.maxFinite,
            margin: EdgeInsets.only(
                left: ScreenConstant.defaultWidthTen * 1.5,
                right: ScreenConstant.defaultWidthTen * 1.5,
                bottom: ScreenConstant.defaultHeightTen * 1.5),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            decoration: BoxDecoration(
                color: AppColors.colordropdownArrowBg,
                borderRadius: BorderRadius.all(Radius.circular(8))),
            // dropdown below..
            child: DropdownButton<String>(
                isExpanded: true,
                dropdownColor: AppColors.white,
                value: "Under 20 years",
                elevation: 30,
                icon: Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: AppColors.colordropdownArrow,
                ),
                iconSize: 20,
                underline: SizedBox(),
                onChanged: (String newValue) {
                  // setState(() {
                  //   dropdownValue = newValue;
                  // });
                },
                items: <String>["Under 20 years", "2", "3", "4", "5", "more"]
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value.toString(),
                    child: Text(value.toString(),
                        style: TextStyles.textStyleRegular),
                  );
                }).toList()),
          ),
        ],
      ),
    );
  }

  _buildFamilyIBSHistory() {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: ScreenConstant.defaultWidthTen * 1.5,
                right: ScreenConstant.defaultWidthTen * 1.5,
                top: ScreenConstant.defaultHeightTen * 1.5),
            child: Text("Do you have a family history of IBS ?",
                style: TextStyles.textStyleIntroDescription
                    .apply(color: Colors.black, fontSizeDelta: -6)),
          ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: ListTile(
                  horizontalTitleGap: 0,
                  minLeadingWidth: 0,
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  title: Text("Yes", style: TextStyles.textStyleRegular),
                  leading: CustomCheckBox(
                    value: false,
                    onChanged: (val) {
                      //do your stuff here
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: ListTile(
                  horizontalTitleGap: 0,
                  minLeadingWidth: 0,
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  title: Text("No", style: TextStyles.textStyleRegular),
                  leading: CustomCheckBox(
                    value: true,
                    onChanged: (val) {
                      //do your stuff here
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: ListTile(
                  horizontalTitleGap: 0,
                  minLeadingWidth: 0,
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  title: Text("Unsure", style: TextStyles.textStyleRegular),
                  leading: CustomCheckBox(
                    value: false,
                    onChanged: (val) {
                      //do your stuff here
                    },
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
