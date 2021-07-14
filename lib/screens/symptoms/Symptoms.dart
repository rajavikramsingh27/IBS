import 'package:flutter/material.dart';
import 'package:flutter_ibs/controllers/home/symptoms/SymptomsController.dart';
import 'package:flutter_ibs/utils/Assets.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/DummyData.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/WavePainter.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class Symptoms extends StatelessWidget {
  final _controller = Get.put(SymptomsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1A103E).withOpacity(0.61),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: ScreenConstant.defaultHeightTwenty),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              )),
              child: ListView(
                children: [
                  SizedBox(height: ScreenConstant.defaultHeightForty),
                  Text(
                    "Track Symptoms",
                    style: TextStyles.textStyleIntroDescription
                        .apply(color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: ScreenConstant.defaultHeightForty),
                  _buildDateTimeCard(),
                  SizedBox(height: ScreenConstant.defaultHeightForty),
                  _buildAbdominal(),

                  // _buildExcerciseDuration()
                ],
              ),
            ),
          ),
          _buildArrow()
        ],
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

  _buildAbdominal() {
    return Stack(
      children: [
        _buildWavePainter(),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: ScreenConstant.defaultWidthTen * 1.6),
          child: Card(
            margin: EdgeInsets.zero,
            color: AppColors.colorBackground,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                SizedBox(height: ScreenConstant.defaultHeightTwenty),
                Text("Abdominal Pain",
                    style: TextStyles.textStyleIntroDescription
                        .apply(color: Colors.white, fontSizeDelta: -3)),
                SizedBox(height: ScreenConstant.defaultHeightTen),
                Text(
                  "I have no abdominal pain.",
                  style: TextStyles.textStyleRegular
                      .apply(color: AppColors.colorSkipButton),
                ),
                _buildSlider(),
                _abdominalPainList()
              ],
            ),
          ),
        )
      ],
    );
  }

  _abdominalPainList() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(height: ScreenConstant.defaultHeightTwenty),
          Text("Describe How Your Pain Feels",
              textAlign: TextAlign.center,
              style: TextStyles.textStyleIntroDescription
                  .apply(color: Colors.white, fontSizeDelta: -3)),
          SizedBox(height: ScreenConstant.defaultHeightTen),
          Text(
            "Select from list below to help describe what you are feeling.",
            textAlign: TextAlign.center,
            style: TextStyles.textStyleRegular
                .apply(color: AppColors.colorSkipButton),
          ),
          SizedBox(height: ScreenConstant.defaultHeightTwentyThree),
          GridView.builder(
            padding: EdgeInsets.symmetric(
                horizontal: ScreenConstant.defaultWidthTwenty),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: DummyData.iBsType.length,
            itemBuilder: (BuildContext context, int index) {
              var model = DummyData.iBsType[index];
              return Card(
                  elevation: 0,
                  color: AppColors.colorSymptomsGridBg,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${model.title}",
                          style: TextStyles.textStyleIntroDescription.apply(
                              color: AppColors.colorBackground,
                              fontSizeDelta: -3)),
                      Text("${model.description}",
                          textAlign: TextAlign.center,
                          style: TextStyles.textStyleIntroDescription.apply(
                              color: AppColors.colorBackground,
                              fontSizeDelta: -9)),
                    ],
                  ));
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, childAspectRatio: 1),
          )
        ],
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

  // _buildExcerciseDuration() {
  //   return Stack(
  //     children: [
  //       Image.asset(Assets.symptomsBg),
  //       Container(
  //         width: double.maxFinite,
  //         margin: EdgeInsets.symmetric(
  //             horizontal: ScreenConstant.defaultWidthTwenty),
  //         decoration: BoxDecoration(
  //             color: AppColors.colorBackground,
  //             borderRadius: BorderRadius.only(
  //                 bottomLeft: Radius.circular(20),
  //                 bottomRight: Radius.circular(20))),
  //         child: Column(
  //           children: [
  //             SizedBox(height: ScreenConstant.defaultHeightTwenty),
  //             Text(
  //               "Exercise Duration",
  //               style: TextStyles.textStyleIntroDescription
  //                   .apply(color: Colors.white, fontSizeDelta: -2),
  //               textAlign: TextAlign.center,
  //             ),
  //             SizedBox(height: ScreenConstant.defaultHeightTwenty),
  //             Text(
  //               "How long have you been experiencing \nthese sympsoms ?",
  //               style: TextStyles.textStyleRegular
  //                   .apply(color: Colors.white.withOpacity(0.40)),
  //               textAlign: TextAlign.center,
  //             ),
  //             SizedBox(height: ScreenConstant.defaultHeightTwentyThree),
  //             _buildSelector(),
  //             SizedBox(height: ScreenConstant.defaultHeightTwentyThree),

  //              Align(alignment: Alignment(-0.9,0),
  //                               child: Text(
  //                 "Notes",
  //                 style: TextStyles.textStyleRegular
  //                     .apply(color: Colors.white),
  //                 textAlign: TextAlign.start,
  //             ),
  //              ),
  //           ],
  //         ),
  //       )
  //     ],
  //   );
  // }

  // _buildSelector() {
  //   return Container(
  //     height: ScreenConstant.defaultHeightForty,
  //     width: double.maxFinite,
  //     margin: EdgeInsets.only(
  //         left: ScreenConstant.defaultWidthTen * 1.5,
  //         right: ScreenConstant.defaultWidthTen * 1.5,
  //         bottom: ScreenConstant.defaultHeightTen * 1.5),
  //     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
  //     decoration: BoxDecoration(
  //         color: AppColors.colordropdownArrowBg,
  //         borderRadius: BorderRadius.all(Radius.circular(8))),
  //     // dropdown below..
  //     child: DropdownButton<String>(
  //         isExpanded: true,
  //         dropdownColor: AppColors.white,
  //         value: "Less than 1 hour",
  //         elevation: 30,
  //         icon: Icon(
  //           Icons.keyboard_arrow_down_outlined,
  //           color: AppColors.colorBackground,
  //         ),
  //         iconSize: 20,
  //         underline: SizedBox(),
  //         onChanged: (String newValue) {
  //           // setState(() {
  //           //   dropdownValue = newValue;
  //           // });
  //         },
  //         items: <String>["Less than 1 hour", "2", "3", "4", "5", "more"]
  //             .map<DropdownMenuItem<String>>((String value) {
  //           return DropdownMenuItem<String>(
  //             value: value.toString(),
  //             child: Text(value.toString(), style: TextStyles.textStyleRegular),
  //           );
  //         }).toList()),
  //   );
  // }

}
