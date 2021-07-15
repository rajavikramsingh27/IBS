import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ibs/controllers/bowel_movement/BowelMovementController.dart';
import 'package:flutter_ibs/utils/Assets.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/DummyData.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/CustomElevatedButton.dart';
import 'package:flutter_ibs/widget/CustomTextFormField%20.dart';
import 'package:flutter_ibs/widget/WavePainter.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class BowelMovement extends StatelessWidget {
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
      body: Padding(
        padding: EdgeInsets.only(top: ScreenConstant.defaultHeightOneThirty),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: ScreenConstant.defaultHeightTwenty),
              child: Card(
                margin: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                )),
                child: ListView(
                  children: [
                    SizedBox(height: ScreenConstant.defaultHeightForty),
                    Text(
                      "Track Bowel Movement",
                      style: TextStyles.textStyleIntroDescription
                          .apply(color: Colors.black, fontSizeDelta: -2),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: ScreenConstant.defaultHeightForty),
                    _buildDateTimeCard(),
                    SizedBox(height: ScreenConstant.defaultHeightForty * 1.25),
                    Text(
                      "What does your poop look like?",
                      style: TextStyles.textStyleIntroDescription
                          .apply(color: Colors.black, fontSizeDelta: -2),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: ScreenConstant.defaultHeightTwenty * 1.5),
                    Center(
                      child: Stack(
                        children: [
                          Image.asset(
                            Assets.hard_lump,
                            width: ScreenConstant.defaultWidthOneHundredSeven,
                            height: ScreenConstant.defaultHeightOneHundred,
                          ),
                          Positioned(
                            bottom: 0,
                            left: ScreenConstant.defaultWidthTwenty,
                            right: ScreenConstant.defaultWidthTwenty,
                            child: Container(
                              height: ScreenConstant.defaultHeightTwenty,
                              width: ScreenConstant.sizeXXXL,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: AppColors.colorButton,
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: ScreenConstant.sizeExtraSmall,
                                  vertical: 1),
                              child: FittedBox(
                                fit: BoxFit.contain,
                                child: Text("Type 1",
                                    textAlign: TextAlign.center,
                                    style: TextStyles.textStyleIntroDescription
                                        .apply(
                                            color: Colors.white,
                                            fontSizeDelta: -9)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: ScreenConstant.sizeMedium),
                    Text("Separate hard lumps, like nuts ",
                        textAlign: TextAlign.center,
                        style: TextStyles.textStyleRegular),
                    SizedBox(height: ScreenConstant.sizeMedium),
                    _buildSlider(),
                    SizedBox(height: ScreenConstant.defaultHeightForty),
                    Text("Additional Notes",
                        textAlign: TextAlign.center,
                        style: TextStyles.textStyleIntroDescription
                            .apply(color: Colors.black, fontSizeDelta: -3)),
                    Padding(
                      padding: ScreenConstant.spacingAllMedium,
                      child: TextFormField(
                        inputFormatters: <TextInputFormatter>[],
                        readOnly: true,

                        textInputAction: TextInputAction.newline,
                        maxLines: 4,
                        minLines: 4,
                        // maxLength: 100,
                        decoration: hintedInputDecoration(""),
                      ),
                    ),
                    SizedBox(height: ScreenConstant.defaultHeightTwentyThree),
                    Text(
                      '''For best results track every time you\nexperience a symptom.\n\nClick “Save” to log your results.''',
                      textAlign: TextAlign.center,
                      style: TextStyles.textStyleRegular,
                    ),
                    SizedBox(height: ScreenConstant.defaultHeightTwentyThree),
                    Stack(
                      children: [
                        Positioned.fill(
                          top: ScreenConstant.defaultHeightOneHundred,
                          child: _buildWavePainter(),
                        ),
                        Container(
                          margin: ScreenConstant.spacingAllMedium,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            children: [
                              _buildUrgency(),
                              _buildColorPOrtion(),
                              _buildRelief(),
                            ],
                          ),
                        ),
                      ],
                    ),
                     Text("Additional Notes",
                        textAlign: TextAlign.center,
                        style: TextStyles.textStyleIntroDescription
                            .apply(color: Colors.black, fontSizeDelta: -3)),
                    Padding(
                      padding: ScreenConstant.spacingAllMedium,
                      child: TextFormField(
                        inputFormatters: <TextInputFormatter>[],
                        readOnly: true,

                        textInputAction: TextInputAction.newline,
                        maxLines: 4,
                        minLines: 4,
                        // maxLength: 100,
                        decoration: hintedInputDecoration(""),
                      ),
                    ),
                    SizedBox(height: ScreenConstant.defaultHeightTwentyThree),

                    Text(
                      '''For best results track every time you\nexperience a symptom.\n\nClick “Save” to log your results.''',
                      textAlign: TextAlign.center,
                      style: TextStyles.textStyleRegular,
                    ),
                    SizedBox(height: ScreenConstant.defaultHeightTwentyThree),
                  ],
                ),
              ),
            ),
            _buildArrow()
          ],
        ),
      ),
    );
  }

  _buildArrow() {
    return Positioned(
      top: 0,
      left: Get.context.mediaQuerySize.width / 2.2,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.colorYesButton.withOpacity(0.27),
              offset: const Offset(
                5.0,
                2.0,
              ),
              blurRadius: 10.0,
              spreadRadius: 10.0,
            ),
            BoxShadow(
              color: AppColors.colorYesButton.withOpacity(0.27),
              offset: const Offset(
                -5.0,
                -5.0,
              ),
              blurRadius: 10.0,
              spreadRadius: 10.0,
            ), //BoxShadow
            //BoxShadow
          ],
        ),
        child: CircleAvatar(
          backgroundColor: AppColors.colorYesButton,
          child: Icon(
            Icons.keyboard_arrow_up_outlined,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  _buildDateTimeCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(38)),
      margin:
          EdgeInsets.symmetric(horizontal: ScreenConstant.defaultWidthSixty),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              Assets.clock,
              width: ScreenConstant.defaultWidthTen * 1.3,
            ),
            Text("3 pm EST", style: TextStyles.textStyleRegular),
            CircleAvatar(
              backgroundColor: AppColors.colorTextRegular,
              radius: 1,
            ),
            Text("Monday, May 31", style: TextStyles.textStyleRegular),
          ],
        ),
      ),
    );
  }

  _buildSlider() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: ScreenConstant.defaultWidthTen),
      child: SfSliderTheme(
        data: SfSliderThemeData(
          thumbColor: AppColors.colorArrowButton,
          thumbStrokeWidth: 5,
          thumbRadius: 16,
          thumbStrokeColor: Colors.white,
          activeTrackHeight: 4,
          overlayRadius: 0,
          disabledActiveTrackColor: AppColors.colorTrackSlider,
          disabledInactiveTrackColor: AppColors.colorTrackSlider,
          activeDividerStrokeWidth: 2,
          inactiveDividerStrokeWidth: 2,
          inactiveTrackHeight: 4,
          activeTrackColor: AppColors.colorTrackSlider,
          inactiveTrackColor: AppColors.colorTrackSlider,
          inactiveDividerStrokeColor: AppColors.white,
          inactiveDividerRadius: 8,
          inactiveDividerColor: AppColors.colorInactiveDividerSlider,
          activeDividerColor: AppColors.colorInactiveDividerSlider,
          activeDividerStrokeColor: Colors.white,
          activeDividerRadius: 8,
        ),
        child: Obx(
          () => SfSlider(
            showDividers: true,
            min: 1.0,
            max: 4.0,
            interval: 1,
            stepSize: 1,
            showLabels: true,
            value: _controller.sliderValue.value,
            onChanged: (dynamic newValue) {
              print("cahnged");
              _controller.sliderValue.value = newValue;
            },
            // labelFormatterCallback: (String,newval){},
          ),
        ),
      ),
    );
  }

  _buildUrgency() {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Card(
        margin: EdgeInsets.zero,
        color: AppColors.colorBackground,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            SizedBox(height: ScreenConstant.defaultHeightForty),
            Text("Urgency",
                style: TextStyles.textStyleIntroDescription
                    .apply(color: Colors.white, fontSizeDelta: -3)),
            SizedBox(height: ScreenConstant.defaultHeightTwentyThree),
            Text(
              "I needed to get to the washroom quite quickly",
              textAlign: TextAlign.center,
              style: TextStyles.textStyleRegular
                  .apply(color: AppColors.colorSkipButton),
            ),
            SizedBox(height: ScreenConstant.defaultHeightTwenty),
            _buildSlider(),
          ],
        ),
      ),
    );
  }

  _buildColorPOrtion() {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: ScreenConstant.sizeMedium,
          vertical: ScreenConstant.defaultHeightTwentyThree),
      child: Column(
        children: [
          Text("Colour",
              style: TextStyles.textStyleIntroDescription
                  .apply(color: Colors.black, fontSizeDelta: -3)),
          SizedBox(height: ScreenConstant.defaultHeightTwentyThree),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.black,
              ),
               CircleAvatar(
                radius: 20,
                backgroundColor: AppColors.colorArrowButton,
              ),
               CircleAvatar(
                radius: 20,
                backgroundColor: AppColors.colorBackground,
              )
            ],
          ),
          SizedBox(height: ScreenConstant.defaultHeightTwentyThree),
          Text(
            "I feel only a little relief after bowel mowement",
            textAlign: TextAlign.center,
            style: TextStyles.textStyleRegular.apply(),
          ),
        ],
      ),
    );
  }

  _buildRelief() {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Card(
        margin: EdgeInsets.zero,
        color: AppColors.colorBackground,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            SizedBox(height: ScreenConstant.defaultHeightForty),
            Text("Relief",
                style: TextStyles.textStyleIntroDescription
                    .apply(color: Colors.white, fontSizeDelta: -3)),
            SizedBox(height: ScreenConstant.defaultHeightTwentyThree),
            Text(
              "I feel only a little relief after bowel mowement",
              textAlign: TextAlign.center,
              style: TextStyles.textStyleRegular
                  .apply(color: AppColors.colorSkipButton),
            ),
            SizedBox(height: ScreenConstant.defaultHeightTwenty),
            _buildSlider(),
          ],
        ),
      ),
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

 

  _buildSelector() {
    return Container(
      height: ScreenConstant.defaultHeightForty,
      width: double.maxFinite,
      margin: EdgeInsets.only(
          left: ScreenConstant.defaultWidthTen * 1.5,
          right: ScreenConstant.defaultWidthTen * 1.5,
          bottom: ScreenConstant.defaultHeightTen * 1.5),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      decoration: BoxDecoration(
          color: AppColors.colordropdownArrowBg,
          borderRadius: BorderRadius.all(Radius.circular(8))),
      // dropdown below..
      child: DropdownButton<String>(
          isExpanded: true,
          dropdownColor: AppColors.white,
          value: "Less than 1 hour",
          elevation: 30,
          icon: Icon(
            Icons.keyboard_arrow_down_outlined,
            color: AppColors.colorBackground,
          ),
          iconSize: 20,
          underline: SizedBox(),
          onChanged: (String newValue) {
            // setState(() {
            //   dropdownValue = newValue;
            // });
          },
          items: <String>["Less than 1 hour", "2", "3", "4", "5", "more"]
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value.toString(),
              child: Text(value.toString(), style: TextStyles.textStyleRegular),
            );
          }).toList()),
    );
  }
}
