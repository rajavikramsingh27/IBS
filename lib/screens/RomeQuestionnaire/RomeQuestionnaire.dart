


import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ibs/controllers/my_profile/MyProfileController.dart';
import 'package:flutter_ibs/utils/Assets.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/DummyData.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/BottomWidget.dart';
import 'package:flutter_ibs/widget/CustomDialog.dart';
import 'package:flutter_ibs/widget/CustomElevatedButton.dart';
import 'package:flutter_ibs/widget/LeadingBackButton.dart';
import 'package:get/get.dart';
import 'package:flutter_ibs/utils/HexColor.dart';
import 'package:flutter_ibs/utils/ShadowContainer.dart';


class RomeQuestionnaire extends StatelessWidget {
  final MyProfileController _controller = Get.put(MyProfileController());

  @override
  Widget build(BuildContext context) {

    return Scaffold (
      backgroundColor: AppColors.colorProfileBg,
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
          "ROME IV QUESTIONNAIRE",
          style: TextStyles.appBarTitle,
        ),
      ),
      body: Obx(() => Stack(
        fit: StackFit.expand,
        children: [
          _toggleView(_controller.pagecount2.value),
          (_controller.pagecount2.value > 1) ? _buildBottom() : SizedBox(height: 1,),
        ],
      )),
    );
  }

  _buildBottom() {
    return BottomWidget(
      onContinueTap: () {
        if (_controller.pagecount2.value <= 4)
          _controller.pagecount2.value++;
        // else
        //   Get.toNamed(signup);
      },
      onCircleTap: () {
        if (_controller.pagecount2.value <= 4)
          _controller.pagecount2.value++;
        // else
        //   Get.toNamed(signup);
      },
    );
  }

  _toggleView(int pageCount) {
    switch (pageCount) {
      case 0:
        return _buildStartQuestionnaire();
        break;
      case 1:
        return _buildRetakeQuestionnaire();
        break;
      case 2:
        return _buildAbdominalPain();
        break;
      case 3:
        return _buildInformationalQuestions();
      case 4:
        return _buildBowelMovement();
      case 5:
        return _buildBristol();
      default:
        break;
    }
  }

  // Physicians worldwide follow the Rome IV criteria when diagnosing IBS.
  // The following questions are for informational purposes only and should not substitute
  // for the medical advice of you doctor.


  _buildStartQuestionnaire() {
    return ListView(
        padding: ScreenConstant.spacingAllLarge,
        children: [
          SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
          Text("Rome IV Questionnaire.",
            textAlign: TextAlign.center,
            style: TextStyles.textStyleSettingTitle
          ),
          SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
          Center(
              child: Image.asset(Assets.myProfile5,
                  width: ScreenConstant.defaultHeightTwoHundredTen)
          ),
          SizedBox(height: ScreenConstant.defaultHeightForty),
          Card(
            elevation: 0,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
                padding: EdgeInsets.only(
                    left: ScreenConstant.defaultHeightForty-10,
                    right: ScreenConstant.defaultHeightForty-10,
                    top: ScreenConstant.defaultHeightForty-10,
                    bottom: ScreenConstant.defaultHeightForty-10,
                ),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "Physicians worldwide follow the ",
                    style: TextStyles.textStyleSettingQuestionaireBlack,
                    children: <TextSpan>[
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => _buildAbdominalPainDialog(),
                          text: "Rome IV criteria  ",
                        style: TextStyles.textStyleSettingQuestionaireBlue,
                      ),
                      TextSpan(
                          text:
                          "when diagnosing IBS. \n\n"
                              "The following questions are for informational purposes only and should not substitute"
                              "for the medical advice of you doctor.")
                    ],
                  ),
                )

              // Text(
              //   "Providing detailed information about your IBS symptoms can help your health care provider recommended treatment options.",
              //   style: TextStyles.textStyleRegular,
              //   textAlign: TextAlign.center,
              // ),
            ),
          ),
          SizedBox(height: ScreenConstant.defaultHeightSixteen),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: AppShadow().shadowSettingQuestionaire(),
                height: 54,
                width: 230,
                child: TextButton(
                  child: Text(
                    "Start Questionnaire",
                    textAlign: TextAlign.center,
                    style: TextStyles.textStyleSettingTitle
                  ),
                  onPressed: () {
                    if (_controller.pagecount2.value <= 4)
                      _controller.pagecount2.value++;
                    // else
                    //   Get.toNamed(signup);
                  },
                ),
              ),
            ],
          )
        ]
    );
  }

  _buildRetakeQuestionnaire() {
    return ListView(
        padding: ScreenConstant.spacingAllLarge,
        children: [
          SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
          Text("Rome IV Questionnaire",
            textAlign: TextAlign.center,
              style: TextStyles.textStyleSettingTitle
          ),
          SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
          Padding(
            padding: EdgeInsets.only(
                left: ScreenConstant.defaultHeightTwentyFour, right: ScreenConstant.defaultHeightTwentyFour
            ),
            child: Text(
              "You have taken the Rome IV.  "
                  "You may retake the questionnaire by selecting “Retake Questionnaire” below.",
              textAlign: TextAlign.center,
              style: TextStyles.textStyleRegular.apply(
                color: AppColors.colorBlue2
              )
            ),
          ),
          SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
          Center(
              child: Image.asset(
                  'assets/images/my_profile/retakeQuestionnaire.png',
                  width: ScreenConstant.defaultHeightTwoHundredTen
              )
          ),
          SizedBox(height: ScreenConstant.defaultHeightForty),
          Text(
            "Based on the Rome IV criteria \nyou may have IBS-D.",
            textAlign: TextAlign.center,
            style: TextStyles.textStyleIntroDescription.apply(
              color: Colors.black
            )
          ),
          SizedBox(height: ScreenConstant.defaultHeightForty),
          Padding(
              padding: EdgeInsets.only(
                  left: ScreenConstant.defaultHeightTwentyFour,
                  right: ScreenConstant.defaultHeightTwentyFour,
                  bottom: ScreenConstant.defaultHeightTwentyFour
              ),
              child: Text(
                "Its important to understand that this is not a diagnosis. "
                    "\n\nContinue to track your symptoms and take these test results "
                    "and your symptom tracker to your next appointment With your doctor.",
                textAlign: TextAlign.center,
                style: TextStyles.textStyleRegular
              )

            // Text(
            //   "Providing detailed information about your IBS symptoms can help your health care provider recommended treatment options.",
            //   style: TextStyles.textStyleRegular,
            //   textAlign: TextAlign.center,
            // ),
          ),
          SizedBox(height: ScreenConstant.defaultHeightSixteen),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: AppShadow().shadowSettingQuestionaire(),
                height: 54,
                width: 230,
                child: TextButton(
                  child: Text(
                    "Retake Questionnaire",
                    textAlign: TextAlign.center,
                      style: TextStyles.textStyleSettingQuestionaireButton
                  ),
                  onPressed: () {
                    if (_controller.pagecount2.value <= 4)
                      _controller.pagecount2.value++;
                    // else
                    //   Get.toNamed(signup);
                  },
                ),
              ),
            ],
          )
        ]
    );
  }


  _buildAbdominalPain() {
    return Padding(
      padding: ScreenConstant.spacingAllLarge,
      child: Column(
        children: [
          SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
          Center(
              child: Image.asset(Assets.myProfile5,
                  width: ScreenConstant.defaultHeightTwoHundredTen)),
          SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
          Text("Rome IV Questionnaire.",
              textAlign: TextAlign.center,
              style: TextStyles.textStyleIntroDescription
                  .apply(color: Colors.black)),
          SizedBox(height: ScreenConstant.defaultHeightForty),
          Card(
            elevation: 0,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
                padding: ScreenConstant.spacingAllLarge,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "Have you experienced ",
                    style: TextStyles.textStyleRegular.apply(fontSizeDelta: 2),
                    children: <TextSpan>[
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => _buildAbdominalPainDialog(),
                          text: "abdominal pain ",
                          style: TextStyles.textStyleIntroDescription.apply(
                              color: AppColors.colorBackground,
                              fontSizeDelta: -4)),
                      TextSpan(
                          text:
                          "for at least one day per week in the last 3 months?")
                    ],
                  ),
                )

              // Text(
              //   "Providing detailed information about your IBS symptoms can help your health care provider recommended treatment options.",
              //   style: TextStyles.textStyleRegular,
              //   textAlign: TextAlign.center,
              // ),
            ),
          ),
          SizedBox(height: ScreenConstant.defaultHeightSixteen),
          Row(
            children: [
              Expanded(
                child: Obx(
                      () => CustomElevatedButton2(
                    onTap: () {
                      _controller.isDiagnoisedAbdominalPain.value = true;
                    },
                    text: "Yes",
                    textColor:
                    _controller.isDiagnoisedAbdominalPain.value == false
                        ? AppColors.colorButton
                        : Colors.white,
                    buttonColor:
                    _controller.isDiagnoisedAbdominalPain.value == false
                        ? Colors.white
                        : AppColors.colorYesButton,
                  ),
                ),
              ),
              SizedBox(width: ScreenConstant.defaultWidthTwenty),
              Expanded(
                child: Obx(
                      () => CustomElevatedButton2(
                    onTap: () {
                      _controller.isDiagnoisedAbdominalPain.value = false;
                    },
                    text: "No",
                    textColor:
                    _controller.isDiagnoisedAbdominalPain.value == true
                        ? AppColors.colorButton
                        : Colors.white,
                    buttonColor:
                    _controller.isDiagnoisedAbdominalPain.value == true
                        ? Colors.white
                        : AppColors.colorYesButton,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  _buildAbdominalPainDialog() {
    Get.dialog(
      CustomDialog(
        title: "Abdominal Pain",
        description:
        '''Other terms used to describe abdominal pain are stomach ache, tummy ache, gut ache, and bellyache.''',
      ),
    );
  }

  _buildInformationalQuestions() {
    return ListView(
      physics: ClampingScrollPhysics(),
      padding: ScreenConstant.spacingAllLarge,
      children: [
        SizedBox(height: ScreenConstant.defaultHeightSixteen),
        Text("Rome IV Questionnaire.",
            textAlign: TextAlign.center,
            style: TextStyles.textStyleIntroDescription
                .apply(color: Colors.black)
        ),
        SizedBox(height: ScreenConstant.defaultHeightForty),
        Card(
            elevation: 0,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: ScreenConstant.spacingAllLarge,
              child: Text(
                "Does your abdominal pain occur around the same time you have a bowel movement?",
                textAlign: TextAlign.center,
                style: TextStyles.textStyleRegular.apply(fontSizeDelta: 2),
              ),
            )),
        SizedBox(height: ScreenConstant.defaultHeightSixteen),
        Row(
          children: [
            Expanded(
              child: Obx(
                    () => CustomElevatedButton2(
                  onTap: () {
                    _controller.isabdominalPainTimeBowel.value = true;
                  },
                  text: "Yes",
                  textColor: _controller.isabdominalPainTimeBowel.value == true
                      ? AppColors.white
                      : AppColors.colorButton,
                  buttonColor:
                  _controller.isabdominalPainTimeBowel.value == true
                      ? AppColors.colorYesButton
                      : Colors.white,
                ),
              ),
            ),
            SizedBox(width: ScreenConstant.defaultWidthTwenty),
            Expanded(
              child: Obx(
                    () => CustomElevatedButton2(
                  onTap: () {
                    _controller.isabdominalPainTimeBowel.value = false;
                  },
                  text: "No",
                  textColor: _controller.isabdominalPainTimeBowel.value == false
                      ? AppColors.white
                      : AppColors.colorButton,
                  buttonColor:
                  _controller.isabdominalPainTimeBowel.value == false
                      ? AppColors.colorYesButton
                      : Colors.white,
                ),
              ),
            )
          ],
        ),
        SizedBox(height: ScreenConstant.defaultHeightForty * 2.5),
        Card(
            elevation: 0,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: ScreenConstant.spacingAllLarge,
              child: Text(
                "When you have abdominal pain do you have bowel movements either more often or less often than normal?",
                textAlign: TextAlign.center,
                style: TextStyles.textStyleRegular.apply(fontSizeDelta: 2),
              ),
            )),
        SizedBox(height: ScreenConstant.defaultHeightSixteen),
        Row(
          children: [
            Expanded(
              child: Obx(
                    () => CustomElevatedButton2(
                  onTap: () {
                    _controller.isabdominalPainBowelMoreLess.value = true;
                  },
                  text: "Yes",
                  textColor:
                  _controller.isabdominalPainBowelMoreLess.value == true
                      ? AppColors.white
                      : AppColors.colorButton,
                  buttonColor:
                  _controller.isabdominalPainBowelMoreLess.value == true
                      ? AppColors.colorYesButton
                      : Colors.white,
                ),
              ),
            ),
            SizedBox(width: ScreenConstant.defaultWidthTwenty),
            Expanded(
              child: Obx(
                    () => CustomElevatedButton2(
                  onTap: () {
                    _controller.isabdominalPainBowelMoreLess.value = false;
                  },
                  text: "No",
                  textColor:
                  _controller.isabdominalPainBowelMoreLess.value == false
                      ? AppColors.white
                      : AppColors.colorButton,
                  buttonColor:
                  _controller.isabdominalPainBowelMoreLess.value == false
                      ? AppColors.colorYesButton
                      : Colors.white,
                ),
              ),
            )
          ],
        ),
        SizedBox(height: 100),
      ],
    );
  }

  _buildBowelMovement() {
    return Padding(
      padding: ScreenConstant.spacingAllLarge,
      child: Column(
        children: [
          SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
          Center(
              child: Image.asset(Assets.myProfile5,
                  width: ScreenConstant.defaultHeightTwoHundredTen)),
          SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
          Text("Rome IV Questionnaire.",
              textAlign: TextAlign.center,
              style: TextStyles.textStyleIntroDescription
                  .apply(color: Colors.black)),
          SizedBox(height: ScreenConstant.defaultHeightForty),
          Card(
            elevation: 0,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              // borderRadius: BorderRadius.circular(16),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
            ),
            child: Padding(
                padding: ScreenConstant.spacingAllLarge,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text:
                    "When you have abdominal pain, do your bowel movements appear ",
                    style: TextStyles.textStyleRegular.apply(fontSizeDelta: 2),
                    children: <TextSpan>[
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => _buildBowelMovementDialog(),
                          text: "different than normal?",
                          style: TextStyles.textStyleIntroDescription.apply(
                              color: AppColors.colorBackground,
                              fontSizeDelta: -4)),
                    ],
                  ),
                )),
          ),
          SizedBox(height: ScreenConstant.defaultHeightSixteen),
          Row(
            children: [
              Expanded(
                child: Obx(
                      () => CustomElevatedButton2(
                    onTap: () {
                      _controller.isabdominalPainBowelAppearDifferent.value =
                      true;
                    },
                    text: "Yes",
                    textColor:
                    _controller.isabdominalPainBowelMoreLess.value == true
                        ? AppColors.white
                        : AppColors.colorButton,
                    buttonColor:
                    _controller.isabdominalPainBowelMoreLess.value == true
                        ? AppColors.colorYesButton
                        : Colors.white,
                  ),
                ),
              ),
              SizedBox(width: ScreenConstant.defaultWidthTwenty),
              Expanded(
                child: Obx(
                      () => CustomElevatedButton2(
                    onTap: () {
                      _controller.isabdominalPainBowelAppearDifferent.value =
                      false;
                    },
                    text: "No",
                    textColor:
                    _controller.isabdominalPainBowelMoreLess.value == false
                        ? AppColors.white
                        : AppColors.colorButton,
                    buttonColor:
                    _controller.isabdominalPainBowelMoreLess.value == false
                        ? AppColors.colorYesButton
                        : Colors.white,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  _buildBowelMovementDialog() {
    Get.dialog(
      CustomDialog(
        title: "Bowel Movement Changes",
        description:
        '''Differences can be either softer or harder than your usual bowel movements.''',
      ),
    );
  }

  _buildBristol() {
    return ListView(
        physics: ClampingScrollPhysics(),
        padding: ScreenConstant.spacingAllLarge,
        children: [
          SizedBox(height: ScreenConstant.defaultHeightSixteen),
          Text("Rome IV Questionnaire.",
              textAlign: TextAlign.center,
              style: TextStyles.textStyleIntroDescription
                  .apply(color: Colors.black)),
          SizedBox(height: ScreenConstant.defaultHeightForty),
          Card(
            elevation: 0,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              // borderRadius: BorderRadius.circular(16),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
            ),
            child: Padding(
                padding: ScreenConstant.spacingAllLarge,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text:
                    'When you have abnormal bowel movements, what does your stool usually look like?\n\nReference the ',
                    style: TextStyles.textStyleRegular.apply(fontSizeDelta: 2),
                    children: <TextSpan>[
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => _buildDialogStool(),
                          text: 'Bristol Stool Chart ',
                          style: TextStyles.textStyleIntroDescription.apply(
                              fontSizeDelta: -4,
                              color: AppColors.colorBackground)),
                      TextSpan(
                        text: 'to select the appropriate response',
                      ),
                    ],
                  ),
                )),
          ),
          SizedBox(height: ScreenConstant.defaultHeightTen),
          _buildListIbsType(),
          SizedBox(height: ScreenConstant.defaultHeightOneHundred),
        ]);
  }

  _buildListIbsType() {
    return InkWell(
      onTap: () {
        // Get.toNamed(myprofile3);
      },
      child: ListView.builder(
        padding:
        EdgeInsets.symmetric(horizontal: ScreenConstant.defaultWidthTwenty),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: DummyData.ibsTypemedium.length,
        itemBuilder: (BuildContext context, int index) {
          var model = DummyData.ibsTypemedium[index];
          return Obx(
                () => GestureDetector(
              onTap: () {
                _controller.selectedStoolType.value = index;
                _controller.selectStoolType(index);
              },
              child: Card(
                elevation: 0,
                color: _controller.selectedStoolType.value == index
                    ? AppColors.colorYesButton
                    : Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: ScreenConstant.defaultHeightSixteen),
                  child: Text(model.text,
                      textAlign: TextAlign.center,
                      style: TextStyles.textStyleIntroDescription.apply(
                          color: _controller.selectedStoolType.value == index
                              ? Colors.white
                              : AppColors.colorBackground,
                          fontSizeDelta: -3)),
                ),

                //  ListTile(
                //   dense: true,
                //   leading: Image.asset(model.image,
                //       width: ScreenConstant.defaultWidthTwenty),
                //   title: Text("${model.text}",
                //       style: TextStyles.textStyleIntroDescription
                //           .apply(color: Colors.black, fontSizeDelta: -3)),
                //   trailing: InkWell(
                //       onTap: () {
                //         _controller.checkBoxValue.value =
                //             !_controller.checkBoxValue.value;
                //       },
                //       child: _controller.checkBoxValue.value
                //           ? CustomCheckBox(
                //               value: _controller.checkBoxValue.value,
                //             )
                //           : CustomCheckBox(
                //               value: _controller.checkBoxValue.value,
                //             )),
                // ),
              ),
            ),
          );
        },
      ),
    );
  }

  _buildDialogStool() {
    return Get.dialog(
      Material(
        type: MaterialType.transparency,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              margin: ScreenConstant.spacingAllLarge,
              child: ListView(
                physics: ClampingScrollPhysics(),
                children: [
                  Padding(
                    padding: ScreenConstant.spacingAllLarge,
                    child: Text("Bristol Stool Chart",
                        textAlign: TextAlign.start,
                        style: TextStyles.textStyleIntroDescription
                            .apply(color: AppColors.colorButton)),
                  ),
                  GridView.builder(
                    padding: ScreenConstant.spacingAllLarge,
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: DummyData.stoolChart.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: ScreenConstant.sizeExtraSmall,
                      mainAxisSpacing: ScreenConstant.sizeExtraSmall,
                      //  childAspectRatio:screenHeight<743?screenHeight / (screenHeight /.9):screenHeight / (screenHeight /.8),
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      var model = DummyData.stoolChart[index];
                      return Card(
                        margin: EdgeInsets.zero,
                        elevation: 0,
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Image.asset(
                                model.image,
                                width:
                                ScreenConstant.defaultWidthOneHundredSeven,
                                height: ScreenConstant.defaultHeightOneHundred,
                              ),
                            ),
                            SizedBox(height: ScreenConstant.sizeExtraSmall),
                            Text(model.text,
                                textAlign: TextAlign.center,
                                style: TextStyles.textStyleIntroDescription
                                    .apply(
                                    color: Colors.black,
                                    fontSizeDelta: -6
                                )
                            ),
                            SizedBox(height: ScreenConstant.sizeExtraSmall),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: AppColors.colorButton,
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: ScreenConstant.sizeExtraSmall,
                                  vertical: 1),
                              child: FittedBox(
                                fit: BoxFit.contain,
                                child: Text(model.type,
                                    style: TextStyles.textStyleIntroDescription
                                        .apply(
                                        color: Colors.white,
                                        fontSizeDelta: -9)),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Positioned(
              right: 10,
              top: 10,
              child: GestureDetector(
                onTap: () => Get.back(),
                child: CircleAvatar(
                  backgroundColor: AppColors.colorCloseLight,
                  radius: 20,
                  child: CircleAvatar(
                      backgroundColor: AppColors.colorCloseLight,
                      radius: 18,
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                        size: FontSize.s15,
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}

