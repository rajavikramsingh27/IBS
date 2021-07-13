import 'package:flutter/material.dart';
import 'package:flutter_ibs/utils/Assets.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:get/get.dart';

class Symptoms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1A103E).withOpacity(0.61),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.colorBackground,
      ),
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
                  _buildExcerciseDuration()
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

  _buildExcerciseDuration() {
    return Stack(
      children: [
        Image.asset(Assets.symptomsBg),
        Container(
          width: double.maxFinite,
          margin: EdgeInsets.symmetric(
              horizontal: ScreenConstant.defaultWidthTwenty),
          decoration: BoxDecoration(
              color: AppColors.colorBackground,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          child: Column(
            children: [
              SizedBox(height: ScreenConstant.defaultHeightTwenty),
              Text(
                "Exercise Duration",
                style: TextStyles.textStyleIntroDescription
                    .apply(color: Colors.white, fontSizeDelta: -2),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: ScreenConstant.defaultHeightTwenty),
              Text(
                "How long have you been experiencing \nthese sympsoms ?",
                style: TextStyles.textStyleRegular
                    .apply(color: Colors.white.withOpacity(0.40)),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: ScreenConstant.defaultHeightTwentyThree),
              _buildSelector(),
              SizedBox(height: ScreenConstant.defaultHeightTwentyThree),

               Align(alignment: Alignment(-0.9,0),
                                child: Text(
                  "Notes",
                  style: TextStyles.textStyleRegular
                      .apply(color: Colors.white),
                  textAlign: TextAlign.start,
              ),
               ),
            ],
          ),
        )
      ],
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
