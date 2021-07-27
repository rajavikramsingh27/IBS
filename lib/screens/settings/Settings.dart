import 'package:flutter/material.dart';
import 'package:flutter_ibs/routes/RouteConstants.dart';
import 'package:flutter_ibs/utils/Assets.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/BottomTabPainter.dart';
import 'package:get/get.dart';

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
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                width: context.mediaQuerySize.width,
                height: Get.context.mediaQuerySize.height * 0.13,
                child: Stack(
                  children: [
                    CustomPaint(
                        painter: BottomTabPainter(),
                        size: Size(Get.context.mediaQuerySize.width,
                            Get.context.mediaQuerySize.height * 0.13)),
                    Center(
                        heightFactor: 1.5,
                        child: FloatingActionButton(
                          onPressed: () {},
                          child: _buildMiddleTabItem(),
                        )),
                    Positioned(
                      bottom: 0, right: 0, left: 0,
                      // height: Get.context.mediaQuerySize.height * 0.12,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: ScreenConstant.defaultHeightTen),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.ideographic,
                            children: [
                              _buildTabItem(
                                  onTap: () {
                                    Get.toNamed(treatPlans);
                                  },
                                  title: "Treatment\nPlans",
                                  imageText: Assets.treatPlans),
                              _buildTabItem(
                                  title: "Reports", imageText: Assets.report),
                              Container(
                                  width: context.mediaQuerySize.width * 0.13),
                              _buildTabItem(
                                  title: "Resources",
                                  imageText: Assets.resources),
                              _buildTabItem(
                                  title: "My IBS", imageText: Assets.profile),
                            ]),
                      ),
                    )
                  ],
                ),
              ),
            ),
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
      clipBehavior: Clip.antiAlias,
      overflow: Overflow.visible,
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

  Widget _buildTabItem(
      {String title, String imageText, int index, Function() onTap

      // ValueChanged<int> onPressed,
      }) {
    // Color color = _controller.selectedIndex.value == index
    // ? AppColors.colorArrowButton
    // : AppColors.colorBackground;
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            imageText,
            fit: BoxFit.fill,
            width: ScreenConstant.defaultWidthTen * 1.5,
          ),
          SizedBox(height: ScreenConstant.defaultHeightTen),
          Text(
            title,
            style: TextStyles.textStylebottom,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

  Widget _buildMiddleTabItem() {
    return CircleAvatar(
      radius: 37,
      backgroundColor: AppColors.colorTrackButton,
      child: CircleAvatar(
        radius: 30,
        backgroundColor: AppColors.colorArrowButton,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              Assets.track,
              fit: BoxFit.fill,
              width: ScreenConstant.defaultWidthTen * 1.5,
            ),
            SizedBox(height: ScreenConstant.defaultHeightTen),
            Text(
              "Track",
              style: TextStyles.textStylebottom.apply(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
