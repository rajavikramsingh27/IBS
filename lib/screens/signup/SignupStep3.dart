

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ibs/controllers/signup/SignUpController.dart';
import 'package:flutter_ibs/utils/Assets.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/utils/Validator.dart';
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
  final _controller = Get.put(SignUpController());



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
          child: _controller.loader.value
              ? CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  strokeWidth: 2,
                )
              : CustomElevatedButton3(
                  widthFactor: 0.8,
                  text: "I am done!",
                  onTap: () {
                    // if (_controller.isFormValid() || !_controller.loader.value)
                      _controller.onAutovalidate();
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
                  _buildSignupForm(),
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
                      Obx(
                        () => CustomCheckBox(
                          value: _controller.agreeToTerms.value,

                          onChanged: (val) {
                            _controller.agreeToTerms.value =
                                !_controller.agreeToTerms.value;
                          },

                        ),
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

  _buildSignupForm() {
    return Form(
      key: _controller.formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                AspectRatio(
                    aspectRatio: 1.6, child: Image.asset(Assets.signupBg1)),
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
              validationFunction: Validator().validateEmail,
              controller: _controller.emailController,
              inputFormatters: [LengthLimitingTextInputFormatter(50)],
              currentFocus: focusEmail,
              nextFocus: focusPassWord,
              suffixIcon: Padding(
                padding: ScreenConstant.spacingAllSmall,
                child: Image.asset(
                  Assets.verified,
                  height: 20,
                ),
              ),
            ),
            SizedBox(height: ScreenConstant.defaultHeightSixteen),
            Text("Password:",
                textAlign: TextAlign.center,
                style: TextStyles.textStyleIntroDescription
                    .apply(color: Colors.black, fontSizeDelta: -6)),
            SizedBox(height: ScreenConstant.defaultHeightTen * 0.8),
            Obx(
                  () => CustomTextFormField(
                obscureText: _controller.isPasswordVisible.value,
                controller: _controller.passwordController,
                inputFormatters: [LengthLimitingTextInputFormatter(50)],
                currentFocus: focusPassWord,
                nextFocus: focusRePassWord,
                suffixIcon: IconButton(
                  icon: Icon(
                    _controller.isPasswordVisible.value
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: AppColors.textRegular,
                  ),
                  onPressed: () {
                    _controller.isPasswordVisible.value =
                    !_controller.isPasswordVisible.value;
                  },
                ),
              ),
            ),
            SizedBox(height: ScreenConstant.defaultHeightSixteen),
            Text("Confirm Password:",
                textAlign: TextAlign.center,
                style: TextStyles.textStyleIntroDescription
                    .apply(color: Colors.black, fontSizeDelta: -6)),
            SizedBox(height: ScreenConstant.defaultHeightTen * 0.8),
            Obx(
                  () => CustomTextFormField(
                validationFunction: Validator().validatePassword,
                obscureText: _controller.isPasswordVisible.value,
                controller: _controller.confirmPasswordController,
                inputFormatters: [LengthLimitingTextInputFormatter(50)],
                currentFocus: focusRePassWord,
                nextFocus: focusNone,
                textInputAction: TextInputAction.done,
                suffixIcon: IconButton(
                  icon: Icon(
                    _controller.isPasswordVisible.value
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: AppColors.textRegular,
                  ),
                  onPressed: () {
                    _controller.isPasswordVisible.value =
                    !_controller.isPasswordVisible.value;
                  },
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
                  style: TextStyles.textStyleIntroDescription
                      .apply(fontSizeDelta: -4),
                ),
              ),
            ),
          ],
        ),
      )
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
