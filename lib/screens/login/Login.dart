import 'package:flutter/material.dart';
import 'package:flutter_ibs/routes/RouteConstants.dart';
import 'package:flutter_ibs/utils/Assets.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/CustomElevatedButton.dart';
import 'package:flutter_ibs/widget/CustomTextFormField%20.dart';
import 'package:flutter_ibs/widget/utils.dart';
import 'package:get/get.dart';

final FocusNode focusEmail = FocusNode();
final FocusNode focusPassWord = FocusNode();

final FocusNode focusNone = FocusNode();

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.colorBackground,
        // appBar: AppBar(
        //   elevation: 0,
        //   leading: LeadingBackButton(
        //     onPressed: () => Get.back(),
        //   ),
        //   backgroundColor: Colors.white,
        //   centerTitle: true,
        //   title: Text(
        //     "MY PROFILE",
        //     style: TextStyles.appBarTitle,
        //   ),
        // ),
        // bottomNavigationBar: Container(
        //   padding: ScreenConstant.spacingAllLarge,
        //   color: AppColors.colorBackground,
        //   child: CustomElevatedButton3(
        //     widthFactor: 0.8,
        //     text: "I am done!",
        //     onTap: () {
        //       Get.toNamed(home);
        //     },
        //   ),
        // ),
        body: InkWell(
          onTap: () {
            dismissKeyboard(context);
          },
          child: ListView(
            physics: ClampingScrollPhysics(),
            padding: ScreenConstant.spacingAllLarge,
            children: [
              SizedBox(
                  height: context.mediaQuerySize.width > 400
                      ? ScreenConstant.defaultHeightTwoHundred
                      : ScreenConstant.defaultHeightSixty),
              _buildLoginForm(),
            ],
          ),
        ));
  }

  _buildLoginForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(aspectRatio: 1.8, child: Image.asset(Assets.logo)),
        SizedBox(height: ScreenConstant.defaultHeightForty * 1.5),
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
        Text("Password:",
            textAlign: TextAlign.center,
            style: TextStyles.textStyleIntroDescription
                .apply(color: Colors.white, fontSizeDelta: -6)),
        SizedBox(height: ScreenConstant.defaultHeightTen * 0.8),
        CustomTextFormField(
          currentFocus: focusPassWord,
          nextFocus: focusPassWord,
          suffixIcon: Padding(
            padding: ScreenConstant.spacingAllSmall,
            child: Image.asset(
              Assets.password,
            ),
          ),
        ),
        Center(
          child: TextButton(
            onPressed: () {
              Get.toNamed(forgotPass);
            },
            child: Text("Forgot Password",
                style: TextStyles.textStyleRegular
                    .apply(color: Colors.white.withOpacity(0.70))),
          ),
        ),
        SizedBox(height: ScreenConstant.defaultHeightTwenty * 1.5),
        Center(
          child: CustomElevatedButton2(
            widthFactor: 0.7,
            textColor: AppColors.colorBackground,
            buttonColor: Colors.white,
            onTap: () {},
            text: "Login",
          ),
        ),
        SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
        Center(
          child: TextButton(
            onPressed: () {
              Navigator.pop(Get.context);
            },
            child: Text("Return to Home Screen",
                style: TextStyles.textStyleRegular.apply(
                    color: Colors.white.withOpacity(0.70), fontSizeDelta: 3)),
          ),
        ),
      ],
    );
  }
}