


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/LeadingBackButton.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ibs/controllers/MyAccount/MyAccountController.dart';
import 'package:flutter_ibs/widget/CustomTextFormField%20.dart';
import 'package:flutter_ibs/utils/Validator.dart';
import 'package:flutter_ibs/utils/ShadowContainer.dart';
import 'package:flutter_ibs/widget/CustomCheckBox.dart';
import 'package:flutter_ibs/widget/CustomElevatedButton.dart';


final FocusNode focusEmail = FocusNode();
final FocusNode focusPassWord = FocusNode();
final FocusNode focusRePassWord = FocusNode();
final FocusNode focusNone = FocusNode();


class MyAccount extends StatelessWidget {
  final  MyAccountController _controller = Get.put(MyAccountController());

  buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: ScreenConstant.defaultHeightTwenty),
        Text("Email address:",
            style: TextStyles.textStyleIntroDescription
                .apply(color: Colors.black, fontSizeDelta: -6)
        ),
        SizedBox(height: ScreenConstant.defaultHeightTen * 0.8),
        Container(
          decoration: AppShadow().shadowSetting(),
          child: CustomTextFormField(
            validationFunction: Validator().validateEmail,
            controller: _controller.emailController,
            inputFormatters: [LengthLimitingTextInputFormatter(50)],
            // currentFocus: focusEmail,
            // nextFocus: focusPassWord,
            suffixIcon: Padding(
              padding: ScreenConstant.spacingAllSmall,
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            child: Text(
                "Change email",
                style: TextStyles.textStyleSettingDescription
            ),
            onPressed: () {

            },
          ),
        )
      ],
    );
  }

  buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: ScreenConstant.defaultHeightTwenty),
        Text("Password:",
            style: TextStyles.textStyleIntroDescription
                .apply(color: Colors.black, fontSizeDelta: -6)
        ),
        SizedBox(height: ScreenConstant.defaultHeightTen * 0.8),
        Container(
          decoration: AppShadow().shadowSetting(),
          child: CustomTextFormField(
            validationFunction: Validator().validatePassword,
            controller: _controller.passwordController,
            inputFormatters: [LengthLimitingTextInputFormatter(50)],
            // currentFocus: focusEmail,
            // nextFocus: focusPassWord,
            suffixIcon: Padding(
              padding: ScreenConstant.spacingAllSmall,
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            child: Text(
                "Change Password",
                style: TextStyles.textStyleSettingDescription
            ),
            onPressed: () {

            },
          ),
        )
      ],
    );
  }

  buildGender() {
    return Container(
        decoration: AppShadow().shadowSetting(),
        padding: EdgeInsets.only(
            left: ScreenConstant.defaultWidthTen,
            right: ScreenConstant.defaultWidthTen,
            top: ScreenConstant.defaultHeightTwenty,
            bottom: ScreenConstant.defaultWidthTen
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("What is your sex :",
                style: TextStyles.textStyleIntroDescription
                    .apply(color: Colors.black, fontSizeDelta: -6)),
            SizedBox(height: ScreenConstant.defaultHeightTen * 0.8),
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
                      value: _controller.selectedFeMale.value,
                      onChanged: (val) {
                        _controller.selectedGender.value = "f";
                        _controller.selectedFeMale.value =
                        !_controller.selectedFeMale.value;
                        if (_controller.selectedFeMale.value == true) {
                          _controller.selectedMale.value = false;
                          _controller.selectedOtherGender.value = false;
                        } else
                          _controller.selectedGender.value = "";
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
                      value: _controller.selectedMale.value,
                      onChanged: (val) {
                        _controller.selectedGender.value = "m";
                        _controller.selectedMale.value =
                        !_controller.selectedMale.value;
                        if (_controller.selectedMale.value == true) {
                          _controller.selectedFeMale.value = false;
                          _controller.selectedOtherGender.value = false;
                        } else
                          _controller.selectedGender.value = "";
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
                    title: Text("Prefer not to respond",
                        style: TextStyles.textStyleRegular),
                    leading: CustomCheckBox(
                      value: _controller.selectedOtherGender.value,
                      onChanged: (val) {
                        _controller.selectedGender.value = "na";
                        _controller.selectedOtherGender.value =
                        !_controller.selectedOtherGender.value;
                        if (_controller.selectedOtherGender.value == true) {
                          _controller.selectedFeMale.value = false;
                          _controller.selectedMale.value = false;
                        } else
                          _controller.selectedGender.value = "";
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        )
    );
  }

  buildFamilyIBSHistory() {
    return Container(
        decoration: AppShadow().shadowSetting(),
        padding: EdgeInsets.only(
            left: ScreenConstant.defaultWidthTen,
            right: ScreenConstant.defaultWidthTen,
            top: ScreenConstant.defaultHeightTwenty,
            bottom: ScreenConstant.defaultWidthTen
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Do you have a family history of IBS ?",
                style: TextStyles.textStyleIntroDescription
                    .apply(color: Colors.black, fontSizeDelta: -6)),
            SizedBox(height: ScreenConstant.defaultHeightTen * 0.8),
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
                      value: _controller.selectedIbsHistoryYes.value,
                      onChanged: (val) {
                        _controller.selectedIbsHistory.value = "yes";
                        _controller.selectedIbsHistoryYes.value =
                        !_controller.selectedIbsHistoryYes.value;
                        if (_controller.selectedIbsHistoryYes.value == true) {
                          _controller.selectedIbsHistoryNo.value = false;
                          _controller.selectedIbsHistoryUnsure.value = false;
                        } else
                          _controller.selectedIbsHistory.value = "";
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
                      value: _controller.selectedIbsHistoryNo.value,
                      onChanged: (val) {
                        _controller.selectedIbsHistory.value = "no";
                        _controller.selectedIbsHistoryNo.value =
                        !_controller.selectedIbsHistoryNo.value;
                        if (_controller.selectedIbsHistoryNo.value == true) {
                          _controller.selectedIbsHistoryYes.value = false;
                          _controller.selectedIbsHistoryUnsure.value = false;
                        } else
                          _controller.selectedIbsHistory.value = "";
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
                      value: _controller.selectedIbsHistoryUnsure.value,
                      onChanged: (val) {
                        _controller.selectedIbsHistory.value = "unsure";
                        _controller.selectedIbsHistoryUnsure.value =
                        !_controller.selectedIbsHistoryUnsure.value;
                        if (_controller.selectedIbsHistoryUnsure.value == true) {
                          _controller.selectedIbsHistoryNo.value = false;
                          _controller.selectedIbsHistoryYes.value = false;
                        } else
                          _controller.selectedIbsHistory.value = "";
                      },
                    ),
                  ),
                ),
              ],
            )
          ],
        )
    );

  }

  buildAgeCard() {
    return Container(
        decoration: AppShadow().shadowSetting(),
        padding: EdgeInsets.only(
            left: ScreenConstant.defaultWidthTen,
            right: ScreenConstant.defaultWidthTen,
            top: ScreenConstant.defaultHeightTwenty,
            bottom: ScreenConstant.defaultWidthTen
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("What is your age :",
                style: TextStyles.textStyleIntroDescription
                    .apply(color: Colors.black, fontSizeDelta: -6)),
            SizedBox(height: ScreenConstant.defaultHeightTen * 0.8),
            Container(
              height: ScreenConstant.defaultHeightForty,
              width: double.maxFinite,
              margin: EdgeInsets.only(
                  left: ScreenConstant.defaultWidthTen * 1.5,
                  right: ScreenConstant.defaultWidthTen * 1.5,
                  bottom: ScreenConstant.defaultHeightTen * 1.5
              ),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              decoration: BoxDecoration(
                  color: AppColors.colordropdownArrowBg,
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              // dropdown below..
              child: DropdownButton<String>(
                  isExpanded: true,
                  dropdownColor: AppColors.white,
                  value: _controller.selectedAge.value,
                  elevation: 30,
                  icon: Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: AppColors.colordropdownArrow,
                  ),
                  iconSize: 20,
                  underline: SizedBox(),
                  onChanged: (String newValue) {
                    _controller.selectedAge.value = newValue;
                  },
                  items: <String>[
                    "<20",
                    "20-29",
                    "30-39",
                    "40-49",
                    "50-59",
                    "60-69",
                    "70+"
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value.toString(),
                      child: Text(value.toString(),
                          style: TextStyles.textStyleRegular),
                    );
                  }).toList()),
            ),
          ],
        )
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  AppColors.colorProfileBg,
      appBar: AppBar(
        elevation: 0,
        leading: LeadingBackButton(
          onPressed: () => Get.back(),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "MY Account",
          style: TextStyles.appBarTitle,
        ),
      ),

      body: GetBuilder<MyAccountController>(
        init: MyAccountController(),
        initState: (state) {
          // print('HomePageController state initialized');
        },

        builder: (authController) {
          authController.settingType = '0'.obs;

          authController.getUserList();
          return Obx(
                () => ListView(
              physics: ClampingScrollPhysics(),
              padding: ScreenConstant.spacingAllLarge,
              children: [
                SizedBox(height: ScreenConstant.sizeExtraLarge),
                Center(
                  child: Text("My Account Details.",
                    style: TextStyles.textStyleSettingTitle,
                  ),
                ),
                SizedBox(height: ScreenConstant.defaultHeightTen),
                Padding(
                  padding: EdgeInsets.only(
                      left: 40, right: 40
                  ),
                  child: Text(
                    "You may edit your account details at any time. Changing your account’s email address and password requires email confirmation.",
                    textAlign: TextAlign.center,
                    style: TextStyles.textStyleSettingDescription,
                  ),
                ),
                buildEmail(),
                buildPassword(),
                SizedBox(height: ScreenConstant.defaultHeightTwenty),
                buildGender(),
                SizedBox(height: ScreenConstant.defaultHeightTwenty),
                buildAgeCard(),
                SizedBox(height: ScreenConstant.defaultHeightTwenty),
                buildFamilyIBSHistory(),
                SizedBox(height: ScreenConstant.screenWidthThird/4),
                Container(
                  child: CustomElevatedButton2(
                    textColor: Colors.white,
                    buttonColor: AppColors.colorBackground,
                    widthFactor: 0.8,
                    text: "Save Changes",
                    onTap: () {
                      authController.updateUser();
                    },
                  )
                ),
                SizedBox(height: ScreenConstant.defaultHeightTwenty),
                Container(
                  child: CustomElevatedButton2(
                    textColor: Colors.black,
                    buttonColor: Colors.transparent,
                    widthFactor: 0.8,
                    text: "Cancel",
                    onTap: () {
                      authController.setUIDataMyAccount();
                    },
                  )
                ),
              ],
            ),
          );
        }
      ),
    );
  }

}




