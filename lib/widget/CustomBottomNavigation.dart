import 'package:flutter/material.dart';
import 'package:flutter_ibs/routes/RouteConstants.dart';
import 'package:flutter_ibs/utils/Assets.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/BottomTabPainter.dart';
import 'package:get/get.dart';

class CustomBottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                        onTap: () {
                          Get.toNamed(report);
                        },
                        title: "Reports",
                        imageText: Assets.report),
                    Container(width: context.mediaQuerySize.width * 0.13),
                    _buildTabItem(
                        title: "Resources", imageText: Assets.resources),
                    _buildTabItem(
                        onTap: () {
                          Get.toNamed(myIbs);
                        },
                        title: "My IBS",
                        imageText: Assets.profile),
                  ]),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTabItem(
      { String title,
       String imageText,
      int index,
      Function() onTap

      // ValueChanged<int> onPressed,
      }) {
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
