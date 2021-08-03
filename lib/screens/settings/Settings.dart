import 'package:flutter/material.dart';
import 'package:flutter_ibs/utils/Assets.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/CustomBottomNavigation.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.colorHomeBg,
        appBar: AppBar(
          elevation: 0,
          // leading: LeadingBackButton(
          //   onPressed: () => Get.back(),
          // ),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "SETTINGS",
            style: TextStyles.appBarTitle,
          ),
        ),
        body: Stack(
          children: [
            ListView(
              physics: ClampingScrollPhysics(),
              children: [
                SizedBox(height: ScreenConstant.defaultHeightSixteen),
                _buildSettings(Assets.myAccount, "My Account"),
                SizedBox(height: ScreenConstant.sizeDefault),
                _buildSettings(Assets.myAccount, "Tracking Options"),
                SizedBox(height: ScreenConstant.sizeDefault),
                _buildSettings(Assets.myAccount, "RomeIV Questionnaire"),
                SizedBox(height: ScreenConstant.sizeDefault),
                _buildSettings(Assets.myAccount, "My IBS Diagnosis"),
                SizedBox(height: ScreenConstant.sizeDefault),
                _buildSettings(Assets.myAccount, "Notifications"),
                SizedBox(height: ScreenConstant.sizeDefault),
              ],
            ),
            Container(
              alignment: Alignment(0, 0.80),
              child: _buildVersion(),
            ),
            Positioned(
                bottom: 0, left: 0, right: 0, child: CustomBottomNavigation())
          ],
        ));
  }

  _buildSettings(String imageText, String title) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: ScreenConstant.defaultHeightSeventy,
        padding: ScreenConstant.spacingAllDefault,
        margin: EdgeInsets.symmetric(
            horizontal: ScreenConstant.defaultWidthTen * 1.5),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: AppColors.colorArrowButton.withOpacity(0.1),
              child: Image.asset(imageText,
                  width: ScreenConstant.defaultWidthTwenty),
            ),
            SizedBox(width: ScreenConstant.defaultWidthTwenty * 1.3),
            Text(title,
                style: TextStyles.textStyleRegular
                    .apply(fontSizeDelta: 2, color: Colors.black)),
            // Spacer(),
            // Icon(
            //   Icons.arrow_forward_ios_outlined,
            //   color: AppColors.colorArrowButton,
            //   size: FontSize.s12,
            // ),
            // SizedBox(width: ScreenConstant.defaultWidthTen),
          ],
        ),
      ),
    );
  }

  _buildVersion() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: ScreenConstant.defaultHeightOneHundred * 1.5,
          color: Colors.white,
          child: Center(
            child: RichText(
              text: TextSpan(
                text: 'App Version: ',
                style: TextStyles.textStyleRegular.apply(fontSizeDelta: 2),
                children: <TextSpan>[
                  TextSpan(
                    text: "v 12.3",
                    style: TextStyles.textStyleRegular.apply(
                        fontSizeDelta: 2, color: AppColors.colorBackground),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: -30,
          left: 0,
          right: 0,
          child: CircleAvatar(
            backgroundColor: AppColors.white,
            radius: 30,
            child: Image.asset(
              Assets.heart,
              width: ScreenConstant.defaultWidthTwenty * 1.6,
            ),
          ),
        )
      ],
    );
  }
}