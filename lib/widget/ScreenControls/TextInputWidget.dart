import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ibs/utils/Colors.dart';
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
        Container(
          color: AppColors.colorYesButton,
          child:
          Padding(
            padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
            child: Column(
              children: [
                Text(this.trackableItem.name.tr ?? "",
                    textAlign: TextAlign.center,
                    style: TextStyles.textStyleIntroDescription
                        .apply(color: Colors.black, fontSizeDelta: -3)),
                Card(
                  margin: ScreenConstant.spacingAllMedium,
                  shadowColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  child: TextFormField(
                    //controller: textEditingController,
                    // inputFormatters: <TextInputFormatter>[],
                    textInputAction: TextInputAction.newline,
                    maxLines: 8,
                    minLines: 7,
                    inputFormatters: <TextInputFormatter>[
                      LengthLimitingTextInputFormatter(500)
                    ],
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: ScreenConstant.defaultWidthTen,
                            vertical: ScreenConstant.defaultHeightTen)),

                  ),
                ),
               // SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
              ],
            ),
          ),
      )
      ],
    );
  }


}
