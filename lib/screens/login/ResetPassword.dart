import 'package:flutter/material.dart';
import 'package:flutter_ibs/utils/Assets.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/CustomElevatedButton.dart';
import 'package:flutter_ibs/widget/CustomTextFormField%20.dart';
import 'package:flutter_ibs/widget/LeadingBackButton.dart';
import 'package:flutter_ibs/widget/utils.dart';
import 'package:get/get.dart';

final FocusNode focusEmail = FocusNode();
final FocusNode focusPassWord = FocusNode();
final FocusNode focusRePassWord = FocusNode();
final FocusNode focusNone = FocusNode();

class ResetPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.colorMyProfileBackground,
        appBar: AppBar(
          elevation: 0,
          leading: LeadingBackButton(
            onPressed: () => Get.back(),
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "FORGOT PASSWORD",
            style: TextStyles.appBarTitle,
          ),
        ),
        body: InkWell(
          onTap: () {
            dismissKeyboard(context);
          },
          child: ListView(
            physics: ClampingScrollPhysics(),
            padding: ScreenConstant.spacingAllLarge,
            children: [
              _buildOtp(),
              SizedBox(height: ScreenConstant.defaultHeightOneHundred)
            ],
          ),
        ));
  }

  _buildOtp() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Image.asset(
              Assets.forgotBg,
              scale: 0.5,
            ),
            Positioned(
                bottom: ScreenConstant.defaultHeightTwenty,
                left: ScreenConstant.sizeXXXL,
                right: ScreenConstant.sizeXXXL,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Change Password",
                      style: TextStyles.textStyleIntroDescription
                          .apply(color: Colors.white, fontSizeDelta: -4),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: ScreenConstant.defaultHeightSixteen),
                    Text(
                      '''Enter a new password and confirm password. Then click the update password button. Once complete, you will be navigated to the login screen to log into the app. ''',
                      style: TextStyles.textStyleRegular
                          .apply(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ))
          ],
        ),
        SizedBox(height: ScreenConstant.defaultHeightTwenty),
        Text("Email address:",
            textAlign: TextAlign.center,
            style: TextStyles.textStyleIntroDescription
                .apply(color: Colors.white, fontSizeDelta: -6)),
        SizedBox(height: ScreenConstant.defaultHeightTen * 0.8),
        CustomTextFormField(
          currentFocus: focusEmail,
          nextFocus: focusPassWord,
          suffixIcon: Padding(
            padding: ScreenConstant.spacingAllSmall,
            child: Image.asset(
              Assets.verified,
            ),
          ),
        ),
        SizedBox(height: ScreenConstant.defaultHeightSixteen),
        Text(":",
            textAlign: TextAlign.center,
            style: TextStyles.textStyleIntroDescription
                .apply(color: Colors.white, fontSizeDelta: -6)),
        SizedBox(height: ScreenConstant.defaultHeightTen * 0.8),
        CustomTextFormField(
          currentFocus: focusEmail,
          nextFocus: focusPassWord,
          suffixIcon: Padding(
            padding: ScreenConstant.spacingAllSmall,
            child: Image.asset(
              Assets.verified,
            ),
          ),
        ),
        SizedBox(height: ScreenConstant.defaultHeightSixteen),
        SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
        CustomElevatedButton2(
          widthFactor: 0.7,
          textColor: AppColors.colorBackground,
          buttonColor: Colors.white,
          onTap: () {},
          text: "Update Password",
        ),
      ],
    );
  }
}
