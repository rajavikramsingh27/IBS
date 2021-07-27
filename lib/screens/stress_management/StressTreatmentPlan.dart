import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/DummyData.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/CustomArcPainter.dart';
import 'package:flutter_ibs/widget/CustomElevatedButton.dart';
import 'package:flutter_ibs/widget/CustomSwitch.dart';
import 'package:flutter_ibs/widget/DateTimeCardWidget.dart';
import 'package:flutter_ibs/widget/WavePainter.dart';
import 'package:flutter_ibs/widget/utils.dart';
import 'package:get/get.dart';

class StressTreatmentPlan extends StatelessWidget {
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
              text: "Save Changes",
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
      body: InkWell(
        onTap: () {
          dismissKeyboard(context);
        },
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: [
            Padding(
              padding:
                  EdgeInsets.only(top: ScreenConstant.defaultHeightOneThirty),
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: ScreenConstant.defaultHeightTwenty),
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
                            "Treatment Plan: Stress Management",
                            style: TextStyles.textStyleIntroDescription
                                .apply(color: Colors.black, fontSizeDelta: -2),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: ScreenConstant.defaultHeightForty),
                          DateTimeCardWidget(),
                          SizedBox(height: ScreenConstant.sizeDefault),
                          CustomElevatedButton2(
                            elevation: 16,
                            widthFactor: 0.7,
                            onTap: () {},
                            textColor: AppColors.colorTextStop,
                            text: "Stop Plan",
                            buttonColor: AppColors.white,
                          ),
                          SizedBox(
                              height: ScreenConstant.defaultHeightTwentyFour),
                          Stack(
                            children: [
                              Positioned.fill(
                                top: ScreenConstant.defaultHeightOneHundred,
                                child: _buildWavePainter(),
                              ),
                              Container(
                                  margin: EdgeInsets.symmetric(
                                    horizontal:
                                        ScreenConstant.defaultWidthTwenty,
                                  ),
                                  child: Column(
                                    children: [
                                      _buildRelxTechnique(),
                                      _buildPlanDetails(),
                                      _buildSetReminders()
                                    ],
                                  )),
                            ],
                          ),
                          SizedBox(height: ScreenConstant.defaultHeightTwenty),
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
      ),
    );
  }

  _buildRelxTechnique() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Card(
          margin: EdgeInsets.zero,
          color: AppColors.colorBackground,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ScreenConstant.defaultWidthTwenty,
            ),
            child: Column(
              children: [
                SizedBox(height: ScreenConstant.defaultHeightForty),
                Text("Relaxation Techniques",
                    style: TextStyles.textStyleIntroDescription
                        .apply(color: Colors.white, fontSizeDelta: -2)),
                SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
                Text(
                  "Select which relaxation techniques you will add to your routine.",
                  textAlign: TextAlign.center,
                  style: TextStyles.textStyleRegular
                      .apply(color: AppColors.colorSkipButton),
                ),
                _buildRelxTechniqueList(),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  child: FractionallySizedBox(
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Medit...",
                          hintStyle: TextStyles.textStyleRegular
                              .apply(color: AppColors.colorTextHint),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: ScreenConstant.sizeMedium,
                          )),
                    ),
                  ),
                ),
                SizedBox(height: ScreenConstant.defaultHeightSixteen),
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
                      "Add relaxation technique",
                      style: TextStyles.textStyleRegular
                          .apply(color: AppColors.white),
                    )
                  ],
                ),
                _buildReminders(),
                SizedBox(height: ScreenConstant.defaultHeightForty * 1.4),
              ],
            ),
          ),
        ),
        // Positioned(
        //     bottom: -50,
        //     child: CustomArcPainter2(
        //         height: 100,
        //         width: 100,
        //         quarterTurns: 0,
        //         painter:
        //             MyPainter(AppColors.colorSymptomsGridBg.withOpacity(0.5)))),
        // Positioned(
        //     bottom: -100,
        //     child: CustomArcPainter2(
        //         height: 200,
        //         width: 200,
        //         quarterTurns: 0,
        //         painter: MyPainter(
        //             AppColors.colorSymptomsGridBg.withOpacity(0.20)))),
      ],
    );
  }

  _buildRelxTechniqueList() {
    return GridView.builder(
      padding: EdgeInsets.symmetric(
          horizontal: ScreenConstant.sizeLarge,
          vertical: ScreenConstant.defaultHeightTwentyFour),
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

  _buildReminders() {
    return Column(
      children: [
        SizedBox(height: ScreenConstant.defaultHeightForty),
        Text("Reminders",
            style: TextStyles.textStyleIntroDescription
                .apply(color: Colors.white, fontSizeDelta: -3)),
        SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
        Text(
          "Would you like to set up app notifications to remind you?",
          textAlign: TextAlign.center,
          style: TextStyles.textStyleRegular
              .apply(color: AppColors.colorSkipButton),
        ),
        SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Text(
                "Remind me:",
                style: TextStyles.textStyleRegular.apply(color: Colors.white),
              ),
            ),
            Expanded(flex: 2, child: _buildDropDown())
          ],
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Text(
                "At time:",
                style: TextStyles.textStyleRegular.apply(color: Colors.white),
              ),
            ),
            Expanded(flex: 2, child: _buildDropDown())
          ],
        ),
        SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "With message:",
            textAlign: TextAlign.start,
            style: TextStyles.textStyleRegular.apply(color: Colors.white),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: TextFormField(
            inputFormatters: <TextInputFormatter>[],
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                    horizontal: ScreenConstant.sizeMedium,
                    vertical: ScreenConstant.defaultHeightTwenty),
                hintText: "It's time to...",
                hintStyle:
                    TextStyles.textStyleRegular.apply(color: Colors.black)),
            textInputAction: TextInputAction.newline,
            maxLines: 4,
            minLines: 4,

            // maxLength: 100,
            // decoration: hintedInputDecoration(""),
          ),
        ),
        SizedBox(height: ScreenConstant.defaultHeightTen),
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
              "Add Reminders",
              style: TextStyles.textStyleRegular.apply(color: AppColors.white),
            )
          ],
        ),
      ],
    );
  }

  _buildDropDown() {
    return Container(
      height: ScreenConstant.defaultHeightForty * 1.2,
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
          value: "Under 20 years",
          elevation: 30,
          icon: Icon(
            Icons.keyboard_arrow_down_outlined,
            color: AppColors.colordropdownArrow,
          ),
          iconSize: 20,
          underline: SizedBox(),
          onChanged: (String newValue) {
            // setState(() {T
            //   dropdownValue = newValue;
            // });
          },
          items: <String>["Under 20 years", "2", "3", "4", "5", "more"]
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value.toString(),
              child: Text(value.toString(), style: TextStyles.textStyleRegular),
            );
          }).toList()),
    );
  }

  _buildPlanDetails() {
    return Column(children: [
      SizedBox(height: ScreenConstant.defaultHeightForty * 1.3),
      Text("My Plan Details",
          style: TextStyles.textStyleIntroDescription
              .apply(color: Colors.white, fontSizeDelta: -2)),
      SizedBox(height: ScreenConstant.defaultHeightForty * 1.2),
      Card(
          margin: EdgeInsets.zero,
          color: AppColors.colorBackground,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ScreenConstant.defaultWidthTwenty,
              ),
              child: Column(
                children: [
                  SizedBox(height: ScreenConstant.defaultHeightForty),
                  Text("Relaxation Trackings",
                      style: TextStyles.textStyleIntroDescription
                          .apply(color: Colors.white, fontSizeDelta: -2)),
                  SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
                  Text(
                    "Relaxation tracking will be added to the Health & Wellness section accessed from the main tracking menu.\n\nThe options below will now be available for you to track.",
                    textAlign: TextAlign.center,
                    style: TextStyles.textStyleRegular
                        .apply(color: AppColors.colorSkipButton),
                  ),
                  _buildRelxTechniqueList(),
                ],
              )))
    ]);
  }

  _buildSetReminders() {
    return Column(children: [
      SizedBox(height: ScreenConstant.defaultHeightTwenty * 1.5),
      Card(
          margin: EdgeInsets.zero,
          color: AppColors.colorBackground,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ScreenConstant.defaultWidthTwenty,
              ),
              child: Column(
                children: [
                  SizedBox(height: ScreenConstant.defaultHeightForty),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Reminders set for this plan",
                          style: TextStyles.textStyleIntroDescription
                              .apply(color: Colors.white, fontSizeDelta: -2)),
                      CustomSwitch(
                        value: true,
                        color: AppColors.colorYesButton,
                      ),
                    ],
                  ),
                  SizedBox(height: ScreenConstant.defaultHeightTen),
                  Divider(
                      thickness: 1, color: AppColors.white.withOpacity(0.12)),
                  _buildTimeList(),
                  SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
                ],
              )))
    ]);
  }

  _buildTimeList() {
    return ListView.separated(
      itemCount: 2,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return Row(
          children: [
            Icon(
              Icons.access_time_filled,
              color: AppColors.colorIcons,
            ),
            SizedBox(width: ScreenConstant.sizeDefault),
            Text(
              "Daily at 4:00 PM",
              style: TextStyles.textStyleRegular.apply(color: Colors.white),
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  "Edit",
                  style: TextStyles.textStyleRegular.apply(
                      color: AppColors.colorSkipButton, fontSizeDelta: -2),
                )),
            Spacer(),
            CustomSwitch(
              color: AppColors.colorIcons,
              value: true,
            ),
          ],
        );
      },
      separatorBuilder: (BuildContext context, int index) =>
          Divider(thickness: 1, color: AppColors.white.withOpacity(0.12)),
    );
  }
}
