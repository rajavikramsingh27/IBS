import 'package:flutter/material.dart';
import 'package:flutter_ibs/controllers/my_profile/MyProfileController.dart';
import 'package:flutter_ibs/utils/Assets.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/DummyData.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/CustomElevatedButton.dart';
import 'package:flutter_ibs/widget/LeadingBackButton.dart';
import 'package:get/get.dart';

class MyProfileStep2 extends StatelessWidget {
  final MyProfileController _controller = Get.put(MyProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.colorMyProfileBackground,
        appBar: AppBar(
          elevation: 0,
          leading: Obx(() => _controller.pagecount2.value >= 1
              ? LeadingBackButton(
                  onPressed: () => _controller.pagecount2.value--,
                )
              : LeadingBackButton(
                  onPressed: () => Get.back(),
                )),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "MY PROFILE",
            style: TextStyles.appBarTitle,
          ),
        ),
        bottomNavigationBar: Obx(() => _controller.pagecount2.value <= 0
            ? Container(
                padding: ScreenConstant.spacingAllLarge,
                color: Colors.white,
                child: CustomElevatedButton(
                  widthFactor: 0.8,
                  text: "Continue",
                  onTap: () {
                    _controller.pagecount2.value++;
                    print("count:${_controller.pagecount2.value}");
                  },
                ),
              )
            : Offstage()),
        body: Obx(() => Stack(
              children: [_toggleView(_controller.pagecount2.value)],
            )));
  }

  _toggleView(int pageCount) {
    switch (pageCount) {
      case 0:
        return _buildRomeIVCriteria();
        break;
      case 1:
        return _buildInformationalQuestions();
        break;
     
      default:
        break;
    }
  }

  _buildRomeIVCriteria() {
    return ListView(physics: ClampingScrollPhysics(), children: [
      SizedBox(height: ScreenConstant.defaultHeightTwentyThree),
      Text("Rome IV Criteria",
          textAlign: TextAlign.center,
          style:
              TextStyles.textStyleIntroDescription.apply(color: Colors.black)),
      SizedBox(height: ScreenConstant.defaultHeightTwentyThree),
      Padding(
        padding: ScreenConstant.spacingAllLarge,
        child: Card(
          elevation: 0,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: ScreenConstant.spacingAllLarge,
            child: Text(
              "No problem. This app can help you track the frequency and nature of your symptoms. Physicians worldwide follow the Rome IV Criteria when diagnosing IBS. \n \n The following questions are for informational purposes only and should not substitute for the medical care and advice of your doctor.",
              style: TextStyles.textDescription,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
      SizedBox(height: ScreenConstant.defaultHeightTwentyThree),
      Padding(
        padding: EdgeInsets.only(left: ScreenConstant.defaultWidthTwenty),
        child: Text(
            "Have you experienced abdominal pain for at least one day per week in the last 3 months ?",
            textAlign: TextAlign.center,
            style: TextStyles.textStyleIntroDescription
                .apply(color: Colors.black, fontSizeDelta: -4)),
      ),
      SizedBox(height: ScreenConstant.defaultHeightTwentyThree),
      Padding(
        padding: ScreenConstant.spacingAllLarge,
        child: Row(
          children: [
            Expanded(
              child: CustomElevatedButton2(
                onTap: () {
                  _controller.pagecount2.value++;
                },
                text: "Yes",
                textColor: Colors.white,
                buttonColor: AppColors.colorYesButton,
              ),
            ),
            SizedBox(width: ScreenConstant.defaultWidthTwenty),
            Expanded(
              child: CustomElevatedButton2(
                onTap: () {
                  _controller.pagecount2.value++;
                },
                text: "No",
                textColor: AppColors.colorButton,
                buttonColor: Colors.white,
              ),
            )
          ],
        ),
      )
    ]);
  }

  _buildInformationalQuestions() {
    return Column(
      children: [
        Container(
          margin: ScreenConstant.spacingAllLarge,
          padding: ScreenConstant.spacingAllLarge,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(16),
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16)),
          ),
          child: Text(
            "Does your abdominal pain occur around the same time you have a bowel movement ?",
            style: TextStyles.textDescription,
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: ScreenConstant.spacingAllLarge,
          child: Row(
            children: [
              Expanded(
                child: CustomElevatedButton2(
                  onTap: () {},
                  text: "Yes",
                  textColor: Colors.white,
                  buttonColor: AppColors.colorYesButton,
                ),
              ),
              SizedBox(width: ScreenConstant.defaultWidthTwenty),
              Expanded(
                child: CustomElevatedButton2(
                  onTap: () {},
                  text: "No",
                  textColor: AppColors.colorTextMoreLess,
                  buttonColor: Colors.white,
                ),
              )
            ],
          ),
        ),
        Container(
          margin: ScreenConstant.spacingAllLarge,
          padding: ScreenConstant.spacingAllLarge,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(16),
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16)),
          ),
          child: Text(
            "When you have  abdominal pain do you have bowel movements either more often or less often than normal ?",
            style: TextStyles.textDescription,
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: ScreenConstant.spacingAllLarge,
          child: Row(
            children: [
              Expanded(
                child: CustomElevatedButton2(
                  onTap: () {},
                  text: "Less",
                  textColor: AppColors.colorTextMoreLess,
                  buttonColor: Colors.white,
                ),
              ),
              SizedBox(width: ScreenConstant.defaultWidthTwenty),
              Expanded(
                child: CustomElevatedButton2(
                  onTap: () {},
                  text: "More",
                  textColor: AppColors.white,
                  buttonColor: AppColors.colorYesButton,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  
}
