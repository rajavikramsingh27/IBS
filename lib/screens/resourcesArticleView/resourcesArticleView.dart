
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/LeadingBackButton.dart';
import 'package:get/get.dart';
import 'package:flutter_ibs/routes/RouteConstants.dart';
import 'package:flutter_ibs/utils/Assets.dart';
import 'package:flutter_ibs/utils/Assets.dart';


class ResourcesArticleView extends StatelessWidget {

  final List<dynamic> arrResourcesArticleView;

  ResourcesArticleView({Key key,  this.arrResourcesArticleView}) : super(key: key);

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
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          left: ScreenConstant.defaultHeightThirty,
          right: ScreenConstant.defaultHeightThirty,
          top: ScreenConstant.defaultHeightSixteen,
          bottom: ScreenConstant.defaultHeightSixteen,
        ),
        child: Column(
          children: [
            ClipRRect(
                child: Image.asset(
                  Assets.baseImage+'/resources/'+this.arrResourcesArticleView[0],
                  fit: BoxFit.fill,
                  width: MediaQuery.of(context).size.width,
                ),
                borderRadius: BorderRadius.circular(16)
            ),
            SizedBox(height: ScreenConstant.defaultHeightTwenty,),
            Container(
              width: double.infinity,
              child: Text(
                this.arrResourcesArticleView[1],
                style: TextStyles.textStyleSettingTitle.apply(
                  color: Colors.black
                ),
              ),
            ),
            SizedBox(height: ScreenConstant.defaultHeightTwenty,),
            Container(
              width: double.infinity,
              child: this.arrResourcesArticleView[2]
            ),
          ],
        ),
      ),
    );
  }
}
