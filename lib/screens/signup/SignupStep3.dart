import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ibs/routes/RouteConstants.dart';
import 'package:flutter_ibs/utils/Assets.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/DummyData.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/CustomCheckBox.dart';
import 'package:flutter_ibs/widget/CustomElevatedButton.dart';
import 'package:flutter_ibs/widget/CustomTextFormField%20.dart';
import 'package:flutter_ibs/widget/LeadingBackButton.dart';
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
          color: Colors.white,
          child: CustomElevatedButton(
            widthFactor: 0.8,
            text: "Create Account",
            onTap: () {
              Get.toNamed(home);
            },
          ),
        ),
        body: InkWell(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (currentFocus.hasFocus) {
              currentFocus.unfocus();
            }
          },
          child: Stack(
            children: [
              ListView(
                physics: ClampingScrollPhysics(),
                padding: ScreenConstant.spacingAllLarge,
                children: [_buildLoginForm()],
              ),
              Align(
                alignment: Alignment(0, 0.8),
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
        Stack(children: [
          Container(
              height: ScreenConstant.defaultHeightNinety,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  colors: <Color>[
                    AppColors.colorBackground,
                    AppColors.colorBlue2,
                    AppColors.colorBlue3,
                  ],
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                  tileMode: TileMode.repeated,
                ),
              )),
          Positioned(
              right: 0,
              child: Image.asset(
                Assets.curl4,
                height: Get.mediaQuery.size.height * 0.3,
              )),
          Container(
            height: ScreenConstant.defaultHeightNinety,
            alignment: Alignment.center,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Text("Would you like to create \nan account ?",
                  textAlign: TextAlign.center,
                  style: TextStyles.textStyleIntroDescription
                      .apply(color: Colors.white, fontSizeDelta: -4)),
            ),
          ),
        ]),
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
              Assets.lock,
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
              Assets.lock,
            ),
          ),
        ),
        SizedBox(height: ScreenConstant.defaultHeightFifteen),
      ],
    );
  }

  _buildDialogAccount() {
    Get.dialog(
      Material(
        type: MaterialType.transparency,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: ScreenConstant.defaultHeightTwenty),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16)),
                        ),
                        height: ScreenConstant.screenHeightFourth,
                        margin: EdgeInsets.symmetric(
                            horizontal: ScreenConstant.defaultWidthTwenty),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: ScreenConstant.spacingAllLarge,
                              child: Text("Why create an Account?",
                                  textAlign: TextAlign.start,
                                  style: TextStyles.textStyleIntroDescription
                                      .apply(color: Colors.black87)),
                            ),
                            SizedBox(
                                height: ScreenConstant.defaultHeightFifteen),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      ScreenConstant.defaultWidthTwenty),
                              child: Text(
                                  '''Creating an account is NOT required to use this app however an account will allow you to retrieve your data if you lose your device, and will also allow you to access your data across multiple devices.
                                               ''',
                                  textAlign: TextAlign.start,
                                  style: TextStyles.textStyleRegular.apply(
                                      color: AppColors.colorDialogDescription)),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: ScreenConstant.screenHeightTwelve,
                        margin: EdgeInsets.symmetric(
                            horizontal: ScreenConstant.defaultWidthTwenty),

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(16),
                              bottomRight: Radius.circular(16)),
                          color: AppColors.colorBackground,
                        ),
                        child: Row(
                          children: [
                            Image.asset(Assets.curl6),
                            SizedBox(width: ScreenConstant.defaultWidthTwenty),
                            Image.asset(Assets.curl5)
                          ],
                        ),
                        // padding: ScreenConstant.spacingAllLarge,
                        // margin: ScreenConstant.spacingAllLarge,
                      )
                    ],
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 10,
                  child: GestureDetector(
                    onTap: () => Get.back(),
                    child: CircleAvatar(
                      backgroundColor: AppColors.colorCloseLight,
                      radius: 20,
                      child: CircleAvatar(
                          backgroundColor: AppColors.colorCloseLight,
                          radius: 18,
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                            size: FontSize.s15,
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _buildDialogTermsandPolicy() {
    Get.dialog(
      Material(
        type: MaterialType.transparency,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: ScreenConstant.defaultHeightTwenty),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16)),
                        ),
                        height: ScreenConstant.screenHeightHalf * 1.5,
                        margin: EdgeInsets.symmetric(
                            horizontal: ScreenConstant.defaultWidthTwenty),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: ScreenConstant.spacingAllLarge,
                              child: Text("Terms and Privacy Policy",
                                  textAlign: TextAlign.start,
                                  style: TextStyles.textStyleIntroDescription
                                      .apply(color: Colors.black87)),
                            ),
                            SizedBox(
                                height: ScreenConstant.defaultHeightFifteen),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      ScreenConstant.defaultWidthTwenty),
                              child: Text(
                                  '''Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.

The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.''',
                                  textAlign: TextAlign.start,
                                  style: TextStyles.textStyleRegular.apply(
                                      color: AppColors.colorDialogDescription)),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: ScreenConstant.screenHeightTwelve,
                        margin: EdgeInsets.symmetric(
                            horizontal: ScreenConstant.defaultWidthTwenty),

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(16),
                              bottomRight: Radius.circular(16)),
                          color: AppColors.colorBackground,
                        ),
                        child: Row(
                          children: [
                            Image.asset(Assets.curl6),
                            SizedBox(width: ScreenConstant.defaultWidthTwenty),
                            Image.asset(Assets.curl5)
                          ],
                        ),
                        // padding: ScreenConstant.spacingAllLarge,
                        // margin: ScreenConstant.spacingAllLarge,
                      )
                    ],
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 10,
                  child: GestureDetector(
                    onTap: () => Get.back(),
                    child: CircleAvatar(
                      backgroundColor: AppColors.colorCloseLight,
                      radius: 20,
                      child: CircleAvatar(
                          backgroundColor: AppColors.colorCloseLight,
                          radius: 18,
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                            size: FontSize.s15,
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
