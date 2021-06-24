import 'package:flutter/material.dart';
import 'package:flutter_ibs/controllers/my_profile/MyProfileStep1Controller.dart';
import 'package:flutter_ibs/utils/Assets.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/CustomElevatedButton.dart';
import 'package:flutter_ibs/widget/LeadingBackButton.dart';
import 'package:get/get.dart';

class MyProfileStep1 extends StatelessWidget {
  final MyProfileStep1Controller _controller =
      Get.put(MyProfileStep1Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.colorMyProfileBackground,
        appBar: AppBar(
          leading: Obx(() => _controller.pagecount.value >= 1
              ? LeadingBackButton(
                  onPressed: () => _controller.pagecount.value--,
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
        bottomNavigationBar: Obx(() => _controller.pagecount.value <= 1
            ? Container(
                color: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(height: ScreenConstant.defaultHeightTen),
                    CustomElevatedButton(
                      widthFactor: 0.8,
                      text: "Tell me more",
                      onTap: () {
                        _controller.pagecount.value++;
                        print("count:${_controller.pagecount.value}");
                      },
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text("Skip set up, get to tracking!",
                            style: TextStyles.textStyleIntroDescription.apply(
                              color: AppColors.colorskip_also_proceed,
                            )))
                  ],
                ),
              )
            : Offstage()),
        body: Obx(() => Stack(
              children: [_toggleView(_controller.pagecount.value)],
            )));
  }

  _toggleView(int pageCount) {
    switch (pageCount) {
      case 0:
        return _buildProfileStep1();
        break;
      case 1:
        return _buildProfileStep2();
        break;
      case 2:
        return _buildProfileStep3();
        break;
      default:
        break;
    }
  }

  _buildProfileStep1() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: ScreenConstant.defaultHeightTwentyThree),
        Center(
            child: Image.asset(Assets.mprofile1,
                width: ScreenConstant.defaultHeightTwoHundredTen)),
        SizedBox(height: ScreenConstant.defaultHeightTwentyThree),
        Text("You are not alone.",
            style: TextStyles.textStyleIntroDescription
                .apply(color: Colors.black)),
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
                "Did you know that over 5 million Canadians have Irritable Bowel Syndrome? Living with IBS can be a confusing and a frustrating journey",
                style: TextStyles.textDescription,
              ),
            ),
          ),
        )
      ],
    );
  }

  _buildProfileStep2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: ScreenConstant.defaultHeightTwentyThree),
        Center(
            child: Image.asset(Assets.mprofile2,
                width: ScreenConstant.defaultHeightTwoHundredTen)),
        SizedBox(height: ScreenConstant.defaultHeightTwentyThree),
        Text("Your journey begins today.",
            style: TextStyles.textStyleIntroDescription
                .apply(color: Colors.black)),
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
                "Research shows that the average person will wait 4 years before a diagnosis of IBS is established. \n \n Tracking your symptoms is a positive step towards managing your IBS.",
                style: TextStyles.textDescription,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        )
      ],
    );
  }

  _buildProfileStep3() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: ScreenConstant.defaultHeightTwentyThree),
        Center(
            child: Image.asset(Assets.mprofile3,
                width: ScreenConstant.defaultHeightTwoHundredTen)),
        SizedBox(height: ScreenConstant.defaultHeightTwentyThree),
        Text("First, let's understood more \n about you.",
            textAlign: TextAlign.center,
            style: TextStyles.textStyleIntroDescription
                .apply(color: Colors.black)),
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
                "Have you been diagnosed with IBS by a health care provider ?",
                style: TextStyles.textDescription,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        SizedBox(height: ScreenConstant.defaultHeightTwentyThree),
        Padding(
          padding: ScreenConstant.spacingAllLarge,
          child: Row(
            children: [
              Expanded(
                child: CustomElevatedButton2(
                  onTap: () {},
                  text: "Yes, I have",
                  textColor: Colors.white,
                  buttonColor: AppColors.colorYesButton,
                ),
              ),
              SizedBox(width: ScreenConstant.defaultWidthTwenty),
              Expanded(
                child: CustomElevatedButton2(
                  onTap: () {},
                  text: "No, not yet",
                  textColor: AppColors.colorButton,
                  buttonColor: Colors.white,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
