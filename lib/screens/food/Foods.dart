
import 'package:flutter/material.dart';
import 'package:flutter_ibs/controllers/food/FoodController.dart';
import 'package:flutter_ibs/controllers/signup/SignUpController.dart';
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/AdditionalNoteWidget.dart';
import 'package:flutter_ibs/widget/CustomArcPainter.dart';
import 'package:flutter_ibs/widget/CustomElevatedButton.dart';
import 'package:flutter_ibs/widget/CustomPainters.dart';
import 'package:flutter_ibs/widget/DateTimeCardWidget.dart';
import 'package:flutter_ibs/widget/OvalPainterWidget.dart';
import 'package:flutter_ibs/widget/ScreenControls/RenderItemChildrenWidget.dart';
import 'package:flutter_ibs/widget/ScreenControls/RenderWidgetByType.dart';
import 'package:flutter_ibs/widget/WavePainter.dart';
import 'package:flutter_ibs/widget/utils.dart';
import 'package:get/get.dart';

class Foods extends StatelessWidget {
  final TrackablesListModel trackFoodList;

  Foods({Key key, this.trackFoodList}) : super(key: key);

  final FoodController controller = Get.put(FoodController());
  final SignUpController _signUpController = Get.find();

  @override
  Widget build(BuildContext context) {
    //print("model:$trackFoodList");

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
                    controller.loader.value
                        ? Offstage()
                        : CustomElevatedButton(
                            widthFactor: 0.7,
                            text: "Save",
                            onTap: controller.onSave,
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
          () => ListView(
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
                              _signUpController.food.value.header.tr,
                              style: TextStyles.textStyleIntroDescription.apply(
                                  color: Colors.black, fontSizeDelta: -2),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: ScreenConstant.defaultHeightForty),
                            DateTimeCardWidget(),
                            SizedBox(height: ScreenConstant.defaultHeightForty),
                            Text(
                              _signUpController.food.value.items.first.name.tr,
                              style: TextStyles.textStyleIntroDescription.apply(
                                  color: Colors.black, fontSizeDelta: -2),
                              textAlign: TextAlign.center,
                            ),
                            _buildMealList(controller.formWidgetList.first),

                            controller.loader.value
                                ? Center(
                                child: Padding(
                                  padding: ScreenConstant.spacingAllLarge,
                                  child: Container(
                                      height:
                                      ScreenConstant.screenHeightThird,
                                      child: Center(
                                          child:
                                          CircularProgressIndicator())),
                                ))
                                : //RenderItemChildrenWidget(trackableItem:controller.formWidgetList.first),
                            controller.formWidgetList.first.list.value != null ? _renderFoodGroup(controller.formWidgetList.first.list.value) : Offstage(),
                              RenderWidgetByType().renderTrackableItem(controller.formWidgetList[controller.formWidgetList.length -2], isLast: true),
                            RenderWidgetByType().renderTrackableItem(controller.formWidgetList.last),
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


        ));
  }



  /// HACK: We're hard-coding the food selection list to save some time.
  _buildMealList(TrackableItem foodParent) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(
          horizontal: ScreenConstant.defaultHeightForty * 1.2,
          vertical: ScreenConstant.defaultHeightTwentyFour),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount:
        foodParent.list?.options?.length ?? 0,
      itemBuilder: (BuildContext context, int index) {
        // _controller.mealOptionDefault(mealIndex: index);
        var model =
        foodParent.list?.options[index];

        return InkWell(
          onTap: () {
            controller.formWidgetList.first.list.options
                .forEach((element) {
              if (element.optionDefault) {
                element.optionDefault = false;
              }

            });
            model.optionDefault = !model.optionDefault;
            controller.formWidgetList.first.list.value = model;
            controller.formWidgetList.refresh();
            /*    _controller.modelMealIndex.value = index;
            _controller.mealTypeValue.value = model.value;
            _controller.modelMealIndex.refresh();
            _signUpController.food.refresh();
            */
          },
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    // ((endTime.difference(u).inSeconds) > 0 &&
                    //         (u.difference(startTime).inSeconds) > 0)
                    //     ? model.image.active
                    model.optionDefault
                        ? model.image.active
                        : model.image.normal,
                  ),
                ),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.colorBorder, width: 1)),
            child: Stack(
              children: [
                Positioned(
                  bottom: ScreenConstant.sizeLarge,
                  left: 0,
                  right: 0,
                  child: Text(
                    model.label.tr ?? "",
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



  _renderFoodGroup(ListOption option){
    TrackableItem item;

    switch (option.value){
      case "breakfast":
        item = controller.formWidgetList.first.children[0].items[0];
        return RenderWidgetByType().renderTrackableItem( item, isFirst: true, isLast: true );
      case "lunch":
        item = controller.formWidgetList.first.children[1].items[0];
        return RenderWidgetByType().renderTrackableItem( item, isFirst: true, isLast: true );
      case "dinner":
        item = controller.formWidgetList.first.children[2].items[0];
        return RenderWidgetByType().renderTrackableItem( item, isFirst: true, isLast: true  );
      case "snacks":
        item = controller.formWidgetList.first.children[3].items[0];
        return RenderWidgetByType().renderTrackableItem( item, isFirst: true, isLast: true  );
      default:
        return Offstage();
    }
  }




  _buildFoodSelection(){
    return Offstage();

    return ListView(
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
                            controller.loader.value
                                ? Center(
                                    child: Padding(
                                    padding: ScreenConstant.spacingAllLarge,
                                    child: Container(
                                        height:
                                            ScreenConstant.screenHeightThird,
                                        child: Center(
                                            child:
                                                CircularProgressIndicator())),
                                  ))
                                : ListView.builder(
                                    shrinkWrap: true,
                                    physics: ClampingScrollPhysics(),
                                    itemCount: controller.formWidgetList.length,
                                    itemBuilder: (_, mainIndex) {
                                      var isLast = false;

                                      if (mainIndex ==
                                              (controller
                                                      .formWidgetList.length -
                                                  2) ||
                                          mainIndex ==
                                              (controller
                                                      .formWidgetList.length -
                                                  1)) {
                                        // If it's the last one or two... because additional notes could be after.
                                        isLast = true;
                                      }
                                      return RenderWidgetByType()
                                          .renderTrackableItem(
                                              controller
                                                  .formWidgetList[mainIndex],
                                              isFirst: mainIndex == 0,
                                              isLast: isLast,
                                              onValueChanged:
                                                  controller.valueChanged);
                                    }),
                            SizedBox(
                                height: ScreenConstant.defaultHeightTwenty),
                          ],
                        ),
                      ),
                    ),
                    Positioned(right: 0, left: 0, child: CustomArcPainter())
                  ],
                ),
              ),
            ],
          );
  }

  /*
  Obx(
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
                              _signUpController.food.value.header.tr,
                              style: TextStyles.textStyleIntroDescription.apply(
                                  color: Colors.black, fontSizeDelta: -2),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: ScreenConstant.defaultHeightForty),
                            DateTimeCardWidget(),
                            SizedBox(height: ScreenConstant.defaultHeightForty),
                            Text(
                              _signUpController.food.value.items.first.name.tr,
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
                                        _buildFoods(
                                            _controller.modelMealIndex.value),
                                        SizedBox(
                                            height: ScreenConstant
                                                .defaultHeightSixty),
                                        _buildHydration(
                                            _controller.modelMealIndex.value),
                                      ],
                                    )),
                              ],
                            ),
                            SizedBox(
                                height: ScreenConstant.defaultHeightTwenty),
                            AdditionalNoteWidget(
                              textEditingController:
                                  _controller.noteTextController,
                              text: _signUpController.food.value.items
                                  .elementAt(2)
                                  .name
                                  .tr,
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
   */

  _buildWavePainter() {
    return CustomPaint(
      size: Size(
          Get.context.mediaQuerySize.width, Get.context.mediaQuerySize.height),
      painter: WavePainter(),
    );
  }

  /*

  _buildFoods(int index) {
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
                  Text(
                      _signUpController.food.value.items.first.children[index]
                          .items.first.name.tr,
                      style: TextStyles.textStyleIntroDescription
                          .apply(color: Colors.white, fontSizeDelta: -2)),
                  SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
                  Text(
                    _signUpController.food.value.items.first.children[index]
                        .items.first.description.tr,
                    textAlign: TextAlign.center,
                    style: TextStyles.textStyleIntroDescription
                        .apply(color: Colors.white, fontSizeDelta: -2),
                  ),
                  _buildListDefaultFood(_controller.modelMealIndex.value),
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
                      if (_controller.foodTextController.text.isNotEmpty)
                        _controller.listfoodDefault.add(Tag(
                            value: _controller.foodTextController.text));
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
                          _signUpController
                              .food
                              .value
                              .items
                              .first
                              .children[_controller.modelMealIndex.value]
                              .items
                              .first
                              .tags
                              .addableLabel
                              .tr,
                          style: TextStyles.textStyleRegular
                              .apply(color: AppColors.white),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: ScreenConstant.defaultHeightTwenty),
                  _buildRegularFoodsTaken(_controller.modelMealIndex.value),
                  _buildLOWFODMAPFoods(_controller.modelMealIndex.value),
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
*/


  /*
  _buildListDefaultFood(int index) {
    // print("ind$index");
    return _controller.listfoodDefault.isNotEmpty
        ? GridView.builder(
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
          )
        : Padding(
            padding: EdgeInsets.symmetric(
                horizontal: ScreenConstant.sizeLarge,
                vertical: ScreenConstant.defaultHeightTwentyFour),
            child: Text(
              _signUpController.food.value.items.first.children[index].items
                  .first.tags.placeholder.tr,
              textAlign: TextAlign.center,
              style: TextStyles.textStyleRegular
                  .apply(color: AppColors.colorSkipButton),
            ),
          );
  }

  _buildRegularFoodsTaken(int index) {
    return Column(
      children: [
        Text(
            _signUpController.food.value.items.first.children[index].items.first
                .tags.name.tr,
            style: TextStyles.textStyleIntroDescription
                .apply(color: Colors.white, fontSizeDelta: -2)),
        _buildListOfFoodsTaken(_controller.modelMealIndex.value),
      ],
    );
  }

  _buildLOWFODMAPFoods(int index) {
    return Column(
      children: [
        Text(
            _signUpController.food.value.items.first.children[index].items.first
                .children.first.items.first.tags.name.tr,
            style: TextStyles.textStyleIntroDescription
                .apply(color: Colors.white, fontSizeDelta: -2)),
        SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
        Text(
          _signUpController.food.value.items.first.children[index].items.first
              .children.first.items.first.tags.description.tr,
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
        Future.delayed(Duration.zero, () {
          _controller.mealtid.value = _signUpController
              .food.value.items.first.children[index].items.first.tid;
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

  _buildHydration(int index) {
    return Column(
      children: [
        Text(_signUpController.food.value.items.elementAt(1).name.tr,
            style: TextStyles.textStyleIntroDescription
                .apply(color: Colors.white, fontSizeDelta: -2)),
        SizedBox(height: ScreenConstant.sizeDefault),
        Text(
          _signUpController.food.value.items.elementAt(1).description.tr,
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
            _controller.noOfGlasses.refresh();
            _signUpController.food.refresh();
            print("glass:${_controller.noOfGlasses}");
          },
          // child: CircleAvatar(
          //   backgroundColor: Colors.white.withOpacity(0.20),
          child: Padding(
              padding: ScreenConstant.spacingAllMedium,
              child: _controller.loader.value
                  ? CircularProgressIndicator()
                  : Image.network(
                      _controller.noOfGlasses.value > ind
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
*/
}

