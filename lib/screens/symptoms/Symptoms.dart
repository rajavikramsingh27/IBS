import 'package:flutter/material.dart';
import 'package:flutter_ibs/controllers/symptoms/SymptomsController.dart';
import 'package:flutter_ibs/controllers/signup/SignUpController.dart';
import 'package:flutter_ibs/models/Symptoms/SymptomsModel.dart';
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/AdditionalNoteWidget.dart';
import 'package:flutter_ibs/widget/CustomArcPainter.dart';
import 'package:flutter_ibs/widget/CustomElevatedButton.dart';
import 'package:flutter_ibs/widget/DateTimeCardWidget.dart';
import 'package:flutter_ibs/widget/DropDownList.dart';
import 'package:flutter_ibs/widget/OvalPainterWidget.dart';
import 'package:flutter_ibs/widget/WavePainter.dart';
import 'package:flutter_ibs/widget/utils.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class Symptoms extends StatelessWidget {
  final SymptomsController _symptomsController = Get.put(SymptomsController());
  final SignUpController _signUpController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              onTap: _symptomsController.onSave,
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
      backgroundColor: AppColors.barrierColor.withOpacity(0.6),
      body: InkWell(
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
                            "Track Symptoms",
                            style: TextStyles.textStyleIntroDescription
                                .apply(color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: ScreenConstant.defaultHeightForty),
                          DateTimeCardWidget(),
                          SizedBox(height: ScreenConstant.defaultHeightForty),
                          Stack(
                            children: [
                              Positioned.fill(
                                top: ScreenConstant.defaultHeightOneHundred,
                                child: Container(
                                  margin: EdgeInsets.only(
                                      top: ScreenConstant.defaultHeightTwenty *
                                          1.5),
                                  width: Get.context.mediaQuerySize.width,
                                  child: CustomPaint(
                                    size: Size(Get.context.mediaQuerySize.width,
                                        Get.context.mediaQuerySize.height),
                                    painter: WavePainter(),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal:
                                      ScreenConstant.defaultWidthTen * 1.6,
                                ),
                                child: Obx(
                                  () => _symptomsController.loader.value
                                      ? Center(
                                          child: Padding(
                                          padding:
                                              ScreenConstant.spacingAllLarge,
                                          child: CircularProgressIndicator(),
                                        ))
                                      : Card(
                                          margin: EdgeInsets.zero,
                                          color: AppColors.colorBackground,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Stack(
                                            children: [
                                              Column(
                                                children: [
                                                  ListView.builder(
                                                      shrinkWrap: true,
                                                      physics:
                                                          ClampingScrollPhysics(),
                                                      itemCount:
                                                          _signUpController
                                                                  .symptoms
                                                                  .value
                                                                  ?.items
                                                                  ?.length ??
                                                              0,
                                                      itemBuilder:
                                                          (BuildContext context,
                                                              int index) {
                                                        if (_signUpController
                                                                .symptoms
                                                                .value
                                                                .items[index]
                                                                .tid ==
                                                            "symptoms-notes") {
                                                          return Offstage();
                                                        } else {
                                                          return ListView(
                                                            shrinkWrap: true,
                                                            physics:
                                                                ClampingScrollPhysics(),
                                                            children: [
                                                              SizedBox(
                                                                  height: ScreenConstant
                                                                          .defaultHeightTwenty *
                                                                      1.6),
                                                              Text(
                                                                _signUpController
                                                                    .symptoms
                                                                    .value
                                                                    .items[
                                                                        index]
                                                                    .tid,
                                                                style: TextStyles
                                                                    .textStyleIntroDescription
                                                                    .apply(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSizeDelta:
                                                                            -3),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              ),
                                                              SizedBox(
                                                                  height: ScreenConstant
                                                                      .defaultHeightTen),
                                                              Text(
                                                                "I have no ${_signUpController.symptoms.value.items[index].tid}",
                                                                style: TextStyles
                                                                    .textStyleRegular
                                                                    .apply(
                                                                        color: AppColors
                                                                            .colorSkipButton),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              ),
                                                              SizedBox(
                                                                  height: ScreenConstant
                                                                      .defaultHeightTwenty),
                                                              Padding(
                                                                padding: EdgeInsets.symmetric(
                                                                    horizontal:
                                                                        ScreenConstant
                                                                            .defaultWidthTen),
                                                                child:
                                                                    SfSliderTheme(
                                                                  data:
                                                                      SfSliderThemeData(
                                                                    thumbColor:
                                                                        AppColors
                                                                            .colorArrowButton,
                                                                    thumbStrokeWidth:
                                                                        5,
                                                                    thumbRadius:
                                                                        16,
                                                                    thumbStrokeColor:
                                                                        Colors
                                                                            .white,
                                                                    activeTrackHeight:
                                                                        4,
                                                                    overlayRadius:
                                                                        0,
                                                                    disabledActiveTrackColor:
                                                                        AppColors
                                                                            .colorTrackSlider,
                                                                    disabledInactiveTrackColor:
                                                                        AppColors
                                                                            .colorTrackSlider,
                                                                    activeDividerStrokeWidth:
                                                                        2,
                                                                    inactiveDividerStrokeWidth:
                                                                        2,
                                                                    inactiveTrackHeight:
                                                                        4,
                                                                    activeTrackColor:
                                                                        AppColors
                                                                            .colorTrackSlider,
                                                                    inactiveTrackColor:
                                                                        AppColors
                                                                            .colorTrackSlider,
                                                                    inactiveDividerStrokeColor:
                                                                        AppColors
                                                                            .white,
                                                                    inactiveDividerRadius:
                                                                        8,
                                                                    inactiveDividerColor:
                                                                        AppColors
                                                                            .colorInactiveDividerSlider,
                                                                    activeDividerColor:
                                                                        AppColors
                                                                            .colorInactiveDividerSlider,
                                                                    activeDividerStrokeColor:
                                                                        Colors
                                                                            .white,
                                                                    activeDividerRadius:
                                                                        8,
                                                                    activeLabelStyle: TextStyles
                                                                        .textStyleRegular
                                                                        .apply(
                                                                            color:
                                                                                AppColors.colorTrackSlider),
                                                                    inactiveLabelStyle: TextStyles
                                                                        .textStyleRegular
                                                                        .apply(
                                                                            color:
                                                                                AppColors.colorTrackSlider),
                                                                  ),
                                                                  child:
                                                                      SfSlider(
                                                                    showDividers:
                                                                        true,
                                                                    min: 1.0,
                                                                    max: _signUpController
                                                                            .symptoms
                                                                            .value
                                                                            .items[index]
                                                                            ?.rating
                                                                            ?.range ??
                                                                        2,
                                                                    interval: 1,
                                                                    stepSize: 1,
                                                                    showLabels:
                                                                        true,
                                                                    value: _signUpController
                                                                        .symptoms
                                                                        .value
                                                                        .items[
                                                                            index]
                                                                        .rating
                                                                        .ratingDefault,
                                                                    onChanged:
                                                                        (dynamic
                                                                            newValue) {
                                                                      _signUpController
                                                                          .symptoms
                                                                          .value
                                                                          .items[
                                                                              index]
                                                                          .rating
                                                                          .ratingDefault = newValue;
                                                                      if (_symptomsController
                                                                              .symptomsModel
                                                                              .value
                                                                              .items ==
                                                                          null) {
                                                                        _symptomsController
                                                                            .symptomsModel
                                                                            .value
                                                                            .items = [];
                                                                      }
                                                                      ItemValue
                                                                          itemValue =
                                                                          ItemValue(
                                                                              numValue: newValue);
                                                                      Item
                                                                          item =
                                                                          Item(
                                                                        value:
                                                                            itemValue,
                                                                        tid: _signUpController
                                                                            .symptoms
                                                                            .value
                                                                            .items[index]
                                                                            .tid,
                                                                      );
                                                                      _symptomsController
                                                                          .symptomsModel
                                                                          .value
                                                                          .items
                                                                          .add(
                                                                              item);
                                                                      Child child = Child(
                                                                          tid: _signUpController
                                                                              .symptoms
                                                                              .value
                                                                              .items[index]
                                                                              .children
                                                                              .first
                                                                              .items
                                                                              .first
                                                                              .tid);
                                                                      if (_symptomsController
                                                                              .symptomsModel
                                                                              .value
                                                                              .items[index]
                                                                              .children ==
                                                                          null) {
                                                                        _symptomsController
                                                                            .symptomsModel
                                                                            .value
                                                                            .items[index]
                                                                            .children = [];
                                                                      }
                                                                      if (child
                                                                              .value ==
                                                                          null) {
                                                                        child.value =
                                                                            ChildValue(arr: []);
                                                                      }
                                                                      _symptomsController
                                                                          .symptomsModel
                                                                          .value
                                                                          .items[
                                                                              index]
                                                                          .children
                                                                          .add(
                                                                              child);
                                                                      _symptomsController
                                                                          .symptomsModel
                                                                          .refresh();
                                                                      _signUpController
                                                                          .symptoms
                                                                          .refresh();
                                                                    },
                                                                    labelFormatterCallback: (dynamic
                                                                            actualValue,
                                                                        String
                                                                            formattedText) {
                                                                      if (actualValue ==
                                                                          1.0) {
                                                                        return "None";
                                                                      }
                                                                      if (actualValue ==
                                                                          _signUpController.symptoms.value.items.length +
                                                                              1) {
                                                                        return "Severe";
                                                                      }
                                                                      return "";
                                                                    },
                                                                  ),
                                                                ),
                                                              ),
                                                              _signUpController
                                                                          .symptoms
                                                                          .value
                                                                          .items[
                                                                              index]
                                                                          .rating
                                                                          .ratingDefault !=
                                                                      1
                                                                  ? Padding(
                                                                      padding:
                                                                          ScreenConstant
                                                                              .spacingAllMedium,
                                                                      child:
                                                                          Column(
                                                                        children: [
                                                                          SizedBox(
                                                                              height: ScreenConstant.defaultHeightTwenty),
                                                                          Text(
                                                                              _signUpController.symptoms.value.items[index].children.first.items.first.tid,
                                                                              textAlign: TextAlign.center,
                                                                              style: TextStyles.textStyleIntroDescription.apply(color: Colors.white, fontSizeDelta: -3)),
                                                                          SizedBox(
                                                                              height: ScreenConstant.defaultHeightTen),
                                                                          Text(
                                                                            _signUpController.symptoms.value.items[index].children.first.items.first.description,
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style:
                                                                                TextStyles.textStyleRegular.apply(color: AppColors.colorSkipButton),
                                                                          ),
                                                                          SizedBox(
                                                                              height: ScreenConstant.defaultHeightTwentyFour),
                                                                          GridView
                                                                              .builder(
                                                                            //   padding: EdgeInsets.symmetric(
                                                                            //       horizontal: ScreenConstant.defaultWidthTwenty),
                                                                            shrinkWrap:
                                                                                true,
                                                                            physics:
                                                                                NeverScrollableScrollPhysics(),
                                                                            itemCount:
                                                                                _signUpController.symptoms.value.items[index].children.first.items.first.list.options.length,
                                                                            itemBuilder:
                                                                                (BuildContext context, int optIdx) {
                                                                              var model = _signUpController.symptoms.value.items[index].children.first.items.first.list.options[optIdx];
                                                                              return InkWell(
                                                                                onTap: () {
                                                                                  _symptomsController.onOptionTapped(model: model, modelValue: _symptomsController.symptomsModel.value.items[index].children.first.value.arr);
                                                                                },
                                                                                child: Card(
                                                                                    elevation: 0,
                                                                                    color: model.optionDefault ? AppColors.colorCloseLight : AppColors.colorSymptomsGridBg,
                                                                                    shape: RoundedRectangleBorder(
                                                                                      borderRadius: BorderRadius.circular(16),
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: ScreenConstant.spacingAllDefault,
                                                                                      child: Column(
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        children: [
                                                                                          Image.network(
                                                                                            model.image.active,
                                                                                            width: ScreenConstant.defaultWidthTwenty * 2.0,
                                                                                          ),
                                                                                          SizedBox(height: ScreenConstant.defaultHeightTen),
                                                                                          Text("${model.label}", textAlign: TextAlign.center, style: TextStyles.textStyleRegular.apply(color: AppColors.white, fontSizeDelta: -2)),
                                                                                        ],
                                                                                      ),
                                                                                    )),
                                                                              );
                                                                            },
                                                                            gridDelegate:
                                                                                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 1),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    )
                                                                  : Offstage(),
                                                              SizedBox(
                                                                  height: ScreenConstant
                                                                          .defaultHeightForty *
                                                                      1.25),
                                                              _signUpController
                                                                          .symptoms
                                                                          .value
                                                                          .items[
                                                                              index]
                                                                          .rating
                                                                          .ratingDefault !=
                                                                      1
                                                                  ? Padding(
                                                                      padding:
                                                                          ScreenConstant
                                                                              .spacingAllMedium,
                                                                      child:
                                                                          Column(
                                                                        children: [
                                                                          Text(
                                                                              "Duration",
                                                                              textAlign: TextAlign.center,
                                                                              style: TextStyles.textStyleIntroDescription.apply(color: Colors.white, fontSizeDelta: -3)),
                                                                          SizedBox(
                                                                              height: ScreenConstant.defaultHeightTen),
                                                                          Text(
                                                                            "How long have you been experiencing abdominal pain ?",
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style:
                                                                                TextStyles.textStyleRegular.apply(color: AppColors.colorSkipButton),
                                                                          ),
                                                                          SizedBox(
                                                                              height: ScreenConstant.defaultHeightTwentyFour),
                                                                          Container(
                                                                            height:
                                                                                ScreenConstant.defaultHeightForty,
                                                                            width:
                                                                                double.maxFinite,
                                                                            margin: EdgeInsets.only(
                                                                                left: ScreenConstant.defaultWidthTen * 1.5,
                                                                                right: ScreenConstant.defaultWidthTen * 1.5,
                                                                                bottom: ScreenConstant.defaultHeightTen * 1.5),
                                                                            padding:
                                                                                EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                                                                            decoration:
                                                                                BoxDecoration(color: AppColors.colordropdownArrowBg, borderRadius: BorderRadius.all(Radius.circular(8))),
                                                                            // dropdown below..
                                                                            child:
                                                                                CustomDropdown<SelectOption>(
                                                                              value: _signUpController.symptoms.value.items[index].children.first.items.last.select.selectDefault.label != null ? _signUpController.symptoms.value.items[index].children.first.items.last.select.selectDefault : _signUpController.symptoms.value.items[index].children.first.items.last.select.options.first,
                                                                              dropdownMenuItemList: buildDropList(_signUpController.symptoms.value.items[index].children.first.items.last.select.options),
                                                                              onChanged: (SelectOption optionItem) {
                                                                                ChildValue childValue = ChildValue(str: optionItem.value);
                                                                                Child child = Child(tid: _signUpController.symptoms.value.items[index].children.first.items.last.tid, dtype: "str", kind: "select", value: childValue);
                                                                                if (_symptomsController.symptomsModel.value.items[index].children == null) {
                                                                                  _symptomsController.symptomsModel.value.items[index].children = [];
                                                                                }
                                                                                _symptomsController.symptomsModel.value.items[index].children.add(child);
                                                                                _signUpController.symptoms.value.items[index].children.first.items.last.select.selectDefault = optionItem;
                                                                                _symptomsController.symptomsModel.refresh();
                                                                                _symptomsController.optionItemSelected.refresh();
                                                                                _signUpController.symptoms.refresh();
                                                                              },
                                                                              isEnabled: true,
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                              height: ScreenConstant.defaultHeightTwentyFour),
                                                                          Divider(
                                                                              thickness: 1,
                                                                              color: AppColors.white.withOpacity(0.12)),
                                                                          SizedBox(
                                                                              height: ScreenConstant.defaultHeightTwenty),
                                                                        ],
                                                                      ),
                                                                    )
                                                                  : Offstage(),
                                                              SizedBox(
                                                                  height: ScreenConstant
                                                                      .defaultHeightTwenty),
                                                            ],
                                                          );
                                                        }
                                                      }),
                                                ],
                                              ),
                                              Container(
                                                height: ScreenConstant
                                                    .defaultHeightOneHundred,
                                                child: OvalPainterWidget(),
                                              )
                                            ],
                                          ),
                                        ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: ScreenConstant.defaultHeightForty),
                          AdditionalNoteWidget(
                            textEditingController:
                                _symptomsController.noteTextController,
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
    );
  }

  List<DropdownMenuItem<SelectOption>> buildDropList(
      List favouriteFoodModelList) {
    List<DropdownMenuItem<SelectOption>> items = [];
    for (SelectOption favouriteFoodModel in favouriteFoodModelList) {
      items.add(DropdownMenuItem(
        value: favouriteFoodModel,
        child: Text(favouriteFoodModel.label),
      ));
    }
    return items;
  }
}
