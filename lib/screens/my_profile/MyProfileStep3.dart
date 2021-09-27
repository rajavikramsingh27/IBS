import 'package:flutter/material.dart';
import 'package:flutter_ibs/routes/RouteConstants.dart';
import 'package:flutter_ibs/utils/Assets.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/BottomWidget.dart';
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
          SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
          Center(
              child: Image.asset(Assets.ibstype,
                  width: ScreenConstant.defaultHeightTwoHundredTen)),
          SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
          Text("Based on the Rome IV criteria you may not have IBS.",
              textAlign: TextAlign.center,
              style: TextStyles.textStyleIntroDescription
                  .apply(color: Colors.black)),
          SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
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
    return BottomWidget(
      onContinueTap: () {
        Get.toNamed(signup);
      },
      onCircleTap: () {
        Get.toNamed(signup);
      },
    );
  }
}
