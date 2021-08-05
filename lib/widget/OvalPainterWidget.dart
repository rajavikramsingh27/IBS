import 'package:flutter/material.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/widget/OvalPainter.dart';
import 'package:get/get.dart';

class OvalPainterWidget extends StatelessWidget {
  final double? top;
  final double? bottom;
  final int quarterTurns;

  const OvalPainterWidget(
      {Key? key, this.top, this.bottom, this.quarterTurns = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            left: 0,
            right: 0,
            top: top,
            bottom: bottom,
            child: Align(
              alignment: Alignment.center,
              child: RotatedBox(
                quarterTurns: quarterTurns,
                child: CustomPaint(
                  painter: OvalPainter(
                      AppColors.colorSymptomsGridBg.withOpacity(0.5)),
                  size: Size(Get.context!.mediaQuerySize.width * 0.3,
                      ScreenConstant.defaultHeightTwenty * 1.5),
                ),
              ),
            )),
        Positioned(
            left: 0,
            right: 0,
            top: top,
            bottom: bottom,
            child: Align(
              alignment: Alignment.center,
              child: RotatedBox(
                quarterTurns: quarterTurns,
                child: CustomPaint(
                  painter: OvalPainter(
                      AppColors.colorSymptomsGridBg.withOpacity(0.2)),
                  size: Size(Get.context!.mediaQuerySize.width * 0.8,
                      ScreenConstant.defaultHeightOneHundred),
                ),
              ),
            )),
      ],
    );
  }
}
