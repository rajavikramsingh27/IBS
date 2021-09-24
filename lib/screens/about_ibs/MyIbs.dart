import 'package:flutter/material.dart';
import 'package:flutter_ibs/utils/Assets.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/LeadingBackButton.dart';
import 'package:get/get.dart';

class MyIbs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: AppColors.colorHomeBg,
        backgroundColor: AppColors.white,
        appBar: AppBar(
          leading: LeadingBackButton(onPressed: () => Get.back()),
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "About MyIBS",
            style: TextStyles.appBarTitle,
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 30),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: ScreenConstant.defaultHeightForty),
                decoration: BoxDecoration(
                    color: AppColors.colorBackground,
                    borderRadius: BorderRadius.circular(16)),
                child: Image.asset(
                  Assets.logo,
                  height: ScreenConstant.defaultHeightOneHundred,
                ),
              ),
              SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
              ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 30,
                    );
                  },
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("About MyIBS APP",
                            textAlign: TextAlign.left,
                            style:
                                TextStyles.textStyleIntroDescription.apply()),
                        SizedBox(height: ScreenConstant.defaultHeightSixteen),
                        Text(
                          '''Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. 
            Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.
            Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis 
            enim velit mollit. Exercitation veniam consequat sunt nostrud amet.''',
                          style: TextStyles.textStyleRegular,
                        ),
                      ],
                    );
                  })
            ],
          ),
        ));
  }
}
