

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ibs/controllers/medication/MedicationController.dart';
import 'package:flutter_ibs/controllers/signup/SignUpController.dart';
import 'package:flutter_ibs/controllers/user/UserController.dart';
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
  final UserController _userController = Get.find();

  @override
  Widget build(BuildContext context) {
    int _numRendered = 0;
    int _numSkipped = 0;

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
                                  bool isLast = false;
                                  int listLength =
                                      controller.formWidgetList.length;

                                  int total = (listLength -2) - ( _numSkipped ) ;
                                  if ( mainIndex >= total ){
                                    // If it's the last one or two... because additional notes could be after.
                                    isLast = true;
                                  }
                                  print("IDx $mainIndex  total $total - $isLast");

                                  bool isTracked =
                                  _userController.doesUserTrack(controller
                                      .formWidgetList[mainIndex]);
                                  if (isTracked) {
                                    _numRendered++;
                                    return RenderWidgetByType()
                                        .renderTrackableItem(
                                        controller
                                            .formWidgetList[mainIndex],
                                        isFirst: _numRendered == 1,
                                        isLast: isLast,
                                        onValueChanged:
                                        controller.valueChanged);
                                  } else {
                                    _numSkipped ++;
                                    return Offstage();
                                  }
                                }),
                            Container(
                              height: 70,
                              child: Stack(children: [
                                Positioned.fill(
                                  bottom: 0,
                                  child: _buildWavePainter(),
                                ),
                              ]),
                            ),
                            Text(
                              "For best results track your medications every day.",
                              textAlign: TextAlign.center,
                              style: TextStyles.textStyleRegular,
                            ),
                            SizedBox(height: ScreenConstant.defaultHeightTwenty),
                            Text(
                              '''Click “Save” to log your results''',
                              textAlign: TextAlign.center,
                              style: TextStyles.textStyleRegular,
                            ),
                            SizedBox(height: ScreenConstant.defaultHeightForty)
                          ],
                        ),
                      ),
                    ),
            //        Positioned(right: 0, left: 0, child: CustomArcPainter())
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }

  _buildWavePainter() {
    return Container(
      margin:
      EdgeInsets.only(bottom: 30), //ScreenConstant.defaultHeightSeventy),
      width: Get.context.mediaQuerySize.width,
      child: CustomPaint(
        size: Size(Get.context.mediaQuerySize.width, 52),
        painter: WavePainter(),
      ),
    );
  }
}
