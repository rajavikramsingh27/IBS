import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ibs/controllers/signIn/SignInController.dart';
import 'package:flutter_ibs/routes/RouteConstants.dart';
import 'package:flutter_ibs/utils/Assets.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/utils/Validator.dart';
import 'package:flutter_ibs/widget/CustomElevatedButton.dart';
import 'package:flutter_ibs/widget/CustomTextFormField%20.dart';
import 'package:flutter_ibs/widget/utils.dart';
import 'package:get/get.dart';

final FocusNode focusEmail = FocusNode();
final FocusNode focusPassWord = FocusNode();

final FocusNode focusNone = FocusNode();

class SignIn extends StatelessWidget {
  final SignInController _controller = Get.put(SignInController());

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
        body: Obx(()=>InkWell(
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
        )));
  }

  _buildLoginForm() {
    return Form(
      key: _controller.formKey,
      child: Column(
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
                  .apply(color: Colors.white, fontSizeDelta: -6)),
          SizedBox(height: ScreenConstant.defaultHeightTen * 0.8),
          CustomTextFormField(
            obscureText: _controller.isPasswordVisible.value,
            controller: _controller.passwordController,
            inputFormatters: [LengthLimitingTextInputFormatter(50)],
            textInputAction: TextInputAction.done,
            currentFocus: focusPassWord,
            nextFocus: focusNone,
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
            child: _controller.loader.value ? CircularProgressIndicator():CustomElevatedButton2(
              widthFactor: 0.7,
              textColor: AppColors.colorBackground,
              buttonColor: Colors.white,
              onTap: () {
                _controller.onAutoValidate();
              },
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
      ),
    );
  }
}
