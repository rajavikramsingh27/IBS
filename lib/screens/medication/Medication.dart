

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ibs/controllers/medication/MedicationController.dart';
import 'package:flutter_ibs/controllers/signup/SignUpController.dart';
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/CustomArcPainter.dart';
import 'package:flutter_ibs/widget/CustomElevatedButton.dart';
import 'package:flutter_ibs/widget/DateTimeCardWidget.dart';
import 'package:flutter_ibs/widget/OvalPainterWidget.dart';
import 'package:flutter_ibs/widget/ScreenControls/RenderWidgetByType.dart';
import 'package:flutter_ibs/widget/WavePainter.dart';
import 'package:flutter_ibs/widget/utils.dart';
import 'package:get/get.dart';



class Medication extends StatelessWidget {
  final MedicationController controller = Get.put(MedicationController());
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
                widthFactor: 0.7, text: "Save", onTap: controller.onSave),
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
                              "Track Medications",
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

                                  if (mainIndex ==  (controller.formWidgetList.length - 2)
                                      || mainIndex ==  (controller.formWidgetList.length - 1 )){
                                    // If it's the last one or two... because additional notes could be after.
                                    isLast = true;
                                  }
                                  return RenderWidgetByType().renderTrackableItem(
                                      controller.formWidgetList[mainIndex],
                                      isFirst: mainIndex == 0,
                                      isLast: isLast,
                                      onValueChanged: controller.valueChanged
                                  );
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
          ),
        )
    );
  }

  /*

  _buildMedication() {
    return Stack(
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
                      _signUpController.medications.value.items
                          .elementAt(1)
                          .name
                          .tr,
                      style: TextStyles.textStyleIntroDescription
                          .apply(color: Colors.white, fontSizeDelta: -3)),
                  SizedBox(height: ScreenConstant.defaultHeightTwenty * 1.6),
                  Text(
                    _signUpController.medications.value.items
                        .elementAt(1)
                        .description
                        .tr,
                    textAlign: TextAlign.center,
                    style: TextStyles.textStyleRegular
                        .apply(color: AppColors.colorSkipButton),
                  ),
                  _buildListOfMedicineTaken(),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    margin: ScreenConstant.spacingAllLarge,
                    child: FractionallySizedBox(
                      child: TextFormField(
                        controller: _controller.medicationTextController,
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
                  InkWell(
                    onTap: () {
                      if (_controller
                          .medicationTextController.text.isNotEmpty) {
                        _controller.listfoodDefault.add(Tag(
                            value: _controller.medicationTextController.text));
                        _controller.listfoodDefault.refresh();
                      }
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
                          _signUpController.medications.value.items
                              .elementAt(1)
                              .tags
                              .addableLabel
                              .tr,
                          style: TextStyles.textStyleRegular
                              .apply(color: AppColors.white),
                        )
                      ],
                    ),
                  ),
                  _buildListMedicationFinal(),
                  SizedBox(height: ScreenConstant.defaultHeightForty * 1.4),
                ],
              ),
              Container(
                height: ScreenConstant.defaultHeightOneHundred,
                child: OvalPainterWidget(),
              ),
              //  Positioned(bottom:0,
              //  left: 0,right: 0,
              //                   child: Container(
              //                     constraints: BoxConstraints.tight(Size(Get.context.mediaQuerySize.width*0.8,ScreenConstant.defaultHeightOneHundred)),
              //       height: ScreenConstant.defaultHeightOneHundred,
              //       child: OvalPainterWidget(
              //         quarterTurns: 2,
              //         bottom: 0,
              //       ),),
              //  )
            ],
          ),
        ),
      ],
    );
  }

  _buildListOfMedicineTaken() {
    return GridView.builder(
      padding: EdgeInsets.symmetric(
          horizontal: ScreenConstant.sizeLarge,
          vertical: ScreenConstant.defaultHeightTwentyFour),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: _signUpController.medications.value.items
          .elementAt(1)
          .tags
          .tagsDefault
          .length,
      itemBuilder: (BuildContext context, int index) {
        var model = _signUpController.medications.value.items
            .elementAt(1)
            .tags
            .tagsDefault[index];
        return InkWell(
          onTap: () {
            if (!_controller.listfoodDefault.contains(model)) {
              _controller.listfoodDefault.add(model);
              _controller.listfoodDefault.refresh();
              _signUpController.medications.refresh();
            }
          },
          child: Card(
            color: AppColors.colorSymptomsGridBg,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100)),
            child: Center(
              child: Text(
                model.value.tr,
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
          crossAxisCount: 3, childAspectRatio: 2.5),
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

  _buildListMedicationFinal() {
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
            if (_controller.listfoodDefault.contains(model)) {
              _controller.listfoodDefault.removeAt(ind);
              _controller.listfoodDefault.refresh();
              _signUpController.medications.refresh();
            }
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
          crossAxisCount: 3, childAspectRatio: 2.5),
    );
  }

   */
}
