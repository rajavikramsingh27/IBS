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
import 'package:flutter_ibs/widget/WavePainter.dart';
import 'package:get/get.dart';

class Medication extends StatelessWidget {
  final MedicationController _controller = Get.put(MedicationController());
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
              onTap: () {
                _controller.onSave();
              },
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
                            "Track Medication",
                            style: TextStyles.textStyleIntroDescription
                                .apply(color: Colors.black, fontSizeDelta: -2),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: ScreenConstant.defaultHeightForty),
                          DateTimeCardWidget(),
                          SizedBox(height: ScreenConstant.defaultHeightForty),
                          Stack(
                            children: [
                              Positioned.fill(
                                top: ScreenConstant.defaultHeightOneHundred *
                                    1.1,
                                child: _buildWavePainter(),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  left: ScreenConstant.defaultWidthTwenty,
                                  right: ScreenConstant.defaultWidthTwenty,
                                  bottom: ScreenConstant.defaultHeightForty,
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                                child: _buildMedication(),
                              ),
                            ],
                          ),
                          SizedBox(height: ScreenConstant.defaultHeightTwenty),
                          Text("Additional Notes",
                              textAlign: TextAlign.center,
                              style: TextStyles.textStyleIntroDescription.apply(
                                  color: Colors.black, fontSizeDelta: -3)),
                          Padding(
                            padding: ScreenConstant.spacingAllMedium,
                            child: Card(
                              shadowColor: Colors.grey,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16)),
                              child: TextFormField(
                                controller: _controller.noteTextController,
                                inputFormatters: <TextInputFormatter>[
                                  LengthLimitingTextInputFormatter(500)
                                ],

                                decoration:
                                    InputDecoration(border: InputBorder.none),
                                textInputAction: TextInputAction.newline,
                                maxLines: 4,
                                minLines: 4,
                                // maxLength: 100,
                                // decoration: hintedInputDecoration(""),
                              ),
                            ),
                          ),
                          SizedBox(
                              height: ScreenConstant.defaultHeightTwentyFour),
                          Text(
                            '''For best results track your medications\n every day.\n\nClick “Save” to log your results.''',
                            textAlign: TextAlign.center,
                            style: TextStyles.textStyleRegular,
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
                  Text("What Did you take?",
                      style: TextStyles.textStyleIntroDescription
                          .apply(color: Colors.white, fontSizeDelta: -3)),
                  SizedBox(height: ScreenConstant.defaultHeightTwenty * 1.6),
                  Text(
                    "Select from this list of common medications and supplements or add your own",
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
                      _controller.listfoodDefault.add(Default(
                          value: _controller.medicationTextController.text));
                      _controller.listfoodDefault.refresh();
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
                          "Add this medication",
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
          .boolListDefault
          .length,
      itemBuilder: (BuildContext context, int index) {
        var model = _signUpController.medications.value.items
            .elementAt(1)
            .tags
            .boolListDefault[index];
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
                model.value,
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
                model.value ?? "",
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
}
