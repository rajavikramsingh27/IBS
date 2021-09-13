

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/HexColor.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/LeadingBackButton.dart';
import 'package:get/get.dart';
import 'package:flutter_ibs/widget/CustomBottomNavigation.dart';


import 'package:flutter/services.dart';
import 'package:flutter_ibs/controllers/signIn/SignInController.dart';
import 'package:flutter_ibs/routes/RouteConstants.dart';
import 'package:flutter_ibs/utils/Assets.dart';
import 'package:flutter_ibs/utils/Validator.dart';
import 'package:flutter_ibs/widget/CustomTextFormField%20.dart';



class Resources extends StatelessWidget {
  final SignInController _controller = Get.put(SignInController());

  final arrResources = [
    'Think you may have IBS?',
    'What is IBS?',
    'Signs and Symptoms of IBS',
    'IBS Frequently Asked Questions',
    'Links to Additional IBS Related Content'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorHomeBg,
      appBar: AppBar(
        elevation: 0,
        leading: LeadingBackButton(
          onPressed: () => Get.back(),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "RESOURCES",
          style: TextStyles.appBarTitle,
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.only(
              left: ScreenConstant.defaultHeightSixteen,
              right: ScreenConstant.defaultHeightSixteen,
              top: ScreenConstant.defaultHeightSixteen,
              bottom: Get.context.mediaQuerySize.height * 0.13,
            ),
            child: Column(
              children: [
                Container(
                  // height: ScreenConstant.defaultHeightTwoHundred,
                  color: Colors.white,
                  child: Image.asset(
                    Assets.resources_1,
                  ),
                ),
                SizedBox(height: ScreenConstant.defaultHeightTwenty,),
                Text(
                  'Search all Resources',
                  style: TextStyles.textStyleSettingQuestionaireButton,
                ),
                SizedBox(height: ScreenConstant.defaultHeightTen,),
                Container(
                  height: ScreenConstant.defaultHeightSixty,
                  padding: EdgeInsets.only(
                    left: ScreenConstant.defaultHeightSixteen,
                    right: ScreenConstant.defaultHeightSixteen,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(ScreenConstant.defaultHeightTen),
                  ),
                  child: CustomTextFormField(
                    validationFunction: Validator().validateEmail,
                    controller: _controller.emailController,
                    inputFormatters: [LengthLimitingTextInputFormatter(50)],
                    suffixIcon: Padding(
                      padding: ScreenConstant.spacingAllSmall,
                      child: Icon(
                        Icons.search,
                        color: HexColor('CAC3E1'),
                        size: ScreenConstant.defaultHeightForty,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: ScreenConstant.defaultHeightTwenty,),
                buildResourcesList(),
              ],
            ),
          ),
          Positioned(
              bottom: 0, left: 0, right: 0, child: CustomBottomNavigation()),
        ],
      ),
    );
  }

  Widget buildResourcesList() {
    return ListView.separated(
        itemCount: arrResources.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        separatorBuilder: (context, index) {
          return Container(
            height: 2,
          );
        }, itemBuilder: (context, index) {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          padding: EdgeInsets.all(0),
          elevation: 0
        ),
        child: Container(
          padding: ScreenConstant.spacingAllSmall,
          height: 70,
          decoration: BoxDecoration(
            color: Colors.white,
            // borderRadius: BorderRadius.circular(16),
            // border: Border.all(color: AppColors.colorBorder, width: 1)
          ),
          child: ListTile(
            dense: true,
            contentPadding: EdgeInsets.zero,
            title: Padding(
              padding: EdgeInsets.only(left: ScreenConstant.sizeXXL),
              child: Text(
                arrResources[index],
                style: TextStyles.textStyleSettingQuestionaireBlack,
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_outlined,
              color: AppColors.colorArrowButton,
              size: FontSize.s16,
            ),
          ),
        ),
        onPressed: () {
          Get.toNamed(resourcesArticleView);
        },
      );
    });
  }

}
