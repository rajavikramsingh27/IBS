import 'package:flutter/material.dart';
import 'package:flutter_ibs/routes/RouteConstants.dart';
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

class ForgotPassword extends StatelessWidget {
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
              _buildForgotPasswordForm(),
              SizedBox(height: ScreenConstant.defaultHeightOneHundred)
            ],
          ),
        ));
  }

  _buildForgotPasswordForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            AspectRatio(aspectRatio: 1.6, child: Image.asset(Assets.signupBg1)),
            Positioned(
                bottom: ScreenConstant.defaultHeightTwenty,
                left: ScreenConstant.sizeXXXL,
                right: ScreenConstant.sizeXXXL,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Forgot Password?",
                      style: TextStyles.textStyleIntroDescription
                          .apply(color: Colors.white, fontSizeDelta: -4),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: ScreenConstant.defaultHeightSixteen),
                    Text(
                      "Please enter the email address used for your account below. We will email you a code to reset your password.",
                      style: TextStyles.textStyleRegular
                          .apply(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ))
          ],
        ),
        SizedBox(height: ScreenConstant.defaultHeightTwenty * 1.5),
        Text("Email address:",
            textAlign: TextAlign.center,
            style: TextStyles.textStyleIntroDescription
                .apply(color: Colors.black, fontSizeDelta: -6)),
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
        SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
        Center(
          child: CustomElevatedButton2(
            widthFactor: 0.5,
            textColor: AppColors.colorBackground,
            buttonColor: Colors.white,
            onTap: () {
              Get.toNamed(otp);
            },
            text: "Send Code",
          ),
        ),
        SizedBox(height: ScreenConstant.defaultHeightForty),
      ],
    );
  }
}
