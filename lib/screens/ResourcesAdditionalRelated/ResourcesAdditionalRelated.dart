




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ibs/screens/resources/ResourcesContents.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/LeadingBackButton.dart';
import 'package:get/get.dart';
import 'package:flutter_ibs/routes/RouteConstants.dart';
import 'package:flutter_ibs/utils/Assets.dart';
import 'package:url_launcher/url_launcher.dart';




class ResourcesAdditionalRelated extends StatelessWidget {
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
          left: ScreenConstant.defaultHeightSixteen,
          right: ScreenConstant.defaultHeightSixteen,
          top: ScreenConstant.defaultHeightSixteen,
          bottom: ScreenConstant.defaultHeightSixteen,
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                Assets.resources_2,
              ),
            ),
            SizedBox(height: ScreenConstant.defaultHeightTwenty+10,),
            Container(
              width: double.infinity,
              child: Text(
                'Links to Additional IBS Related Content:',
                style: TextStyles.textStyleSettingNotificationsResourceTitle,
              ),
            ),
            SizedBox(height: ScreenConstant.defaultHeightTwenty,),
            buildResourcesList(),
          ],
        ),
      ),
    );
  }

  Widget buildResourcesList() {
    return ListView.separated(
        shrinkWrap: true,
        itemCount: ResourcesContents().arrResourcesAdditionalRelated.length,
        physics: NeverScrollableScrollPhysics(),
        separatorBuilder: (context, index) {
          if (index == 4) {
            return Container(
              padding: EdgeInsets.only(
                top: 10, bottom: 10
              ),
              width: double.infinity,
              child: Text(
                'Links to Additional IBS Related Content:',
                style: TextStyles.textStyleSettingNotificationsResourceTitle,
              ),
            );
          } else {
            return Container(
              height: 2,
            );
          }
        }, itemBuilder: (context, index) {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Colors.transparent,
            padding: EdgeInsets.all(0),
            elevation: 0
        ),
        child: ListTile(
          dense: true,
          contentPadding: EdgeInsets.all(0),
          title: Padding(
            padding: EdgeInsets.all(6),
            child: Text(git
              ResourcesContents().arrResourcesAdditionalRelated[index],
              style: TextStyles.textStyleSettingNotificationsResourceSubTitle,
            ),
          ),
        ),
        onPressed: () async {
          final _url = ResourcesContents().arrResourcesAdditionalRelatedLinks[index];
          await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
        },

      );
    });
  }

}
