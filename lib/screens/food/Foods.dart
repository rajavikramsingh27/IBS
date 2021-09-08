import 'package:flutter/material.dart';
import 'package:flutter_ibs/controllers/food/FoodController.dart';
import 'package:flutter_ibs/controllers/signup/SignUpController.dart';
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/DateTime.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/AdditionalNoteWidget.dart';
import 'package:flutter_ibs/widget/CustomArcPainter.dart';
import 'package:flutter_ibs/widget/CustomElevatedButton.dart';
import 'package:flutter_ibs/widget/CustomPainters.dart';
import 'package:flutter_ibs/widget/DateTimeCardWidget.dart';
import 'package:flutter_ibs/widget/OvalPainterWidget.dart';
import 'package:flutter_ibs/widget/WavePainter.dart';
import 'package:flutter_ibs/widget/utils.dart';
import 'package:get/get.dart';

class Foods extends StatelessWidget {
  final TrackablesListModel trackFoodList;

  Foods({Key key, this.trackFoodList}) : super(key: key);

  final FoodController _controller = Get.put(FoodController());
  final SignUpController _signUpController = Get.find();

  @override
  Widget build(BuildContext context) {
    print("model:$trackFoodList");
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: _signUpController.loader.value
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: ScreenConstant.defaultHeightTen),
                  _controller.loader.value
                      ? Offstage()
                      : CustomElevatedButton(
                          widthFactor: 0.7,
                          text: "Save",
                          onTap: _controller.onSave,
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
      body: Obx(
        () => InkWell(
          onTap: () => dismissKeyboard(context),
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
                              "Track Food",
                              style: TextStyles.textStyleIntroDescription.apply(
                                  color: Colors.black, fontSizeDelta: -2),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: ScreenConstant.defaultHeightForty),
                            DateTimeCardWidget(),
                            SizedBox(height: ScreenConstant.defaultHeightForty),
                            Text(
                              "What meal is this?",
                              style: TextStyles.textStyleIntroDescription.apply(
                                  color: Colors.black, fontSizeDelta: -2),
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
                                            height: ScreenConstant
                                                .defaultHeightSixty),
                                        _buildHydration(),
                                      ],
                                    )),
                              ],
                            ),
                            SizedBox(
                                height: ScreenConstant.defaultHeightTwenty),
                            AdditionalNoteWidget(
                              textEditingController:
                                  _controller.noteTextController,
                            ),
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
        ),
      ),
    );
  }

  _buildWavePainter() {
    return CustomPaint(
      size: Size(
          Get.context.mediaQuerySize.width, Get.context.mediaQuerySize.height),
      painter: WavePainter(),
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
                  _buildListDefaultFood(),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    margin: ScreenConstant.spacingAllLarge,
                    child: FractionallySizedBox(
                      child: TextFormField(
                        controller: _controller.foodTextController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Add Food",
                            hintStyle: TextStyles.textStyleRegular
                                .apply(color: AppColors.colorTextHint),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: ScreenConstant.sizeMedium,
                            )),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      _controller.listfoodDefault.add(
                          Default(value: _controller.foodTextController.text));
                    },
                    child: Row(
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

  _buildMealList() {
    return GridView.builder(
      padding: EdgeInsets.symmetric(
          horizontal: ScreenConstant.defaultHeightForty * 1.2,
          vertical: ScreenConstant.defaultHeightTwentyFour),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount:
          _signUpController.food.value.items?.first?.list?.options?.length ?? 0,
      itemBuilder: (BuildContext context, int index) {
        var model =
            _signUpController.food.value.items?.first?.list?.options[index];

        var startTime = CustomDateTime().parseTimeAsDateTime(
            dateTime: model.conditionalDefault.time.first.startTime,
            returnFormat: "HH:mm");
        var endTime = CustomDateTime().parseTimeAsDateTime(
            dateTime: model.conditionalDefault.time.first.endTime,
            returnFormat: "HH:mm");

        var s =
            "${_controller.currentDateTime.value.hour}:${_controller.currentDateTime.value.minute}";
        var u = CustomDateTime()
            .parseTimeAsDateTime(dateTime: s, returnFormat: "HH:mm");
        // print("uefbjfe:$s");

        // var p = u.difference(startTime).inSeconds;
        // print("diff:$p");

        // print("date:$startTime");
        // print("currentdate:$u");
        _controller.startTimeDifference.value =
            u.difference(startTime).inSeconds;
        _controller.startTimeDifference.value =
            (endTime.difference(u).inSeconds);
        if (model.optionDefault) {
          if ((endTime.difference(u).inSeconds) > 0 &&
              (u.difference(startTime).inSeconds) > 0) {
            model.optionDefault = true;
          }
        }

        return Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                  model.optionDefault ? model.image.active : model.image.normal,
                ),
              ),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.colorBorder, width: 1)),
          child: InkWell(
            onTap: () {
              _signUpController.food.value.items.first.list.options
                  .forEach((element) {
                if (element.optionDefault) {
                  element.optionDefault = false;
                }
              });
              model.optionDefault = !model.optionDefault;
              _controller.modelMealIndex.value = index;
              _controller.mealTypeValue.value = model.value;
            },
            child: Stack(
              children: [
                Positioned(
                  bottom: ScreenConstant.sizeLarge,
                  left: 0,
                  right: 0,
                  child: Text(
                    model.value.tr ?? "",
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyles.textStyleRegular.apply(
                        color:
                            model.optionDefault ? Colors.white : Colors.black,
                        fontSizeDelta: 2),
                  ),
                ),
              ],
            ),
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

  _buildListDefaultFood() {
    // print("ind$index");
    return GridView.builder(
      padding: EdgeInsets.symmetric(
          horizontal: ScreenConstant.sizeLarge,
          vertical: ScreenConstant.defaultHeightTwentyFour),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: _controller.listfoodDefault.length ?? 0,
      itemBuilder: (BuildContext context, int ind) {
        var model = _controller.listfoodDefault[ind];

        return InkWell(
          onTap: () {
            if (_controller.listfoodDefault.contains(model))
              _controller.listfoodDefault.removeAt(ind);
          },
          child: Card(
            color: AppColors.colorArrowButton,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100)),
            child: Center(
              child: Text(
                model.value.tr ?? "",
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyles.textStyleRegular
                    .apply(color: Colors.white, fontSizeDelta: -2),
              ),
            ),
          ),
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, childAspectRatio: 3.5),
    );
  }

  _buildRegularFoodsTaken() {
    return Column(
      children: [
        Text("My Regular Breakfast Foods",
            style: TextStyles.textStyleIntroDescription
                .apply(color: Colors.white, fontSizeDelta: -2)),
        _buildListOfFoodsTaken(_controller.modelMealIndex.value),
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
        _buildListLowFood(_controller.modelMealIndex.value),
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

  _buildListOfFoodsTaken(int index) {
    // print(
    //     "ind${_signUpController.food.value.items.first.children.elementAt(index).items.first.tags.tagsDefault.length}");
    return GridView.builder(
      padding: EdgeInsets.symmetric(
          horizontal: ScreenConstant.sizeLarge,
          vertical: ScreenConstant.defaultHeightTwentyFour),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: _signUpController.food.value.items
              .elementAt(0)
              .children
              ?.elementAt(index)
              ?.items
              ?.first
              ?.tags
              ?.tagsDefault
              ?.length ??
          0,
      itemBuilder: (BuildContext context, int ind) {
        print("hbcdhsh:$index");
        var model = _signUpController.food.value.items
            .elementAt(0)
            .children
            ?.elementAt(index)
            ?.items
            ?.first
            ?.tags
            ?.tagsDefault[ind];
        Future.delayed(Duration.zero, () {
          _controller.mealtid.value = _signUpController.food.value.items
              ?.elementAt(0)
              ?.children
              ?.elementAt(index)
              ?.items
              ?.first
              ?.tid;
          print("tid:${_controller.mealtid.value}");
        });
        return InkWell(
          onTap: () {
            if (!_controller.listfoodDefault.contains(model))
              _controller.listfoodDefault.add(model);
          },
          child: Card(
            color: AppColors.colorSymptomsGridBg,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100)),
            child: Center(
              child: Text(
                model.value.tr ?? "",
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyles.textStyleRegular
                    .apply(color: Colors.white, fontSizeDelta: -2),
              ),
            ),
          ),
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, childAspectRatio: 3.5),
    );
  }

  _buildListLowFood(int index) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(
          horizontal: ScreenConstant.sizeLarge,
          vertical: ScreenConstant.defaultHeightTwentyFour),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: _signUpController.food.value.items.first.children
              ?.elementAt(index)
              ?.items
              ?.first
              ?.children
              ?.first
              ?.items
              ?.first
              ?.tags
              ?.tagsDefault
              ?.length ??
          0,
      itemBuilder: (BuildContext context, int indx) {
        var model = _signUpController.food.value.items.first.children
            ?.elementAt(index)
            ?.items
            ?.first
            ?.children
            ?.first
            ?.items
            ?.first
            ?.tags
            ?.tagsDefault[indx];
        return InkWell(
          onTap: () {
            if (!_controller.listfoodDefault.contains(model))
              _controller.listfoodDefault.add(model);
          },
          child: Card(
            color: AppColors.colorSymptomsGridBg,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100)),
            child: Center(
              child: Text(
                model.value.tr ?? "",
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyles.textStyleRegular
                    .apply(color: Colors.white, fontSizeDelta: -2),
              ),
            ),
          ),
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, childAspectRatio: 3.5),
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
        _buildHydrationList(_controller.modelMealIndex.value),
        SizedBox(height: ScreenConstant.defaultHeightSixty),
      ],
    );
  }

  _buildHydrationList(int index) {
    return GridView.builder(
      padding:
          EdgeInsets.symmetric(horizontal: ScreenConstant.defaultWidthTwenty),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: _signUpController.food.value.items.elementAt(1).sum.range ?? 0,
      itemBuilder: (BuildContext context, int ind) {
        return InkWell(
          onTap: () {
            ind++;
            _controller.noOfGlasses.value = ind;

            print("glass:${_controller.noOfGlasses}");
          },
          // child: CircleAvatar(
          //   backgroundColor: Colors.white.withOpacity(0.20),
          child: Padding(
              padding: ScreenConstant.spacingAllMedium,
              child: Image.network(
                _controller.noOfGlasses > ind
                    ? _signUpController.food.value.items
                        .elementAt(1)
                        .sum
                        .image
                        .active
                    : _signUpController.food.value.items
                        .elementAt(1)
                        .sum
                        .image
                        .normal,
                width: ScreenConstant.defaultWidthTwenty * 5,
                height: ScreenConstant.defaultHeightTwenty * 1.5,
              )),
          // ),
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 0.01,
          mainAxisSpacing: 0.01,
          crossAxisCount: 5,
          childAspectRatio: 1),
    );
  }
}
