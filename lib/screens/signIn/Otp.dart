import 'package:flutter/material.dart';
import 'package:flutter_ibs/routes/RouteConstants.dart';
import 'package:flutter_ibs/utils/Assets.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/CustomElevatedButton.dart';
import 'package:flutter_ibs/widget/LeadingBackButton.dart';
import 'package:flutter_ibs/widget/utils.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class Otp extends StatelessWidget {
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
      crossAxisAlignment: CrossAxisAlignment.center,
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
                      "Enter Reset Code",
                      style: TextStyles.textStyleIntroDescription
                          .apply(color: Colors.white, fontSizeDelta: -4),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: ScreenConstant.defaultHeightSixteen),
                    Text(
                      '''Enter the reset code from your email to reset your password. If you have not received a code please check your junk email and ensure you have provided the correct email address.''',
                      style: TextStyles.textStyleRegular
                          .apply(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ))
          ],
        ),
        SizedBox(height: ScreenConstant.defaultHeightTwenty),
        Text("Reset Code:",
            textAlign: TextAlign.center,
            style: TextStyles.textStyleIntroDescription
                .apply(color: Colors.black, fontSizeDelta: -6)),
        SizedBox(height: ScreenConstant.defaultHeightTwenty),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: ScreenConstant.defaultWidthSixty),
          child: PinCodeTextField(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            textStyle: TextStyles.textStyleRegular,
            beforeTextPaste: (text) {
              //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
              //but you can show anything you want here, like your pop up saying wrong paste format or etc
              return false;
            },
            cursorColor: Colors.black,
            // controller: _otpTextController,
            keyboardType: TextInputType.number,
            backgroundColor: Colors.transparent,
            length: 4,
            animationType: AnimationType.fade,
            pinTheme: PinTheme(
              selectedFillColor: Colors.grey,
              disabledColor: Colors.white,
              borderWidth: 0,
              inactiveFillColor: Colors.transparent,
              selectedColor: Colors.white,
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(8),
              fieldHeight: ScreenConstant.defaultHeightForty * 1.2,
              activeFillColor: Colors.white,
            ),
            animationDuration: Duration(milliseconds: 300),
            enableActiveFill: true,
            onChanged: (sbd) {},
            appContext: Get.context,
          ),
        ),
        SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
        CustomElevatedButton2(
          widthFactor: 0.7,
          textColor: AppColors.colorBackground,
          buttonColor: Colors.white,
          onTap: () {
            Get.toNamed(resetPass);
          },
          text: "Next",
        ),
        SizedBox(height: ScreenConstant.defaultHeightOneForty),
        TextButton(
            onPressed: () {},
            child: Text(
              "Resend Reset Code",
              style: TextStyles.textStyleRegular
                  .apply(fontSizeDelta: 3, color: AppColors.colorBackground),
            ))
      ],
    );
  }
}

