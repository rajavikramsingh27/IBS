import 'package:flutter/material.dart';
import 'package:flutter_ibs/utils/Assets.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/CustomArcPainter.dart';
import 'package:flutter_ibs/widget/CustomElevatedButton.dart';
import 'package:get/get.dart';

class DailyLog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(height: ScreenConstant.defaultHeightTen),
            CustomElevatedButton(
              widthFactor: 0.7,
              text: "Go to Treatment Plans",
              onTap: () {},
            ),
            TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text("Cancel",
                    style: TextStyles.textStyleIntroDescription.apply(
                      color: AppColors.colorskip_also_proceed,
                    )))
          ],
        ),
      ),
      backgroundColor: Color(0xff1A103E).withOpacity(0.6),
      body: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Padding(
            padding:
                EdgeInsets.only(top: ScreenConstant.defaultHeightOneThirty),
            child: Stack(
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(top: ScreenConstant.defaultHeightTwenty),
                  child: Card(
                    margin: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    )),
                    child: Column(
                      children: [
                        SizedBox(height: ScreenConstant.defaultHeightSixty),
                        Text(
                          "Treatment Plan",
                          style: TextStyles.textStyleIntroDescription
                              .apply(color: Colors.black, fontSizeDelta: -2),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: ScreenConstant.defaultHeightTen),
                        Text(
                          "Active Treatment Plans",
                          style: TextStyles.textStyleIntroDescription
                              .apply(color: Colors.black, fontSizeDelta: -2),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: ScreenConstant.defaultHeightSixty),
                        Stack(
                          children: [
                            Positioned.fill(
                              top: ScreenConstant.defaultHeightOneHundred,
                              child: _buildDailyLogBg(),
                            ),
                            Container(
                                margin: EdgeInsets.symmetric(
                                  horizontal: ScreenConstant.defaultWidthTwenty,
                                ),
                                child: Column(
                                  children: [
                                    _buildDailyLog(),
                                    SizedBox(
                                        height:
                                            ScreenConstant.defaultHeightSixty),
                                  ],
                                )),
                          ],
                        ),
                        SizedBox(height: ScreenConstant.defaultHeightTwenty),
                      ],
                    ),
                  ),
                ),
                Positioned(right: 0, left: 0, child: CustomArcPainter())
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildDailyLogBg() {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.colorProfileBg,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(24),
              bottomRight: Radius.circular(24))),
      margin: EdgeInsets.only(top: ScreenConstant.defaultHeightTwenty * 1.5),
      width: Get.context.mediaQuerySize.width,
      child: Image.asset(
        Assets.lowFoodbg,
        filterQuality: FilterQuality.high,
        fit: BoxFit.fill,
      ),
    );
  }

  _buildDailyLog() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Card(
          margin: EdgeInsets.zero,
          color: AppColors.colorBackground,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ScreenConstant.defaultWidthTwenty,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: ScreenConstant.defaultHeightTwenty * 1.6),
                _buildTitleRow("Stress Management"),
                SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
                _buildDateTimeRow("Start Date:", "Thue, Jan 8"),
                SizedBox(height: ScreenConstant.defaultHeightSixteen),
                Divider(thickness: 1, color: AppColors.white.withOpacity(0.12)),
                SizedBox(height: ScreenConstant.defaultHeightSixteen),
                _buildTitleRow("Increase Exercise"),
                SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
                _buildDateTimeRow("Start Date:", "Thue, Jan 8"),
                SizedBox(height: ScreenConstant.defaultHeightSixteen),
                Divider(thickness: 1, color: AppColors.white.withOpacity(0.12)),
                SizedBox(height: ScreenConstant.defaultHeightSixteen),
                Text("Past Treatent Plans",
                    style: TextStyles.textStyleIntroDescription
                        .apply(color: Colors.white, fontSizeDelta: -2)),
                SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
                _buildDateTimeRow("Start Date:", "Thue, Jan 8"),
                SizedBox(height: ScreenConstant.defaultHeightSixteen),
                _buildDateTimeRow("End Date:", "Thue, Jan 8"),
                SizedBox(height: ScreenConstant.defaultHeightForty * 1.4),
              ],
            ),
          ),
        ),
      ],
    );
  }

  _buildTitleRow(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: TextStyles.textStyleIntroDescription
                .apply(color: Colors.white, fontSizeDelta: -2)),
        Text("Stop",
            style: TextStyles.textStyleIntroDescription
                .apply(color: Colors.white, fontSizeDelta: -2)),
      ],
    );
  }

  _buildDateTimeRow(String title, String date) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: TextStyles.textStyleRegular.apply(color: Colors.white),
          ),
        ),
        Expanded(
          child: SizedBox(
            height: ScreenConstant.defaultHeightForty * 1.2,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    date,
                    style:
                        TextStyles.textStyleRegular.apply(color: Colors.black),
                  ),
                  Image.asset(Assets.calendar,
                      width: ScreenConstant.defaultWidthTen * 1.3)
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
