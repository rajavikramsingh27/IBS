

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ibs/controllers/my_profile/MyProfileController.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/DummyData.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/CustomDialog.dart';
import 'package:flutter_ibs/widget/LeadingBackButton.dart';
import 'package:get/get.dart';
import 'package:flutter_ibs/utils/HexColor.dart';

class MyIBS_Diagnosis extends StatelessWidget {
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
            "MY IBS DIAGNOSIS",
            style: TextStyles.appBarTitle,
          ),
        ),
        body: _buildProfileStep4()
    );
  }

  _buildProfileStep4() {
    return ListView(
      children: [
        SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
        Container(
            padding: EdgeInsets.only(
              bottom: 20,
              top: 20,
              left: 40,
              right: 40,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Your IBS Diagnosis",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Roboto-Regular',
                    color: HexColor('4A358B'),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: ScreenConstant.sizeDefault),
                Text(
                  "You may change your IBS Diagnosis at any time. "
                      "Note that you may only have one diagnosis at any given time. "
                      "All data previously collected will remain unchanged.",
                  style: TextStyle(
                    fontSize: 13,
                    fontFamily: 'Roboto-Regular',
                    // fontWeight: FontWeight.w400,
                    color: HexColor('4A358B'),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            )
        ),
        SizedBox(height: ScreenConstant.defaultHeightTen),
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
            ),
          ),
        ),
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

  _buildIbsDialog() {
    Get.dialog(CustomDialog(
      title: "Sub-types of IBS",
      description:
      '''There are four sub-types of IBS. The sub- types are determined by the frequency and consistency of your stool.  

IBS-C: IBS with constipation. Common symptoms are stomach pain, bloating, abnormally delayed or infrequent bowel movements, or lumpy/hard stool.  

IBS-D: IBS with diarrhea. This comes with stomach pain, an urgent need to move your bowels, abnormally frequent bowel movements, or loose/watery stool.  IBS-M: IBS with mixed bowel habits. Both constipation and diarrhea.  ''',
    ));
  }

}
