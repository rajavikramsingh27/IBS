import 'package:flutter/material.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/WavePainter.dart';
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:get/get.dart';


class TextInputWidget extends StatelessWidget {
  final TrackableItem trackableItem;
  final bool isFirst;
  final bool isLast;
  final bool isChild;
  final Function(TrackableSubmitItem) onValueChanged;

  const TextInputWidget({
    //Key key,
    this.trackableItem,
    this.isFirst,
    this.isLast,
    this.isChild,
    this.onValueChanged,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(height: ScreenConstant.sizeXL),
        Column(
          children: [
            Positioned.fill(
              top: 0,
              child: _buildWavePainter(),
            ),
            Text(this.trackableItem.name.tr ??"",
                textAlign: TextAlign.center,
                style: TextStyles.textStyleIntroDescription
                    .apply(color: Colors.black, fontSizeDelta: -3)),
            Card(
              margin: ScreenConstant.spacingAllMedium,
              shadowColor: Colors.grey,
              shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: TextFormField(
                //controller: textEditingController,
               // inputFormatters: <TextInputFormatter>[],
                textInputAction: TextInputAction.newline,
                maxLines: 4,
                minLines: 4,
                // maxLength: 100,
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
            SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
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
            100),
        painter: WavePainter(),
      ),
    );
  }

}
