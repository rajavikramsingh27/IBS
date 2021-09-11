

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ibs/screens/resources/ResourcesContents.dart';
import 'package:flutter_ibs/screens/resourcesArticleView/resourcesArticleView.dart';
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
import 'package:flutter_ibs/screens/ResourcesAdditionalRelated/ResourcesAdditionalRelated.dart';

class Resources extends StatelessWidget {
  final SignInController _controller = Get.put(SignInController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorHomeBg,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "RESOURCES",
          style: TextStyles.appBarTitle,
        ),
        leading: LeadingBackButton(
          onPressed: () => Get.back(),
        ),
        actions: [
          InkWell(
            onTap: () => Get.toNamed(settings),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: ScreenConstant.defaultWidthTwenty),
              child: Image.asset(
                Assets.settings,
                width: ScreenConstant.defaultWidthTwenty,
              ),
            ),
          )
        ],
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
        shrinkWrap: true,
        itemCount: ResourcesContents().arrResources.length,
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
                ResourcesContents().arrResources[index],
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

          if (index == ResourcesContents().arrResources.length-1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>
                  ResourcesAdditionalRelated()),
            );
          } else {
            final arrResourcesArticleView = [
              ResourcesContents().arrResourcesImages[index],
              ResourcesContents().arrResources[index],
              ResourcesContents().arrResourcesDescription[index],
            ];

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>
                  ResourcesArticleView(
                      arrResourcesArticleView: arrResourcesArticleView)),
            );
          }
        },

      );
    });
  }

}
