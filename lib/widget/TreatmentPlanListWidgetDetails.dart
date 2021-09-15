import 'package:flutter/material.dart';
import 'package:flutter_ibs/models/TreatmentPlanModel/TreatmentPlanResponseModel.dart';
import 'package:flutter_ibs/utils/Assets.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/LeadingBackButton.dart';
import 'package:get/get.dart';

class TreatmentPlanListWidgetDetails extends StatelessWidget {
  final List<Detail> details;
  final String title;

  TreatmentPlanListWidgetDetails({this.details, this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorTracBg,
      appBar: AppBar(
        elevation: 0,
        leading: LeadingBackButton(
          onPressed: () => Get.back(),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          title,
          style: TextStyles.appBarTitle,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: ScreenConstant.defaultWidthTwenty),
            child: Image.asset(
              Assets.settings,
              width: ScreenConstant.defaultWidthTwenty,
            ),
          )
        ],
      ),
      body: ListView.builder(
          shrinkWrap: true,
          padding: ScreenConstant.spacingAllMedium,
          physics: ClampingScrollPhysics(),
          itemCount: details.length,
          itemBuilder: (BuildContext context, int index) {
            return ListView(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              children: [
                details[index].image == null ||details[index].image.filename.isEmpty ||
                        details[index].image.filename == null
                    ? Offstage()
                    : AspectRatio(
                        aspectRatio: 2,
                        child: Image.network(
                          details[index].image.filename,
                          fit: BoxFit.fill,
                        ),
                      ),
                SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
                details[index].heading.isEmpty?Offstage():Text(
                  details[index].heading.tr,
                  style: TextStyles.textStyleIntroDescription
                      .apply(color: Colors.black),
                ),
                SizedBox(height: ScreenConstant.defaultHeightSixteen),
                details[index].body.isEmpty?Offstage():Text(
                  details[index].body.tr,
                  style: TextStyles.textStyleRegular.apply(
                      color: AppColors.colorskip_also_proceed,
                      fontSizeDelta: 1),
                ),
                SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
              ],
            );
          }),
    );
  }
}
