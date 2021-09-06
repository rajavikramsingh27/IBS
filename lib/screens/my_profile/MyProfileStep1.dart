import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ibs/controllers/my_profile/MyProfileController.dart';
import 'package:flutter_ibs/routes/RouteConstants.dart';
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

class MyProfileStep1 extends StatelessWidget {
  final MyProfileController _controller = Get.put(MyProfileController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: AppColors.colorProfileBg,
        appBar: AppBar(
          elevation: 0,
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
        // bottomNavigationBar: _buildBottom(),
        // bottomNavigationBar:
        // Obx(() => _controller.pagecount.value <= 1
        //     ? Container(
        //         color: Colors.white,
        //         child: Column(
        //           mainAxisSize: MainAxisSize.min,
        //           mainAxisAlignment: MainAxisAlignment.end,
        //           children: [
        //             SizedBox(height: ScreenConstant.defaultHeightTen),
        //             CustomElevatedButton(
        //               widthFactor: 0.8,
        //               text: "Tell me more",
        //               onTap: () {
        //                 _controller.pagecount.value++;
        //                 print("count:${_controller.pagecount.value}");
        //               },
        //             ),
        //             TextButton(
        //                 onPressed: () {},
        //                 child: Text("Skip set up, get to tracking!",
        //                     style: TextStyles.textStyleIntroDescription.apply(
        //                       color: AppColors.colorskip_also_proceed,
        //                     )))
        //           ],
        //         ),
        //       )
        //     : _controller.pagecount.value == 2 ||
        //             _controller.pagecount.value == 3
        //         ? Container(
        //             padding: ScreenConstant.spacingAllLarge,
        //             color: Colors.white,
        //             child: CustomElevatedButton(
        //               widthFactor: 0.8,
        //               text: "Continue",
        //               onTap: () {
        //                 if (_controller.pagecount.value == 2)
        //                   _controller.pagecount.value++;
        //                 else {
        //                   Get.toNamed(signup);
        //                 }
        //                 print("count:${_controller.pagecount.value}");
        //               },
        //             ),
        //           )
        //         : Offstage()),
        body: Obx(() => Stack(
              children: [
                _toggleView(_controller.pagecount.value),
                _buildBottom(),
              ],
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
      case 3:
        return _buildProfileStep4();
        break;

      default:
        break;
    }
  }

  _buildBottom() {
    return BottomWidget(
      onContinueTap: () {
        if (_controller.isDiagnoisedIbs.value == false)
          Get.toNamed(myprofile2);
        else {
          if (_controller.pagecount.value <= 2)
            _controller.pagecount.value++;
          else
            Get.toNamed(signup);
        }
      },
      onCircleTap: () {
        if (_controller.isDiagnoisedIbs.value == false)
          Get.toNamed(myprofile2);
        else {
          if (_controller.pagecount.value <= 2)
            _controller.pagecount.value++;
          else
            Get.toNamed(signup);
        }
      },
    );
  }

  _buildProfileStep1() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
        Center(
            child: Image.asset(Assets.myProfile1,
                width: ScreenConstant.defaultHeightTwoHundredTen)),
        SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
        Text("You are not alone.",
            style: TextStyles.textStyleIntroDescription
                .apply(color: Colors.black)),
        SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
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
                "Did you know that over 5 million Canadians have Irritable Bowel Syndrome?\n\nLiving with IBS can be a confusing and a frustrating journey",
                style: TextStyles.textStyleRegular,
                textAlign: TextAlign.center,
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
        SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
        Center(
            child: Image.asset(Assets.myProfile2,
                width: ScreenConstant.defaultHeightTwoHundredTen)),
        SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
        Text("Your journey begins today.",
            style: TextStyles.textStyleIntroDescription
                .apply(color: Colors.black)),
        SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
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
                "Research shows that the average person will wait 4 years before a diagnosis of IBS is established.\n\nTracking your symptoms is a positive step towards managing your IBS.",
                style: TextStyles.textStyleRegular,
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
        SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
        Center(
            child: Image.asset(Assets.myProfile3,
                width: ScreenConstant.defaultHeightTwoHundredTen)),
        SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
        Text("First, let's understood more \n about you.",
            textAlign: TextAlign.center,
            style: TextStyles.textStyleIntroDescription
                .apply(color: Colors.black)),
        SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
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
                style: TextStyles.textStyleRegular,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: ScreenConstant.defaultWidthTwenty),
          child: Row(
            children: [
              Expanded(
                child: Obx(
                  () => CustomElevatedButton2(
                    onTap: () {
                      _controller.isDiagnoisedIbs.value = true;
                    },
                    text: "Yes, I have",
                    textColor: _controller.isDiagnoisedIbs.value == true
                        ? AppColors.white
                        : AppColors.colorButton,
                    buttonColor: _controller.isDiagnoisedIbs.value == true
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
                      _controller.isDiagnoisedIbs.value = false;

                      // Get.toNamed(myprofile2);
                    },
                    text: "No, not yet",
                    textColor: _controller.isDiagnoisedIbs.value == false
                        ? AppColors.white
                        : AppColors.colorButton,
                    buttonColor: _controller.isDiagnoisedIbs.value == false
                        ? AppColors.colorYesButton
                        : Colors.white,
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  _buildProfileStep4() {
    return ListView(
      physics: ClampingScrollPhysics(),
      children: [
        SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
        Center(
            child: Image.asset(Assets.mprofile3,
                width: ScreenConstant.defaultHeightTwoHundredTen)),
        SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
        Text("Excellent. That's good\nto know.",
            textAlign: TextAlign.center,
            style: TextStyles.textStyleIntroDescription
                .apply(color: Colors.black)),
        SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
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
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "Do you know ",
                    style: TextStyles.textStyleIntroDescription
                        .apply(color: Colors.black, fontSizeDelta: -4),
                    children: <TextSpan>[
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => _buildIbsDialog(),
                          text: "which type of IBS ",
                          style: TextStyles.textStyleIntroDescription.apply(
                              color: AppColors.colorBackground,
                              fontSizeDelta: -4)),
                      TextSpan(text: "you have ?")
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
        ),
        // SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
        // Padding(
        //     padding: EdgeInsets.only(left: ScreenConstant.defaultWidthTwenty),
        //     child: RichText(
        //       textAlign: TextAlign.center,
        //       text: TextSpan(
        //         text: "Do you know ",
        //         style: TextStyles.textStyleIntroDescription
        //             .apply(color: Colors.black, fontSizeDelta: -4),
        //         children: <TextSpan>[
        //           TextSpan(
        //               recognizer: TapGestureRecognizer()
        //                 ..onTap = () => _buildIbsDialog(),
        //               text: "which type of IBS ",
        //               style: TextStyles.textStyleIntroDescription.apply(
        //                   color: AppColors.colorBackground, fontSizeDelta: -4)),
        //           TextSpan(text: "you have ?")
        //         ],
        //       ),
        //     )

        // Text("Do you know which type of IBS you have ?",
        //     textAlign: TextAlign.left,
        //     style: TextStyles.textStyleIntroDescription
        //         .apply(color: Colors.black, fontSizeDelta: -4)),
        // ),
        SizedBox(height: ScreenConstant.defaultHeightTen),
        _buildListIbsType(),
        SizedBox(
          height: 100,
        )
      ],
    );
  }

  _buildListIbsType() {
    return GridView.builder(
      padding:
          EdgeInsets.symmetric(horizontal: ScreenConstant.defaultWidthTwenty),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: DummyData.iBsType.length,
      itemBuilder: (BuildContext context, int index) {
        var model = DummyData.iBsType[index];
        return Obx(
          () => GestureDetector(
            onTap: () {
              _controller.selctedIbsType.value = index;
              _controller.selectIbsType(_controller.selctedIbsType.value);
            },
            child: Card(
                elevation: 0,
                color: _controller.selctedIbsType.value == index
                    ? AppColors.colorYesButton
                    : Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("${model.title}",
                        style: TextStyles.textStyleIntroDescription.apply(
                            color: _controller.selctedIbsType.value == index
                                ? Colors.white
                                : AppColors.colorBackground,
                            fontSizeDelta: -3)),
                    Text("${model.description}",
                        style: TextStyles.textStyleIntroDescription.apply(
                            color: _controller.selctedIbsType.value == index
                                ? Colors.white
                                : AppColors.colorBackground,
                            fontSizeDelta: -9)),
                  ],
                )),
          ),
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 3),
    );
  }

  // _buildListIbsType() {
  //   return ListView.builder(
  //     padding:
  //         EdgeInsets.symmetric(horizontal: ScreenConstant.defaultWidthTwenty),
  //     shrinkWrap: true,
  //     physics: NeverScrollableScrollPhysics(),
  //     itemCount: DummyData.ibsType.length,
  //     itemBuilder: (BuildContext context, int index) {
  //       var model = DummyData.ibsType[index];
  //       return Card(
  //         elevation: 0,
  //         color: Colors.white,
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(16),
  //         ),
  //         child: ListTile(
  //           dense: true,
  //           leading: Image.asset(model.image,
  //               width: ScreenConstant.defaultWidthTwenty),
  //           title: Text("${model.text}",
  //               style: TextStyles.textStyleIntroDescription
  //                   .apply(color: Colors.black, fontSizeDelta: -3)),
  //           trailing: InkWell(
  //             onTap: () {
  //               _controller.checkBoxValue.value =
  //                   !_controller.checkBoxValue.value;
  //             },
  //             child: _controller.checkBoxValue.value
  //                 ? Icon(
  //                     Icons.check_box_outlined,
  //                     size: FontSize.s20,
  //                     color: AppColors.colorDot,
  //                   )
  //                 : Icon(
  //                     Icons.check_box_outline_blank,
  //                     size: FontSize.s20,
  //                     color: AppColors.colorBackground.withOpacity(0.19),
  //                   ),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  _buildIbsDialog() {
    Get.dialog(CustomDialog(
      title: "Sub-types of IBS",
      description:
          '''There are four sub-types of IBS. The sub- types are determined by the frequency and consistency of your stool.  

IBS-C: IBS with constipation. Common symptoms are stomach pain, bloating, abnormally delayed or infrequent bowel movements, or lumpy/hard stool.  

IBS-D: IBS with diarrhea. This comes with stomach pain, an urgent need to move your bowels, abnormally frequent bowel movements, or loose/watery stool.  IBS-M: IBS with mixed bowel habits. Both constipation and diarrhea.  ''',
    ));
    //   Material(
    //     type: MaterialType.transparency,
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         Stack(
    //           children: [
    //             Container(
    //               padding: EdgeInsets.symmetric(
    //                   vertical: ScreenConstant.defaultHeightTwenty),
    //               child: Column(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 children: [
    //                   Container(
    //                     decoration: BoxDecoration(
    //                       color: Colors.white,
    //                       borderRadius: BorderRadius.only(
    //                           topLeft: Radius.circular(16),
    //                           topRight: Radius.circular(16)),
    //                     ),
    //                     height: ScreenConstant.screenHeightHalf * 1.5,
    //                     margin: EdgeInsets.symmetric(
    //                         horizontal: ScreenConstant.defaultWidthTwenty),
    //                     child: Column(
    //                       crossAxisAlignment: CrossAxisAlignment.start,
    //                       mainAxisAlignment: MainAxisAlignment.start,
    //                       children: [
    //                         Padding(
    //                           padding: ScreenConstant.spacingAllLarge,
    //                           child: Text("Sub Types of IBS",
    //                               textAlign: TextAlign.start,
    //                               style: TextStyles.textStyleIntroDescription
    //                                   .apply(color: Colors.black87)),
    //                         ),
    //                         SizedBox(
    //                             height: ScreenConstant.defaultHeightSixteen),
    //                         Padding(
    //                           padding: EdgeInsets.symmetric(
    //                               horizontal:
    //                                   ScreenConstant.defaultWidthTwenty),
    //                           child: Text(
    //                               '''There are four sub-types of IBS. The sub- types are determined by the frequency and consistency of your stool.  IBS-C: IBS with constipation. Common symptoms are stomach pain, bloating, abnormally delayed or infrequent bowel movements, or lumpy/hard stool.  IBS-D: IBS with diarrhea. This comes with stomach pain, an urgent need to move your bowels, abnormally frequent bowel movements, or loose/watery stool.  IBS-M: IBS with mixed bowel habits. Both constipation and diarrhea.  IBS-U: This is an undefined subtype associated with symptoms that vary.  There are about an equal number of people ''',
    //                               textAlign: TextAlign.start,
    //                               style: TextStyles.textStyleRegular.apply(
    //                                   color: AppColors.colorDialogDescription)),
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                   Container(
    //                     height: ScreenConstant.screenHeightTwelve,
    //                     margin: EdgeInsets.symmetric(
    //                         horizontal: ScreenConstant.defaultWidthTwenty),

    //                     decoration: BoxDecoration(
    //                       borderRadius: BorderRadius.only(
    //                           bottomLeft: Radius.circular(16),
    //                           bottomRight: Radius.circular(16)),
    //                       color: AppColors.colorBackground,
    //                     ),
    //                     child: Row(
    //                       children: [
    //                         Image.asset(Assets.curl6),
    //                         SizedBox(width: ScreenConstant.defaultWidthTwenty),
    //                         Image.asset(Assets.curl5)
    //                       ],
    //                     ),
    //                     // padding: ScreenConstant.spacingAllLarge,
    //                     // margin: ScreenConstant.spacingAllLarge,
    //                   )
    //                 ],
    //               ),
    //             ),
    //             Positioned(
    //               right: 10,
    //               top: 10,
    //               child: GestureDetector(
    //                 onTap: () => Get.back(),
    //                 child: CircleAvatar(
    //                   backgroundColor: AppColors.colorCloseLight,
    //                   radius: 20,
    //                   child: CircleAvatar(
    //                       backgroundColor: AppColors.colorCloseLight,
    //                       radius: 18,
    //                       child: Icon(
    //                         Icons.close,
    //                         color: Colors.white,
    //                         size: FontSize.s15,
    //                       )),
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
