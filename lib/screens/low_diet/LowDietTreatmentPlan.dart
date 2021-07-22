import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ibs/utils/Assets.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/DummyData.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/CustomArcPainter.dart';
import 'package:flutter_ibs/widget/CustomElevatedButton.dart';
import 'package:flutter_ibs/widget/CustomSwitch.dart';
import 'package:flutter_ibs/widget/DateTimeCardWidget.dart';
import 'package:flutter_ibs/widget/utils.dart';
import 'package:get/get.dart';

class LowDietTreatmentPlan extends StatelessWidget {
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
                            "Treatment Plan: Low FODMAP diet",
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
                              height: ScreenConstant.defaultHeightTwentyThree),
                          Stack(
                            children: [
                              Positioned.fill(
                                top: ScreenConstant.defaultHeightOneHundred,
                                child: _buildLowFodmapBg(),
                              ),
                              Container(
                                  margin: EdgeInsets.symmetric(
                                    horizontal:
                                        ScreenConstant.defaultWidthTwenty,
                                  ),
                                  child: Column(
                                    children: [
                                      _buildLowFodmapFoods(),
                                      _buildPlanDetails(),
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

  _buildLowFodmapFoods() {
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
                Text("Low FODMAP Foods",
                    style: TextStyles.textStyleIntroDescription
                        .apply(color: Colors.white, fontSizeDelta: -2)),
                SizedBox(height: ScreenConstant.defaultHeightTwentyThree),
                Text(
                  "Add some popular low FODMAP foods to your favourites in your food tracking journal.",
                  textAlign: TextAlign.center,
                  style: TextStyles.textStyleRegular
                      .apply(color: Colors.white.withOpacity(0.39)),
                ),
                _buildLowFodmapFoodsList(),
                SizedBox(height: ScreenConstant.defaultHeightFifteen),
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
                      "Show me more",
                      style: TextStyles.textStyleRegular
                          .apply(color: AppColors.white),
                    )
                  ],
                ),
                SizedBox(height: ScreenConstant.defaultHeightFifteen * 2),
                Text(
                  "Continue to track your food intake and symptoms in the app. Try your best to choose foods low in FODMAPs when selecting meals.",
                  textAlign: TextAlign.center,
                  style: TextStyles.textStyleRegular
                      .apply(color: Colors.white.withOpacity(0.39)),
                ),
                SizedBox(height: ScreenConstant.defaultHeightTwenty),
                Divider(thickness: 1, color: AppColors.white.withOpacity(0.12)),
                _buildNotification(),
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

  _buildLowFodmapFoodsList() {
    return GridView.builder(
      padding: EdgeInsets.symmetric(
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
          crossAxisCount: 3, childAspectRatio: 2.5),
    );
  }

  _buildLowFodmapBg() {
    return Container(
      decoration: BoxDecoration(color: AppColors.colorProfileBg,borderRadius: BorderRadius.only(bottomLeft: Radius.circular(24),bottomRight:  Radius.circular(24))),
      margin: EdgeInsets.only(top: ScreenConstant.defaultHeightTwenty * 1.5),
      width: Get.context.mediaQuerySize.width,
      child: Image.asset(Assets.lowFoodbg,filterQuality: FilterQuality.high,fit: BoxFit.fill,
       
      ),
    );
  }

  _buildNotification() {
    return Column(
      children: [
        SizedBox(height: ScreenConstant.defaultHeightTwentyThree),
        Text("Notifications",
            style: TextStyles.textStyleIntroDescription
                .apply(color: Colors.white, fontSizeDelta: -3)),
        SizedBox(height: ScreenConstant.defaultHeightTwentyThree),
        Text(
          "Would you like to set up app notifications to remind you?",
          textAlign: TextAlign.center,
          style: TextStyles.textStyleRegular
              .apply(color: Colors.white.withOpacity(0.39)),
        ),
        SizedBox(height: ScreenConstant.defaultHeightTwentyThree),
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
        SizedBox(height: ScreenConstant.defaultHeightTwentyThree),
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
              "Add Notifications",
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
              .apply(color: Colors.black, fontSizeDelta: -2)),
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
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.symmetric(
                          vertical: ScreenConstant.sizeDefault),
                      height: ScreenConstant.defaultHeightNinety,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      alignment: Alignment.center,
                      child: Image.asset(
                        Assets.bread,
                        width: ScreenConstant.sizeExtraLarge,
                      ),
                    ),
                  ),
                  SizedBox(width: ScreenConstant.sizeLarge),
                  Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CustomSwitch(
                                value: true,
                                color: AppColors.colorYesButton,
                              ),
                              SizedBox(width: ScreenConstant.sizeMedium),
                              Text(
                                "Reminder",
                                style: TextStyles.textStyleIntroDescription
                                    .apply(
                                        fontSizeDelta: -4, color: Colors.white),
                              )
                            ],
                          ),
                          Divider(
                              thickness: 1,
                              color: AppColors.white.withOpacity(0.12)),
                          _buildTimeList()
                        ],
                      ))
                ],
              ))),
              SizedBox(height: ScreenConstant.sizeXL,)
    ]);
  }

  _buildTimeList() {
    return ListView.separated(
      itemCount: 1,
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
          ],
        );
      },
      separatorBuilder: (BuildContext context, int index) =>
          Divider(thickness: 1, color: AppColors.white.withOpacity(0.12)),
    );
  }
}
