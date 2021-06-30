import 'package:flutter/material.dart';
import 'package:flutter_ibs/routes/RouteConstants.dart';
import 'package:flutter_ibs/utils/Assets.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/DummyData.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/CustomCheckBox.dart';
import 'package:flutter_ibs/widget/CustomElevatedButton.dart';
import 'package:flutter_ibs/widget/CustomExpansionTile.dart';
import 'package:flutter_ibs/widget/HeaderCard.dart';
import 'package:flutter_ibs/widget/LeadingBackButton.dart';
import 'package:get/get.dart';

class SignupStep2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.colorMyProfileBackground,
        appBar: AppBar(
          elevation: 0,
          leading: LeadingBackButton(
            onPressed: () => Get.back(),
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "MY PROFILE",
            style: TextStyles.appBarTitle,
          ),
        ),
        bottomNavigationBar: Container(
          padding: ScreenConstant.spacingAllLarge,
          color: Colors.white,
          child: CustomElevatedButton(
            widthFactor: 0.8,
            text: "Track Selected Options",
            onTap: () {
              Get.toNamed(signup3);
            },
          ),
        ),
        body: ListView(
          physics: ClampingScrollPhysics(),
          padding: ScreenConstant.spacingAllLarge,
          children: [
            _buildTrackingOptions(),
            _buildSymptoms(),
            SizedBox(height: ScreenConstant.defaultHeightFifteen),
            _buildBowelMovements()
          ],
        ));
  }

  _buildTrackingOptions() {
    return Column(
      children: [
        SizedBox(height: ScreenConstant.defaultHeightTwenty),
        HeaderCard(
          height: ScreenConstant.defaultHeightTwoHundred,
          imageText: Assets.book,
          title: "Tracking Options",
          description: "These can be changed later in settings.",
        ),
        SizedBox(height: ScreenConstant.defaultHeightTwentyThree),
      ],
    );
  }

  _buildSymptoms() {
    return Theme(
      data: Get.theme.copyWith(dividerColor: Colors.transparent),
      child: CustomExpansionTile(
          tilePadding: EdgeInsets.zero,
          onExpansionChanged: (isExpanding) {},
          initiallyExpanded: true,
          title: Container(
            decoration: BoxDecoration(
                color: AppColors.colorBackground,
                borderRadius: BorderRadius.circular(16)),
            child: Row(
              children: [
                CustomCheckBox(
                  checkedFillColor: AppColors.colorYesButton,
                  value: true,
                  onChanged: (val) {
                    //do your stuff here
                  },
                ),
                Text("Symptoms",
                    style: TextStyles.textStyleIntroDescription
                        .apply(color: Colors.white, fontSizeDelta: -3)),
                Spacer(),
                Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: Colors.white,
                ),
                SizedBox(width: ScreenConstant.defaultWidthTwenty)
              ],
            ),
          ),
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16))),
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: DummyData.symptomsList?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  var model = DummyData.symptomsList[index];
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomCheckBox(
                        value: true,
                        onChanged: (val) {
                          //do your stuff here
                        },
                      ),
                      Expanded(
                        child: InkWell(
                            onTap: () {},
                            child: Text(
                              "${model.title}",
                              maxLines: 1,
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.ellipsis,
                            )),
                      )
                    ],
                  );
                },
              ),
            ),
          ]),
    );
  }

  _buildBowelMovements() {
    return Theme(
      data: Get.theme.copyWith(dividerColor: Colors.transparent),
      child: CustomExpansionTile(
          tilePadding: EdgeInsets.zero,
          onExpansionChanged: (isExpanding) {},
          initiallyExpanded: true,
          title: Container(
            decoration: BoxDecoration(
                color: AppColors.colorBackground,
                borderRadius: BorderRadius.circular(16)),
            child: Row(
              children: [
                CustomCheckBox(
                  checkedFillColor: AppColors.colorYesButton,
                  value: true,
                  onChanged: (val) {
                    //do your stuff here
                  },
                ),
                Text("Bowel Movements",
                    style: TextStyles.textStyleIntroDescription
                        .apply(color: Colors.white, fontSizeDelta: -3)),
                Spacer(),
                Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: Colors.white,
                ),
                SizedBox(width: ScreenConstant.defaultWidthTwenty)
              ],
            ),
          ),
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16))),
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: DummyData.symptomsList?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  var model = DummyData.symptomsList[index];
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomCheckBox(
                        value: true,
                        onChanged: (val) {
                          //do your stuff here
                        },
                      ),
                      Expanded(
                        child: InkWell(
                            onTap: () {},
                            child: Text(
                              "${model.title}",
                              maxLines: 1,
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.ellipsis,
                            )),
                      )
                    ],
                  );
                },
              ),
            ),
          ]),
    );
  }
}