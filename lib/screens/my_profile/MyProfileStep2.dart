import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ibs/controllers/my_profile/MyProfileController.dart';
import 'package:flutter_ibs/routes/RouteConstants.dart';
import 'package:flutter_ibs/utils/Assets.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/DummyData.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/CustomCheckBox.dart';
import 'package:flutter_ibs/widget/CustomDialog.dart';
import 'package:flutter_ibs/widget/CustomElevatedButton.dart';
import 'package:flutter_ibs/widget/CustomPainters.dart';
import 'package:flutter_ibs/widget/LeadingBackButton.dart';
import 'package:get/get.dart';

class MyProfileStep2 extends StatelessWidget {
  final MyProfileController _controller = Get.put(MyProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.colorProfileBg,
        appBar: AppBar(
          elevation: 0,
          leading: Obx(() => _controller.pagecount2.value >= 2
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
        // bottomNavigationBar: Obx(() => _controller.pagecount2.value <= 2
        //     ? Container(
        //         padding: ScreenConstant.spacingAllLarge,
        //         color: Colors.white,
        //         child: CustomElevatedButton(
        //           widthFactor: 0.8,
        //           text: "Continue",
        //           onTap: () {
        //             (_controller.pagecount2.value <= 1)
        //                 ? _controller.pagecount2.value++
        //                 : Get.toNamed(signup);

        //             print("count:${_controller.pagecount2.value}");
        //           },
        //         ),
        //       )
        //     : Offstage()),
        body: Obx(() => Stack(
              fit: StackFit.expand,
              children: [
                _toggleView(_controller.pagecount2.value),
                _buildBottom(),
              ],
            )));
  }

  _buildBottom() {
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: CustomPaint(
              painter: BottomCustomPainter(),
              size: Size(Get.context.mediaQuerySize.width,
                  Get.context.mediaQuerySize.height * 0.2)),
        ),
        Positioned(
          bottom: ScreenConstant.defaultHeightFifteen,
          left: ScreenConstant.defaultWidthTwenty,
          child: Row(
            children: [
              TextButton(
                onPressed: () {},
                child: Text("Skip",
                    style: TextStyles.textStyleRegular.apply(
                        color: AppColors.colorSkipButton, fontSizeDelta: 3)),
              ),
              SizedBox(width: ScreenConstant.defaultWidthNinetyEight),
              TextButton(
                onPressed: () {
                  if (_controller.pagecount2.value <= 3)
                    _controller.pagecount2.value++;
                  else
                    Get.toNamed(signup);
                },
                child: Text("Continue",
                    style: TextStyles.textStyleIntroDescription
                        .apply(color: AppColors.white, fontSizeDelta: -3)),
              ),

              // SizedBox(width: ScreenConstant.defaultWidthTwenty ),
              InkWell(
                onTap: () {
                  if (_controller.pagecount2.value <= 3)
                    _controller.pagecount2.value++;
                  else
                    Get.toNamed(signup);
                },
                child: Container(
                    width: ScreenConstant.defaultWidthNinetyEight,
                    height: ScreenConstant.defaultHeightNinetyEight,
                    child: _buildCircleAvatar()),
              ),
            ],
          ),
        )
      ],
    );
  }

  _toggleView(int pageCount) {
    switch (pageCount) {
      case 0:
        return _buildRomeIVCriteria();
        break;
      case 1:
        return _buildAbdominalPain();
        break;
      case 2:
        return _buildInformationalQuestions();
      case 3:
        return _buildBowelMovement();
      case 4:
        return _buildBristol();
      default:
        break;
    }
  }

  _buildRomeIVCriteria() {
    return ListView(physics: ClampingScrollPhysics(), children: [
      SizedBox(height: ScreenConstant.defaultHeightTwentyThree),
      Center(
          child: Image.asset(Assets.myProfile5,
              width: ScreenConstant.defaultHeightTwoHundredTen)),
      SizedBox(height: ScreenConstant.defaultHeightTwentyThree),
      Text("No problem. This app can help you understand your IBS",
          textAlign: TextAlign.center,
          style:
              TextStyles.textStyleIntroDescription.apply(color: Colors.black)),
      SizedBox(height: ScreenConstant.defaultHeightTwentyThree),
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
                text: "Physicains worldwide follow the ",
                style: TextStyles.textStyleRegular.apply(fontSizeDelta: 2),
                children: <TextSpan>[
                  TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => _buildRomeIVCriteriaDialog(),
                      text: "Rome IV Criteria ",
                      style: TextStyles.textStyleIntroDescription.apply(
                          color: AppColors.colorBackground, fontSizeDelta: -4)),
                  TextSpan(
                      text:
                          "when diagnosing IBS.\n\nThe following questions are for informational purposes only and should not substitute for the medical advice of you doctor.")
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
      SizedBox(height: ScreenConstant.defaultHeightTwentyThree),
      SizedBox(height: ScreenConstant.defaultHeightTwentyThree),
    ]);
  }

  _buildRomeIVCriteriaDialog() {
    Get.dialog(
      CustomDialog(
        title: "Rome IV Criteria",
        description:
            '''Symptom-based criteria of IBS were first developed in 1989 by an international working group based in Rome (the Rome criteria). These criteria have been updated in the Rome Il, III, and most recently, in 2016, the Rome IV criteria for IBS.  According to the Rome IV diagnostic criteria, IBS is characterised by recurrent abdominal pain for, on average, at least one day per week in the past three months, associated with two or more of the following: * Symptoms related to defecation. * Symptoms associated with a  change in stool frequency. * Symptoms associated with a  change in stool form or appearance, based on the Bristol Stool Form Scale (BSFS).''',
      ),
    );
  }

  _buildAbdominalPain() {
    return Padding(
      padding: ScreenConstant.spacingAllLarge,
      child: Column(
        children: [
          SizedBox(height: ScreenConstant.defaultHeightTwentyThree),
          Center(
              child: Image.asset(Assets.myProfile5,
                  width: ScreenConstant.defaultHeightTwoHundredTen)),
          SizedBox(height: ScreenConstant.defaultHeightTwentyThree),
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
          SizedBox(height: ScreenConstant.defaultHeightFifteen),
          Row(
            children: [
              Expanded(
                child: CustomElevatedButton2(
                  onTap: () {
                    _controller.pagecount2.value++;
                  },
                  text: "Yes",
                  textColor: AppColors.colorButton,
                  buttonColor: Colors.white,
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
      padding: ScreenConstant.spacingAllLarge,
      children: [
        SizedBox(height: ScreenConstant.defaultHeightFifteen),
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
              child: Text(
                "Does your abdominal pain occur around the same time you have a bowel movement?",
                textAlign: TextAlign.center,
                style: TextStyles.textStyleRegular.apply(fontSizeDelta: 2),
              ),
            )),
        SizedBox(height: ScreenConstant.defaultHeightFifteen),
        Row(
          children: [
            Expanded(
              child: CustomElevatedButton2(
                onTap: () {
                  _controller.pagecount2.value++;
                },
                text: "Yes",
                textColor: AppColors.colorButton,
                buttonColor: Colors.white,
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
        SizedBox(height: ScreenConstant.defaultHeightFifteen),
        Row(
          children: [
            Expanded(
              child: CustomElevatedButton2(
                onTap: () {
                  _controller.pagecount2.value++;
                },
                text: "Yes",
                textColor: AppColors.colorButton,
                buttonColor: Colors.white,
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
        SizedBox(height: 100),
      ],
    );
  }

  // _buildInformationalQuestions() {
  //   return Column(
  //     children: [
  //       SizedBox(height: ScreenConstant.defaultHeightTwentyThree),
  //       Center(
  //           child: Image.asset(Assets.myProfile5,
  //               width: ScreenConstant.defaultHeightTwoHundredTen)),
  //       SizedBox(height: ScreenConstant.defaultHeightTwentyThree),
  //       Container(
  //         margin: ScreenConstant.spacingAllLarge,
  //         padding: ScreenConstant.spacingAllLarge,
  //         decoration: BoxDecoration(
  //           color: Colors.white,
  //           borderRadius: BorderRadius.only(
  //               topRight: Radius.circular(16),
  //               bottomLeft: Radius.circular(16),
  //               bottomRight: Radius.circular(16)),
  //         ),
  //         child: Text(
  //           "Does your abdominal pain occur around the same time you have a bowel movement ?",
  //           style: TextStyles.textStyleRegular,
  //           textAlign: TextAlign.center,
  //         ),
  //       ),
  //       Padding(
  //         padding: ScreenConstant.spacingAllLarge,
  //         child: Row(
  //           children: [
  //             Expanded(
  //               child: CustomElevatedButton2(
  //                 onTap: () {},
  //                 text: "Yes",
  //                 textColor: AppColors.colorTextMoreLess,
  //                 buttonColor: Colors.white,
  //               ),
  //             ),
  //             SizedBox(width: ScreenConstant.defaultWidthTwenty),
  //             Expanded(
  //               child: CustomElevatedButton2(
  //                 onTap: () {},
  //                 text: "No",
  //                 textColor: AppColors.colorTextMoreLess,
  //                 buttonColor: Colors.white,
  //               ),
  //             )
  //           ],
  //         ),
  //       ),
  //       Container(
  //         margin: ScreenConstant.spacingAllLarge,
  //         padding: ScreenConstant.spacingAllLarge,
  //         decoration: BoxDecoration(
  //           color: Colors.white,
  //           borderRadius: BorderRadius.only(
  //               topRight: Radius.circular(16),
  //               bottomLeft: Radius.circular(16),
  //               bottomRight: Radius.circular(16)),
  //         ),
  //         child: Text(
  //           "When you have  abdominal pain do you have bowel movements either more often or less often than normal ?",
  //           style: TextStyles.textStyleRegular,
  //           textAlign: TextAlign.center,
  //         ),
  //       ),
  //       Padding(
  //         padding: ScreenConstant.spacingAllLarge,
  //         child: Row(
  //           children: [
  //             Expanded(
  //               child: CustomElevatedButton2(
  //                 onTap: () {},
  //                 text: "Less",
  //                 textColor: AppColors.colorTextMoreLess,
  //                 buttonColor: Colors.white,
  //               ),
  //             ),
  //             SizedBox(width: ScreenConstant.defaultWidthTwenty),
  //             Expanded(
  //               child: CustomElevatedButton2(
  //                 onTap: () {},
  //                 text: "More",
  //                 textColor: AppColors.white,
  //                 buttonColor: AppColors.colorYesButton,
  //               ),
  //             ),
  //           ],
  //         ),
  //       )
  //     ],
  //   );
  // }
  _buildBowelMovement() {
    return Padding(
      padding: ScreenConstant.spacingAllLarge,
      child: Column(
        children: [
          SizedBox(height: ScreenConstant.defaultHeightTwentyThree),
          Center(
              child: Image.asset(Assets.myProfile5,
                  width: ScreenConstant.defaultHeightTwoHundredTen)),
          SizedBox(height: ScreenConstant.defaultHeightTwentyThree),
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
          SizedBox(height: ScreenConstant.defaultHeightFifteen),
          Row(
            children: [
              Expanded(
                child: CustomElevatedButton2(
                  onTap: () {
                    _controller.pagecount2.value++;
                  },
                  text: "Yes",
                  textColor: AppColors.colorButton,
                  buttonColor: Colors.white,
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
    return ListView(padding: ScreenConstant.spacingAllLarge, children: [
      SizedBox(height: ScreenConstant.defaultHeightFifteen),
      Text("Rome IV Questionnaire.",
          textAlign: TextAlign.center,
          style:
              TextStyles.textStyleIntroDescription.apply(color: Colors.black)),
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
                          fontSizeDelta: -4, color: AppColors.colorBackground)),
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

  // _buildBristolChart() {
  //   return ListView(
  //     physics: ClampingScrollPhysics(),
  //     children: [
  //       SizedBox(height: ScreenConstant.defaultHeightTwentyThree),
  //       Stack(
  //         children: [
  //           Container(
  //               height: ScreenConstant.defaultWidthOneNinety,
  //               margin: ScreenConstant.spacingAllLarge,
  //               decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.circular(16),
  //                 gradient: LinearGradient(
  //                   colors: <Color>[
  //                     AppColors.colorBackground,
  //                     AppColors.colorBlue2,
  //                     AppColors.colorBlue3,
  //                   ],
  //                   begin: FractionalOffset.topCenter,
  //                   end: FractionalOffset.bottomCenter,
  //                   tileMode: TileMode.repeated,
  //                 ),
  //               )),
  //           Positioned(
  //               top: 0,
  //               child: RotatedBox(
  //                 quarterTurns: 1,
  //                 child: Image.asset(
  //                   "assets/images/intro/curl3.png",
  //                   height: Get.mediaQuery.size.height / 4,
  //                 ),
  //               )),
  //           Align(
  //             alignment: Alignment.center,
  //             child: Container(
  //               alignment: Alignment.center,
  //               height: ScreenConstant.defaultWidthNinetyEight,
  //               width: ScreenConstant.defaultHeightNinetyEight,
  //               decoration: BoxDecoration(
  //                 shape: BoxShape.circle,
  //                 color: AppColors.colorYesButton,
  //               ),
  //               child: Image.asset(Assets.mask_emoji,
  //                   width: ScreenConstant.defaultWidthTwenty * 2),
  //             ),
  //           ),
  //           Positioned(
  //             left: 60,
  //             right: 60,
  //             bottom: 40,
  //             child: Text(
  //                 "When you have abnormal bowel movements, what does your stool usually look like ?",
  //                 textAlign: TextAlign.center,
  //                 style: TextStyles.textStyleIntroDescription
  //                     .apply(color: Colors.white, fontSizeDelta: -3)),
  //           ),
  //         ],
  //       ),
  //       SizedBox(height: ScreenConstant.defaultHeightTwentyThree),
  //       Padding(
  //           padding: ScreenConstant.spacingAllLarge,
  //           child: RichText(
  //             textAlign: TextAlign.center,
  //             text: TextSpan(
  //               text: 'Reference the ',
  //               style: TextStyles.textStyleRegular,
  //               children: <TextSpan>[
  //                 TextSpan(
  //                   recognizer: TapGestureRecognizer()
  //                     ..onTap = () => _buildDialogStool(),
  //                   text: 'Bristol Stool Chart ',
  //                 ),
  //                 TextSpan(
  //                   recognizer: TapGestureRecognizer()
  //                     ..onTap = () => print('Tap Here onTap'),
  //                   text: 'to select the appropriate response',
  //                 ),
  //               ],
  //             ),
  //           )),
  //       SizedBox(height: ScreenConstant.defaultHeightTen),
  //       _buildListIbsType(),
  //       SizedBox(height: ScreenConstant.defaultHeightOneHundred),
  //     ],
  //   );
  // }

  _buildListIbsType() {
    return InkWell(
      onTap: () {
        Get.toNamed(myprofile3);
      },
      child: ListView.builder(
        padding:
            EdgeInsets.symmetric(horizontal: ScreenConstant.defaultWidthTwenty),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: DummyData.ibsTypemedium.length,
        itemBuilder: (BuildContext context, int index) {
          var model = DummyData.ibsTypemedium[index];
          return Card(
            elevation: 0,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: ScreenConstant.defaultHeightFifteen),
              child: Text(model.text,
                  textAlign: TextAlign.center,
                  style: TextStyles.textStyleIntroDescription.apply(
                      color: AppColors.colorBackground, fontSizeDelta: -3)),
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
                      return Container(
                        color: AppColors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              model.image,
                              width: ScreenConstant.defaultWidthOneHundredSeven,
                              height: ScreenConstant.defaultHeightOneHundred,
                            ),
                            SizedBox(height: ScreenConstant.sizeExtraSmall),
                            Text(model.text,
                                textAlign: TextAlign.center,
                                style: TextStyles.textStyleIntroDescription
                                    .apply(
                                        color: Colors.black,
                                        fontSizeDelta: -6)),
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

  Widget _buildCircleAvatar() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final radius = min(constraints.maxHeight / 3, constraints.maxWidth / 3);
        return Center(
          child: CircleAvatar(
            radius: radius,
            backgroundColor: AppColors.colorArrowButton,
            child: Icon(
              Icons.arrow_forward_ios,
              size: 10,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
