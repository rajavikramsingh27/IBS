import 'package:flutter/material.dart';
import 'package:flutter_ibs/utils/Assets.dart';
import 'package:flutter_ibs/utils/Colors.dart';
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
            onTap: () {},
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
              Positioned(
                bottom: ScreenConstant.defaultHeightTwenty*1.5,
                left: 0,
                right: 0,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                      primary: AppColors.colorButton,
                      textStyle: TextStyles.textStyleIntroDescription
                          .apply(fontSizeFactor: 0.7)),
                  child: Text("Why create an account ?"),
                ),
              ),
               Positioned(
                bottom: 0,
               
                child: Container(
                  width: double.maxFinite,
                  padding:EdgeInsets.symmetric(horizontal:  ScreenConstant.defaultWidthTwenty*1.2,)  ,
                  decoration: BoxDecoration( color: Colors.white),
                  child: Row(
                    children: [
                      CustomCheckBox(value: false,),
                      Text("I agree to the terms and privacy policy."),
                    ],
                  ),
                ),
              )
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
        ),
        SizedBox(height: ScreenConstant.defaultHeightFifteen),
      ],
    );
  }
}
