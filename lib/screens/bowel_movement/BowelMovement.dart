import 'package:flutter/material.dart';
import 'package:flutter_ibs/controllers/bowel_movement/BowelMovementController.dart';
import 'package:flutter_ibs/controllers/signup/SignUpController.dart';
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:flutter_ibs/services/url.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/AdditionalNoteWidget.dart';
import 'package:flutter_ibs/widget/CustomArcPainter.dart';
import 'package:flutter_ibs/widget/CustomElevatedButton.dart';
import 'package:flutter_ibs/widget/CustomSwitch.dart';
import 'package:flutter_ibs/widget/DateTimeCardWidget.dart';
import 'package:flutter_ibs/widget/OvalPainterWidget.dart';
import 'package:flutter_ibs/widget/WavePainter.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class BowelMovement extends StatelessWidget {
  final _bowelMovementController = Get.put(BowelMovementController());
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
            _bowelMovementController.loader.value
                ? Offstage()
                : CustomElevatedButton(
                    widthFactor: 0.7,
                    text: "Save",
                    onTap: _bowelMovementController.onSave,
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
                            "Track Bowel Movement",
                            style: TextStyles.textStyleIntroDescription
                                .apply(color: Colors.black, fontSizeDelta: -2),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: ScreenConstant.defaultHeightForty),
                          DateTimeCardWidget(),
                          SizedBox(
                              height: ScreenConstant.defaultHeightForty * 1.25),
                          _bowelMovementController.loader.value
                              ? Center(
                                  child: Padding(
                                  padding: ScreenConstant.spacingAllLarge,
                                  child: Container(
                                      height: ScreenConstant.screenHeightThird,
                                      child: Center(
                                          child: CircularProgressIndicator())),
                                ))
                              : ListView.builder(
                                  shrinkWrap: true,
                                  physics: ClampingScrollPhysics(),
                                  itemCount: _signUpController
                                      .bowelMovements.value.items.length,
                                  itemBuilder: (_, index) {
                                    switch (_signUpController.bowelMovements
                                        .value.items[index].tid) {
                                      case "bowelMovements-notes":
                                        {
                                          return AdditionalNoteWidget(
                                            textEditingController:
                                                _bowelMovementController
                                                    .noteTextController,
                                          );
                                        }
                                        break;

                                      case "bowelMovements-consistency":
                                        {
                                          return _buildBowelTypeSlider(
                                              data: _signUpController
                                                  .bowelMovements
                                                  .value
                                                  .items[index]);
                                        }
                                        break;
                                      case "bowelMovements-urgency":
                                        {
                                          return Stack(
                                            children: [
                                              Positioned.fill(
                                                top: ScreenConstant
                                                    .defaultHeightOneHundred,
                                                //bottom: ScreenConstant.defaultHeightOneHundred,
                                                child: Container(
                                                  color:
                                                      AppColors.colorYesButton,
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: ScreenConstant
                                                        .sizeMedium,
                                                    right: ScreenConstant
                                                        .sizeMedium),
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                child: _buildUrgency(
                                                    data: _signUpController
                                                        .bowelMovements
                                                        .value
                                                        .items[index]),
                                              ),
                                            ],
                                          );
                                        }
                                        break;
                                      case "bowelMovements-color":
                                        {
                                          return Stack(
                                            children: [
                                              Positioned.fill(
                                                top: 0,
                                                bottom: 0,
                                                child: Container(
                                                  color:
                                                      AppColors.colorYesButton,
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: ScreenConstant
                                                        .sizeMedium,
                                                    right: ScreenConstant
                                                        .sizeMedium),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                ),
                                                child: _buildColorPortion(
                                                    data: _signUpController
                                                        .bowelMovements
                                                        .value
                                                        .items[index]),
                                              ),
                                            ],
                                          );
                                        }
                                        break;
                                      case "bowelMovements-relief":
                                        {
                                          return Stack(
                                            children: [
                                              Positioned.fill(
                                                //top: ScreenConstant.defaultHeightOneHundred,
                                                bottom: ScreenConstant
                                                    .defaultHeightOneHundred,
                                                child: _buildWavePainter(),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: ScreenConstant
                                                        .sizeMedium,
                                                    right: ScreenConstant
                                                        .sizeMedium),
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                child: _buildRelief(
                                                    data: _signUpController
                                                        .bowelMovements
                                                        .value
                                                        .items[index]),
                                              ),
                                            ],
                                          );
                                        }
                                        break;

                                      default:
                                        {
                                          return Offstage();
                                        }
                                        break;
                                    }
                                  }),
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

  _buildBowelTypeSlider({DatumItem data}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: ScreenConstant.defaultWidthTen),
      child: Column(
        children: [
          Text(
            data.name.tr,
            style: TextStyles.textStyleIntroDescription
                .apply(color: Colors.black, fontSizeDelta: -2),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: ScreenConstant.defaultHeightTwenty * 1.5),
          Center(
            child: Stack(
              children: [
                getImage(
                    item: data
                        .rating.options[data.rating.ratingDefault.toInt() - 1]),
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
                        horizontal: ScreenConstant.sizeExtraSmall, vertical: 1),
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text("Type ${data.rating.ratingDefault.toInt()}",
                          textAlign: TextAlign.center,
                          style: TextStyles.textStyleIntroDescription
                              .apply(color: Colors.white, fontSizeDelta: -9)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: ScreenConstant.sizeMedium),
          getDesc(
              item: data.rating.options[data.rating.ratingDefault.toInt() - 1]),
          SizedBox(height: ScreenConstant.sizeMedium),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: ScreenConstant.defaultWidthTen),
            child: SfSliderTheme(
              data: SfSliderThemeData(
                  thumbColor: AppColors.colorArrowButton,
                  thumbStrokeWidth: 5,
                  thumbRadius: 16,
                  thumbStrokeColor: AppColors.colorBackground,
                  activeTrackHeight: 4,
                  overlayRadius: 0,
                  disabledActiveTrackColor: AppColors.colorTrackSlider,
                  disabledInactiveTrackColor: AppColors.colorTrackSlider,
                  activeDividerStrokeWidth: 2,
                  inactiveDividerStrokeWidth: 2,
                  inactiveTrackHeight: 4,
                  activeTrackColor: AppColors.colorTrackSlider,
                  inactiveTrackColor: AppColors.colorTrackSlider,
                  inactiveDividerStrokeColor: AppColors.colorTrackSlider,
                  inactiveDividerRadius: 8,
                  inactiveDividerColor: AppColors.white,
                  activeDividerColor: AppColors.white,
                  activeDividerStrokeColor: AppColors.colorTrackSlider,
                  activeDividerRadius: 8,
                  activeLabelStyle: TextStyles.textStyleRegular,
                  inactiveLabelStyle: TextStyles.textStyleRegular),
              child: SfSlider(
                showDividers: true,
                min: 1.0,
                max: data.rating.range ?? 2,
                interval: 1,
                stepSize: 1,
                showLabels: true,
                labelFormatterCallback:
                    (dynamic actualValue, String formattedText) {
                  if (actualValue == 1.0) {
                    return "Type 1";
                  }
                  if (actualValue == data.rating.range) {
                    return "Type ${data.rating.range}";
                  }
                  return "";
                },
                value: data.rating.ratingDefault,
                onChanged: (dynamic newValue) {
                  data.rating.ratingDefault = newValue;
                  _bowelMovementController.initModel(
                      data: data,
                      dType: "num",
                      value: data.rating.ratingDefault);
                  _signUpController.bowelMovements.refresh();
                },
              ),
            ),
          ),
          SizedBox(height: ScreenConstant.defaultHeightForty),
        ],
      ),
    );
  }

  _buildUrgency({DatumItem data}) {
    return Container(
      color: AppColors.white,
      child: Stack(
        children: [
          AspectRatio(
            aspectRatio: 1.3,
            child: Card(
              margin: EdgeInsets.zero,
              color: AppColors.colorBackground,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: ScreenConstant.spacingAllMedium,
                child: Column(
                  children: [
                    SizedBox(height: ScreenConstant.defaultHeightForty),
                    Text(data.name.tr,
                        style: TextStyles.textStyleIntroDescription
                            .apply(color: Colors.white, fontSizeDelta: -3)),
                    SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
                    Text(
                      data.description.tr,
                      textAlign: TextAlign.center,
                      style: TextStyles.textStyleRegular
                          .apply(color: AppColors.colorSkipButton),
                    ),
                    SizedBox(height: ScreenConstant.defaultHeightTwenty),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: ScreenConstant.defaultWidthTen),
                      child: SfSliderTheme(
                        data: SfSliderThemeData(
                          thumbColor: AppColors.colorArrowButton,
                          thumbStrokeWidth: 5,
                          thumbRadius: 16,
                          thumbStrokeColor: Colors.white,
                          activeTrackHeight: 4,
                          overlayRadius: 0,
                          disabledActiveTrackColor: AppColors.colorTrackSlider,
                          disabledInactiveTrackColor:
                              AppColors.colorTrackSlider,
                          activeDividerStrokeWidth: 2,
                          inactiveDividerStrokeWidth: 2,
                          inactiveTrackHeight: 4,
                          activeTrackColor: AppColors.colorTrackSlider,
                          inactiveTrackColor: AppColors.colorTrackSlider,
                          inactiveDividerStrokeColor: AppColors.white,
                          inactiveDividerRadius: 8,
                          inactiveDividerColor:
                              AppColors.colorInactiveDividerSlider,
                          activeDividerColor:
                              AppColors.colorInactiveDividerSlider,
                          activeDividerStrokeColor: Colors.white,
                          activeDividerRadius: 8,
                          activeLabelStyle: TextStyles.textStyleRegular
                              .apply(color: AppColors.colorTrackSlider),
                          inactiveLabelStyle: TextStyles.textStyleRegular
                              .apply(color: AppColors.colorTrackSlider),
                        ),
                        child: SfSlider(
                          showDividers: true,
                          min: 1.0,
                          max: data.rating.range,
                          interval: 1,
                          stepSize: 1,
                          showLabels: true,
                          value: data.rating.ratingDefault,
                          onChanged: (dynamic newValue) {
                            data.rating.ratingDefault = newValue;
                            _bowelMovementController.initModel(
                                data: data,
                                dType: "num",
                                value: data.rating.ratingDefault);
                            _signUpController.bowelMovements.refresh();
                          },
                          labelFormatterCallback:
                              (dynamic actualValue, String formattedText) {
                            return actualValue == 1
                                ? "Not at All"
                                : actualValue == 2
                                    ? ""
                                    : actualValue == 3
                                        ? ""
                                        : "Extremely";
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: ScreenConstant.defaultHeightOneHundred,
            child: OvalPainterWidget(),
          ),
        ],
      ),
    );
  }

  _buildColorPortion({DatumItem data}) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: ScreenConstant.sizeXL,
          vertical: ScreenConstant.defaultHeightTwentyFour),
      child: Column(
        children: [
          Text(data.name.tr,
              style: TextStyles.textStyleIntroDescription
                  .apply(color: Colors.black, fontSizeDelta: -3)),
          SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
          GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: data.color.options.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  data.color.colorDefault = data.color.options[index];
                  _bowelMovementController.initModel(
                      data: data,
                      dType: "str",
                      value: data.color.options[index].value);
                  _signUpController.bowelMovements.refresh();
                },
                child: data.color.colorDefault.value ==
                        data.color.options[index].value
                    ? CircleAvatar(
                        radius: 20,
                        backgroundColor: AppColors.colordropdownArrow,
                        child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.fromHex(
                                  data.color.options[index].hex)),
                          width: ScreenConstant.sizeXL,
                        ),
                      )
                    : CircleAvatar(
                        radius: 20,
                        backgroundColor:
                            AppColors.fromHex(data.color.options[index].hex),
                      ),
              );
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                crossAxisCount: 3,
                childAspectRatio: 2.4),
          ),
          SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
          Text(
            data.description.tr,
            textAlign: TextAlign.center,
            style: TextStyles.textStyleRegular.apply(),
          ),
        ],
      ),
    );
  }

  _buildRelief({DatumItem data}) {
    return Container(
      color: AppColors.white,
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 1.2,
            child: Card(
              margin: EdgeInsets.zero,
              color: AppColors.colorBackground,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: ScreenConstant.spacingAllMedium,
                child: Column(
                  children: [
                    SizedBox(height: ScreenConstant.sizeLarge),
                    Text(data.name.tr,
                        style: TextStyles.textStyleIntroDescription
                            .apply(color: Colors.white, fontSizeDelta: -3)),
                    SizedBox(height: ScreenConstant.sizeLarge),
                    Text(
                      data.description.tr,
                      textAlign: TextAlign.center,
                      style: TextStyles.textStyleRegular
                          .apply(color: AppColors.colorSkipButton),
                    ),
                    SizedBox(height: ScreenConstant.sizeLarge),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: ScreenConstant.defaultWidthTen),
                      child: SfSliderTheme(
                        data: SfSliderThemeData(
                          thumbColor: AppColors.colorArrowButton,
                          thumbStrokeWidth: 5,
                          thumbRadius: 16,
                          thumbStrokeColor: Colors.white,
                          activeTrackHeight: 4,
                          overlayRadius: 0,
                          disabledActiveTrackColor: AppColors.colorTrackSlider,
                          disabledInactiveTrackColor:
                              AppColors.colorTrackSlider,
                          activeDividerStrokeWidth: 2,
                          inactiveDividerStrokeWidth: 2,
                          inactiveTrackHeight: 4,
                          activeTrackColor: AppColors.colorTrackSlider,
                          inactiveTrackColor: AppColors.colorTrackSlider,
                          inactiveDividerStrokeColor: AppColors.white,
                          inactiveDividerRadius: 8,
                          inactiveDividerColor:
                              AppColors.colorInactiveDividerSlider,
                          activeDividerColor:
                              AppColors.colorInactiveDividerSlider,
                          activeDividerStrokeColor: Colors.white,
                          activeDividerRadius: 8,
                          activeLabelStyle: TextStyles.textStyleRegular
                              .apply(color: AppColors.colorTrackSlider),
                          inactiveLabelStyle: TextStyles.textStyleRegular
                              .apply(color: AppColors.colorTrackSlider),
                        ),
                        child: SfSlider(
                          showDividers: true,
                          min: 1.0,
                          max: data.rating.range,
                          interval: 1,
                          stepSize: 1,
                          showLabels: true,
                          value: data.rating.ratingDefault,
                          onChanged: (dynamic newValue) {
                            data.rating.ratingDefault = newValue;
                            _bowelMovementController.initModel(
                              data: data,
                              dType: "num",
                              value: data.rating.ratingDefault,
                            );
                            _signUpController.bowelMovements.refresh();
                          },
                          labelFormatterCallback:
                              (dynamic actualValue, String formattedText) {
                            if (actualValue == 1) {
                              return "Complete";
                            }
                            if (actualValue == data.rating.range) {
                              return "No relief";
                            }
                            return "";
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: ScreenConstant.sizeLarge),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemCount: data.children.first.items.length,
                        itemBuilder: (_, index) {
                          switch (data.children.first.items[index].tid) {
                            case "bowelMovements-relief-straining":
                              {
                                return Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        data.children.first.items[index].toggle
                                                .toggleDefault
                                            ? data
                                                .children
                                                .first
                                                .items[index]
                                                .toggle
                                                .options
                                                .optionsTrue
                                                .label
                                                .tr
                                            : data
                                                .children
                                                .first
                                                .items[index]
                                                .toggle
                                                .options
                                                .optionsFalse
                                                .label
                                                .tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                        style: TextStyles.textStyleRegular
                                            .apply(
                                                color: Colors.black,
                                                fontSizeDelta: 2),
                                      ),
                                      CustomSwitch(
                                        value: data.children.first.items[index]
                                            .toggle.toggleDefault,
                                        onChanged: (val) {
                                          data.children.first.items[index]
                                              .toggle.toggleDefault = val;
                                          _bowelMovementController.initSubModel(
                                              data: data
                                                  .children.first.items[index],
                                              dType: "bool",
                                              value: data
                                                  .children
                                                  .first
                                                  .items[index]
                                                  .toggle
                                                  .toggleDefault,
                                              kind: data.kind,
                                              tid: data.tid,
                                              mainType: "num");
                                          _signUpController.symptoms.refresh();
                                        },
                                      ),
                                    ],
                                  ),
                                  margin: ScreenConstant.spacingAllLarge,
                                  padding: ScreenConstant.spacingAllLarge,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      color: Colors.white),
                                );
                              }
                              break;
                            default:
                              {
                                return Offstage();
                              }
                              break;
                          }
                        }),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: ScreenConstant.sizeXL),
        ],
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

  getImage({RatingOption item}) {
    Widget image = FadeInImage(
      width: ScreenConstant.defaultWidthOneHundredSeven,
      height: ScreenConstant.defaultHeightOneHundred,
      image: NetworkImage(item.image.normal),
      placeholder: NetworkImage(BLANK_PLACEHOLDER),
      imageErrorBuilder: (context, error, stackTrace) {
        return Image.network(BLANK_PLACEHOLDER,
            width: ScreenConstant.defaultWidthOneHundredSeven,
            height: ScreenConstant.defaultHeightOneHundred,
            fit: BoxFit.fitWidth);
      },
      fit: BoxFit.fitWidth,
    );
    return image;
  }

  getDesc({RatingOption item}) {
    return Text(item.description.tr ?? "",
        textAlign: TextAlign.center, style: TextStyles.textStyleRegular);
  }
}
