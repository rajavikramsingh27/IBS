import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ibs/controllers/bowel_movement/BowelMovementController.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/DummyData.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/AdditionalNoteWidget.dart';
import 'package:flutter_ibs/widget/CustomArcPainter.dart';
import 'package:flutter_ibs/widget/CustomElevatedButton.dart';
import 'package:flutter_ibs/widget/CustomPainters.dart';
import 'package:flutter_ibs/widget/CustomSwitch.dart';
import 'package:flutter_ibs/widget/CustomTextFormField%20.dart';
import 'package:flutter_ibs/widget/DateTimeCardWidget.dart';
import 'package:flutter_ibs/widget/WavePainter.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class Medication extends StatelessWidget {
  final _controller = Get.put(BowelMovementController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(height: ScreenConstant.defaultHeightTen),
            CustomElevatedButton(
              widthFactor: 0.7,
              text: "Save",
              onTap: () {},
            ),
            TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text("Cancel",
                    style: TextStyles.textStyleIntroDescription.apply(
                      color: AppColors.colorskip_also_proceed,
                    )))
          ],
        ),
      ),
      backgroundColor: Color(0xff1A103E).withOpacity(0.6),
      body: ListView(
        children: [
          Padding(
            padding:
                EdgeInsets.only(top: ScreenConstant.defaultHeightOneThirty),
            child: Stack(
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(top: ScreenConstant.defaultHeightTwenty),
                  child: Card(
                    margin: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    )),
                    child: Column(
                      children: [
                        SizedBox(height: ScreenConstant.defaultHeightSixty),
                        Text(
                          "Track Medication",
                          style: TextStyles.textStyleIntroDescription
                              .apply(color: Colors.black, fontSizeDelta: -2),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: ScreenConstant.defaultHeightForty),
                        DateTimeCardWidget(),
                        SizedBox(height: ScreenConstant.defaultHeightForty),
                        Stack(
                          children: [
                            Positioned.fill(
                              top: ScreenConstant.defaultHeightOneHundred,
                              child: _buildWavePainter(),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: ScreenConstant.defaultWidthTwenty,
                                  vertical: ScreenConstant.defaultHeightSixty),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              child: _buildMedication(),
                            ),
                          ],
                        ),
                        SizedBox(height: ScreenConstant.defaultHeightTwenty),
                        Text("Additional Notes",
                            textAlign: TextAlign.center,
                            style: TextStyles.textStyleIntroDescription
                                .apply(color: Colors.black, fontSizeDelta: -3)),
                        Padding(
                          padding: ScreenConstant.spacingAllMedium,
                          child: Card(
                            shadowColor: Colors.grey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)),
                            child: TextFormField(
                              inputFormatters: <TextInputFormatter>[],
                              readOnly: true,
                              decoration:
                                  InputDecoration(border: InputBorder.none),
                              textInputAction: TextInputAction.newline,
                              maxLines: 4,
                              minLines: 4,
                              // maxLength: 100,
                              // decoration: hintedInputDecoration(""),
                            ),
                          ),
                        ),
                        SizedBox(
                            height: ScreenConstant.defaultHeightTwentyThree),
                      ],
                    ),
                  ),
                ),
                Positioned(right: 0, left: 0, child: CustomArcPainter())
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildMedication() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Card(
          margin: EdgeInsets.zero,
          color: AppColors.colorBackground,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              SizedBox(height: ScreenConstant.defaultHeightForty),
              Text("What Did you take?",
                  style: TextStyles.textStyleIntroDescription
                      .apply(color: Colors.white, fontSizeDelta: -3)),
              SizedBox(height: ScreenConstant.defaultHeightTwentyThree),
              Text(
                "Select from this list of common medications and supplements or add your own",
                textAlign: TextAlign.center,
                style: TextStyles.textStyleRegular
                    .apply(color: AppColors.colorSkipButton),
              ),
              _buildListOfMedicineTaken(),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                margin: ScreenConstant.spacingAllLarge,
                child: FractionallySizedBox(
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Add Medication",
                        hintStyle: TextStyles.textStyleRegular
                            .apply(color: AppColors.colorTextHint),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: ScreenConstant.sizeMedium,
                        )),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: ScreenConstant.defaultWidthTen * 1.5,
                    backgroundColor: AppColors.colorArrowButton,
                    child: Icon(
                      Icons.add,
                      size: FontSize.s11,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: ScreenConstant.sizeDefault),
                  Text(
                    "Add this medication",
                    style: TextStyles.textStyleRegular
                        .apply(color: AppColors.white),
                  )
                ],
              ),
              SizedBox(height: ScreenConstant.defaultHeightForty * 1.4),
            ],
          ),
        ),
        
        Positioned(
            bottom: -50,
            child: CustomArcPainter2(
                height: 100,
                width: 100,
                quarterTurns: 0,
                painter: MyPainter(AppColors.colorSymptomsGridBg.withOpacity(0.5)))),
                 Positioned(
            bottom: -100,
            child: CustomArcPainter2(
                height: 200,
                width: 200,
                quarterTurns: 0,
                painter: MyPainter(AppColors.colorSymptomsGridBg.withOpacity(0.20)))),
      ],
    );
  }

  _buildListOfMedicineTaken() {
    return GridView.builder(
      padding: EdgeInsets.symmetric(
          horizontal: ScreenConstant.sizeLarge,
          vertical: ScreenConstant.defaultHeightTwentyThree),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: DummyData.medicationList.length,
      itemBuilder: (BuildContext context, int index) {
        var model = DummyData.medicationList[index];
        return Card(
          color: AppColors.colorSymptomsGridBg,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          child: Center(
            child: Text(
              model.title,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyles.textStyleRegular
                  .apply(color: Colors.white, fontSizeDelta: -2),
            ),
          ),
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, childAspectRatio: 3.5),
    );
  }

  _buildWavePainter() {
    return Container(
      margin: EdgeInsets.only(top: ScreenConstant.defaultHeightTwenty * 1.5),
      width: Get.context.mediaQuerySize.width,
      child: CustomPaint(
        size: Size(Get.context.mediaQuerySize.width,
            Get.context.mediaQuerySize.height),
        painter: WavePainter(),
      ),
    );
  }
}
