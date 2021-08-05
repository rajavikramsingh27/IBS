import 'package:flutter/material.dart';
import 'package:flutter_ibs/controllers/food/FoodController.dart';
import 'package:flutter_ibs/utils/Assets.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/DummyData.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/AdditionalNoteWidget.dart';
import 'package:flutter_ibs/widget/CustomArcPainter.dart';
import 'package:flutter_ibs/widget/CustomElevatedButton.dart';
import 'package:flutter_ibs/widget/CustomPainters.dart';
import 'package:flutter_ibs/widget/DateTimeCardWidget.dart';
import 'package:flutter_ibs/widget/OvalPainterWidget.dart';
import 'package:flutter_ibs/widget/WavePainter.dart';
import 'package:get/get.dart';

class Foods extends StatelessWidget {
  final _controller = Get.put(FoodController());

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
        physics: ClampingScrollPhysics(),
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
                          "Track Food",
                          style: TextStyles.textStyleIntroDescription
                              .apply(color: Colors.black, fontSizeDelta: -2),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: ScreenConstant.defaultHeightForty),
                        DateTimeCardWidget(),
                        SizedBox(height: ScreenConstant.defaultHeightForty),
                        Text(
                          "What meal is this?",
                          style: TextStyles.textStyleIntroDescription
                              .apply(color: Colors.black, fontSizeDelta: -2),
                          textAlign: TextAlign.center,
                        ),
                        _buildMealList(),
                        Stack(
                          children: [
                            Positioned.fill(
                              top: ScreenConstant.defaultHeightSeventy,
                              child: _buildWavePainter(),
                            ),
                            Container(
                                margin: EdgeInsets.only(
                                  left: ScreenConstant.defaultWidthTwenty,
                                  right: ScreenConstant.defaultWidthTwenty,
                                ),
                                child: Column(
                                  children: [
                                    _buildFoods(),
                                    SizedBox(
                                        height:
                                            ScreenConstant.defaultHeightSixty),
                                    _buildHydration(),
                                  ],
                                )),
                          ],
                        ),
                        SizedBox(height: ScreenConstant.defaultHeightTwenty),
                        AdditionalNoteWidget(),
                        SizedBox(
                            height: ScreenConstant.defaultHeightTwentyFour),
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

  _buildMealList() {
    return GridView.builder(
      padding: EdgeInsets.symmetric(
          horizontal: ScreenConstant.defaultHeightForty * 1.2,
          vertical: ScreenConstant.defaultHeightTwentyFour),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: DummyData.trackFoodList.length,
      itemBuilder: (BuildContext context, int index) {
        var model = DummyData.trackFoodList[index];
        return Container(
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.colorBorder, width: 1)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                model.image!,
                width: ScreenConstant.sizeXXXL,
              ),
              SizedBox(height: ScreenConstant.sizeDefault),
              Text(
                model.text!,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyles.textStyleRegular
                    .apply(color: Colors.black, fontSizeDelta: 2),
              ),
            ],
          ),
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          crossAxisCount: 2,
          childAspectRatio: 1.2),
    );
  }

  _buildFoods() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Card(
          margin: EdgeInsets.zero,
          color: AppColors.colorBackground,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(height: ScreenConstant.defaultHeightForty),
                  Text("What Did you Eat?",
                      style: TextStyles.textStyleIntroDescription
                          .apply(color: Colors.white, fontSizeDelta: -3)),
                  SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
                  Text(
                    "Select from this list of common foods or add another",
                    textAlign: TextAlign.center,
                    style: TextStyles.textStyleRegular
                        .apply(color: AppColors.colorSkipButton),
                  ),
                  _buildListOfFoodsTaken(),
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
                        "Add this food",
                        style: TextStyles.textStyleRegular
                            .apply(color: AppColors.white),
                      )
                    ],
                  ),
                  SizedBox(height: ScreenConstant.defaultHeightTwenty),
                  _buildRegularFoodsTaken(),
                  _buildLOWFODMAPFoods(),
                  SizedBox(height: ScreenConstant.defaultHeightForty * 1.4),
                ],
              ),
              Container(
                height: ScreenConstant.defaultHeightOneHundred,
                child: OvalPainterWidget(),
              )
            ],
          ),
        ),
        Positioned(
            bottom: -50,
            child: CustomArcPainter2(
                height: 100,
                width: 100,
                quarterTurns: 0,
                painter:
                    MyPainter(AppColors.colorSymptomsGridBg.withOpacity(0.5)))),
        Positioned(
            bottom: -100,
            child: CustomArcPainter2(
                height: 200,
                width: 200,
                quarterTurns: 0,
                painter: MyPainter(
                    AppColors.colorSymptomsGridBg.withOpacity(0.20)))),
      ],
    );
  }

  _buildHydration() {
    return Column(
      children: [
        Text("Hydration",
            style: TextStyles.textStyleIntroDescription
                .apply(color: Colors.white, fontSizeDelta: -2)),
        SizedBox(height: ScreenConstant.sizeDefault),
        Text(
          "How many glasses of water have you had today",
          textAlign: TextAlign.center,
          style: TextStyles.textStyleRegular.apply(color: AppColors.white),
        ),
        SizedBox(height: ScreenConstant.defaultHeightForty),
        GridView.builder(
          padding: EdgeInsets.symmetric(
            horizontal: ScreenConstant.defaultWidthTwenty,
          ),
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return CircleAvatar(
              backgroundColor: Colors.white.withOpacity(0.20),
              child: Padding(
                  padding: ScreenConstant.spacingAllMedium,
                  child: Image.asset(
                    Assets.emptyGlass,
                    width: ScreenConstant.defaultWidthTwenty,
                    height: ScreenConstant.defaultHeightTwenty * 1.5,
                  )),
            );
          },
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              crossAxisCount: 5,
              childAspectRatio: 0.99),
        ),
        SizedBox(height: ScreenConstant.defaultHeightSixty),
      ],
    );
  }

  _buildListOfFoodsTaken() {
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
              model.title!,
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
    return CustomPaint(
      size: Size(
          Get.context!.mediaQuerySize.width, Get.context!.mediaQuerySize.height),
      painter: WavePainter(),
    );
  }

  _buildRegularFoodsTaken() {
    return Column(
      children: [
        Text("My Regular Breakfast Foods",
            style: TextStyles.textStyleIntroDescription
                .apply(color: Colors.white, fontSizeDelta: -2)),
        _buildListOfFoodsTaken(),
      ],
    );
  }

  _buildLOWFODMAPFoods() {
    return Column(
      children: [
        Text("Low FODMAP Favourites",
            style: TextStyles.textStyleIntroDescription
                .apply(color: Colors.white, fontSizeDelta: -2)),
        SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
        Text(
          "Add some popular low FODMAP foods to your favourites in your food tracking journal.",
          textAlign: TextAlign.center,
          style: TextStyles.textStyleRegular
              .apply(color: AppColors.colorSkipButton),
        ),
        _buildListOfFoodsTaken(),
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
              style: TextStyles.textStyleRegular.apply(color: AppColors.white),
            )
          ],
        ),
      ],
    );
  }
}
