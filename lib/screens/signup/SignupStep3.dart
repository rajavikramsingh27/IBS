import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ibs/routes/RouteConstants.dart';
import 'package:flutter_ibs/utils/Assets.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/CustomCheckBox.dart';
import 'package:flutter_ibs/widget/CustomDialog.dart';
import 'package:flutter_ibs/widget/CustomElevatedButton.dart';
import 'package:flutter_ibs/widget/CustomTextFormField%20.dart';
import 'package:flutter_ibs/widget/LeadingBackButton.dart';
import 'package:flutter_ibs/widget/utils.dart';
import 'package:get/get.dart';

final FocusNode focusEmail = FocusNode();
final FocusNode focusPassWord = FocusNode();
final FocusNode focusRePassWord = FocusNode();
final FocusNode focusNone = FocusNode();

class SignupStep3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
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
        bottomNavigationBar: Container(
          padding: ScreenConstant.spacingAllLarge,
          color: AppColors.colorBackground,
          child: CustomElevatedButton3(
            widthFactor: 0.8,
            text: "I am done!",
            onTap: () {
              Get.toNamed(home);
            },
          ),
        ),
        body: InkWell(
          onTap: () {
            dismissKeyboard(context);
          },
          child: Stack(
            children: [
              ListView(
                physics: ClampingScrollPhysics(),
                padding: ScreenConstant.spacingAllLarge,
                children: [
                  _buildLoginForm(),
                  SizedBox(height: ScreenConstant.defaultHeightOneHundred)
                ],
              ),
              // Align(
              //   alignment: Alignment(0, 0.8),
              //   child: TextButton(
              //     onPressed: () {
              //       _buildDialogAccount();
              //     },
              //     style: TextButton.styleFrom(
              //         primary: AppColors.colorButton,
              //         textStyle: TextStyles.textStyleIntroDescription
              //             .apply(fontSizeFactor: 0.7)),
              //     child: Text(
              //       "Why create an account ?",
              //       style: TextStyles.textStyleIntroDescription
              //           .apply(fontSizeDelta: -4),
              //     ),
              //   ),
              // ),
              Align(
                alignment: Alignment(0, 0.99),
                child: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(
                    horizontal: ScreenConstant.defaultWidthTwenty * 1.2,
                  ),
                  decoration: BoxDecoration(color: Colors.white),
                  child: Row(
                    children: [
                      CustomCheckBox(
                        value: false,
                      ),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: "I agree to the ",
                          style: TextStyles.textStyleIntroDescription
                              .apply(color: Colors.black, fontSizeDelta: -6),
                          children: <TextSpan>[
                            TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => _buildDialogTermsandPolicy(),
                                text: "terms and privacy policy",
                                style: TextStyles.textStyleIntroDescription
                                    .apply(
                                        color: AppColors.colorBackground,
                                        fontSizeDelta: -6)),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Align(
                  alignment: Alignment(0, 1),
                  child: Container(
                    height: 1,
                    color: Colors.grey[100],
                  ))
            ],
          ),
        ));
  }

  _buildLoginForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
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
                      "Would you like to create an account?",
                      style: TextStyles.textStyleIntroDescription
                          .apply(color: Colors.white, fontSizeDelta: -3),
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
        SizedBox(height: ScreenConstant.defaultHeightFifteen),
        Text("Password:",
            textAlign: TextAlign.center,
            style: TextStyles.textStyleIntroDescription
                .apply(color: Colors.black, fontSizeDelta: -6)),
        SizedBox(height: ScreenConstant.defaultHeightTen * 0.8),
        CustomTextFormField(
          textInputAction: TextInputAction.done,
          currentFocus: focusRePassWord,
          nextFocus: focusNone,
          suffixIcon: Padding(
            padding: ScreenConstant.spacingAllSmall,
            child: Image.asset(
              Assets.password,
            ),
          ),
        ),
        SizedBox(height: ScreenConstant.defaultHeightFifteen),
        Text("Confirm Password:",
            textAlign: TextAlign.center,
            style: TextStyles.textStyleIntroDescription
                .apply(color: Colors.black, fontSizeDelta: -6)),
        SizedBox(height: ScreenConstant.defaultHeightTen * 0.8),
        CustomTextFormField(
          currentFocus: focusPassWord,
          nextFocus: focusRePassWord,
          suffixIcon: Padding(
            padding: ScreenConstant.spacingAllSmall,
            child: Image.asset(
              Assets.password,
            ),
          ),
        ),
        SizedBox(height: ScreenConstant.defaultHeightForty),
        Center(
          child: TextButton(
            onPressed: () {
              _buildDialogAccount();
            },
            style: TextButton.styleFrom(
                primary: AppColors.colorButton,
                textStyle: TextStyles.textStyleIntroDescription
                    .apply(fontSizeFactor: 0.7)),
            child: Text(
              "Why create an account ?",
              style:
                  TextStyles.textStyleIntroDescription.apply(fontSizeDelta: -4),
            ),
          ),
        ),
      ],
    );
  }

  _buildDialogAccount() {
    Get.dialog(
      CustomDialog(
        title: "Why Create an Account?",
        description:
            '''Creating an account is NOT required to use this app however an account will allow you to retrieve your data if you lose your device, and will also allow you to access your data across multiple devices.''',
      ),
    );
  }

  _buildDialogTermsandPolicy() {
    Get.dialog(
      CustomDialog(
        title: "Terms and Privacy Policy",
        description:
            '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam sit amet gravida augue, id eleifend mi. Morbi eget tempus felis, semper placerat erat. Sed nec ligula vestibulum, sagittis libero at, dapibus lectus. Duis fermentum diam mauris. 

Aliquam elementum, massa sed vulputate vestibulum, elit nunc ultrices est, eget placerat mauris orci nec sapien. Nam  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam sit amet gravida augue, id eleifend mi. Morbi eget tempus felis, semper placerat erat. Sed nec ligula vestibulum, sagittis libero at, dapibus lectus. Duis fermentum diam mauris. Aliquam''',
      ),
    );
  }
}
