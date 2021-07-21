import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_ibs/routes/RouteConstants.dart';
import 'package:flutter_ibs/utils/Assets.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/CustomPainters.dart';
import 'package:flutter_ibs/widget/LeadingBackButton.dart';
import 'package:get/get.dart';

class MyProfileStep3 extends StatelessWidget {
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
        // bottomNavigationBar: Container(
        //   color: Colors.white,
        //   child: Column(
        //     mainAxisSize: MainAxisSize.min,
        //     mainAxisAlignment: MainAxisAlignment.end,
        //     children: [
        //       SizedBox(height: ScreenConstant.defaultHeightTen),
        //       CustomElevatedButton(
        //         widthFactor: 0.8,
        //         text: "Continue",
        //         onTap: () {
        //           Get.toNamed(signup);
        //         },
        //       ),
        //       TextButton(
        //           onPressed: () {
        //             Get.back();
        //           },
        //           child: Text("Back to prev",
        //               style: TextStyles.textStyleIntroDescription.apply(
        //                 color: AppColors.colorskip_also_proceed,
        //               )))
        //     ],
        //   ),
        // ),
        body: Stack(
          children: [_buildIbsType(), _buildBottom()],
        ));
  }

  _buildIbsType() {
    return Padding(
      padding: ScreenConstant.spacingAllLarge,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: ScreenConstant.defaultHeightTwentyThree),
          Center(
              child: Image.asset(Assets.ibstype,
                  width: ScreenConstant.defaultHeightTwoHundredTen)),
          SizedBox(height: ScreenConstant.defaultHeightTwentyThree),
          Text("Based on the Rome IV criteria you may not have IBS.",
              textAlign: TextAlign.center,
              style: TextStyles.textStyleIntroDescription
                  .apply(color: Colors.black)),
          SizedBox(height: ScreenConstant.defaultHeightTwentyThree),
          Padding(
            padding: ScreenConstant.spacingAllLarge,
            child: Text(
              "Its important to understand that this is not a diagnosis.\n\nContinue to track your symptoms andtake these test results and your symptomtracker to your next appointment with your doctor.",
              textAlign: TextAlign.center,
              style: TextStyles.textStyleRegular,
            ),
          )
        ],
      ),
    );
  }

  _buildBottom() {
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: CustomPaint(
              painter: BottomCustomPainter(),
              size: Size(Get.context.mediaQuerySize.width,
                  Get.context.mediaQuerySize.height * 0.2)),
        ),
        Positioned(
          bottom: ScreenConstant.defaultHeightFifteen,
          left: ScreenConstant.defaultWidthTwenty,
          child: Row(
            children: [
              TextButton(
                onPressed: () {},
                child: Text("Skip",
                    style: TextStyles.textStyleRegular.apply(
                        color: AppColors.colorSkipButton, fontSizeDelta: 3)),
              ),
              SizedBox(width: ScreenConstant.defaultWidthNinetyEight),
              TextButton(
                onPressed: () {
                  Get.toNamed(signup);
                },
                child: Text("Continue",
                    style: TextStyles.textStyleIntroDescription
                        .apply(color: AppColors.white, fontSizeDelta: -3)),
              ),

              // SizedBox(width: ScreenConstant.defaultWidthTwenty ),
              InkWell(
                onTap: () {
                  Get.toNamed(signup);
                },
                child: Container(
                    width: ScreenConstant.defaultWidthNinetyEight,
                    height: ScreenConstant.defaultHeightNinetyEight,
                    child: _buildCircleAvatar()),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildCircleAvatar() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final radius = min(constraints.maxHeight / 3, constraints.maxWidth / 3);
        return Center(
          child: CircleAvatar(
            radius: radius,
            backgroundColor: AppColors.colorArrowButton,
            child: Icon(
              Icons.arrow_forward_ios,
              size: 10,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
