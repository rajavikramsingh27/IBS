import 'package:flutter/material.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/widget/WavePainter.dart';
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:get/get.dart';


class TextInputWidget extends StatelessWidget {
  final TrackableItem trackableItem;
  final bool isFirst;
  final bool isLast;
  final bool isChild;


  const TextInputWidget({
    //Key key,
    this.trackableItem,
    this.isFirst,
    this.isLast,
    this.isChild,

  }) : super();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          top: 0,
          bottom: ScreenConstant.screenHeightHalf,
          child: _buildWavePainter(),
        ),
        SizedBox(height: ScreenConstant.sizeXL),
        Column(
          children: [
            Container(
              height: ScreenConstant.screenHeightThird,
            ),
        /*    AdditionalNoteWidget(
              textEditingController:
              _healthWellnessController.noteTextController,
              text: textItem.name.tr,
            ),*/
          ],
        ),
      ],
    );
  }

  _buildWavePainter() {
    return Container(
      margin: EdgeInsets.only(bottom: ScreenConstant.defaultHeightTwenty * 1.5),
      width: Get.context.mediaQuerySize.width,
      child: CustomPaint(
        size: Size(Get.context.mediaQuerySize.width,
            Get.context.mediaQuerySize.height),
        painter: WavePainter(),
      ),
    );
  }

}
