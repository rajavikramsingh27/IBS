import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:get/get.dart';

class TextInputWidget extends StatefulWidget {
  final TrackableItem trackableItem;
  final bool isFirst;
  final bool isLast;
  final bool isChild;
  final Function(TrackableSubmitItem) onValueChanged;
  final Function(TrackableItem)  onValueRemoved;

  const TextInputWidget({
    //Key key,
    this.trackableItem,
    this.isFirst,
    this.isLast,
    this.isChild,
    this.onValueChanged,
    this.onValueRemoved,
  }) : super();

  @override
  _TextInputWidgetState createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {

  TextEditingController textController = TextEditingController();

  @override
  void initState() {
   textController.text = widget.trackableItem.textInput.value;

    // As this is tracked, set its initial tracking state:
    widget.onValueChanged(TrackableSubmitItem(
      tid: widget.trackableItem.tid,
      category: widget.trackableItem.category,
      kind: widget.trackableItem.kind,
      dtype: "str",
      value: TrackableSubmitItemValue(str: textController.text ),
    ));
    super.initState();
  }



  @override
  void deactivate() {
    super.deactivate();
    widget.onValueRemoved(widget.trackableItem);
  }




  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: AppColors.colorYesButton,
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
            child: Column(
              children: [
                Text(widget.trackableItem.name.tr ?? "",
                    textAlign: TextAlign.center,
                    style: TextStyles.textStyleIntroDescription
                        .apply(color: Colors.black, fontSizeDelta: -3)),
                Card(
                  margin: ScreenConstant.spacingAllMedium,
                  shadowColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  child: TextFormField(
                    onChanged: (dynamic newValue) {
                      widget.onValueChanged(TrackableSubmitItem(
                        tid: widget.trackableItem.tid,
                        category: widget.trackableItem.category,
                        kind: widget.trackableItem.kind,
                        dtype: "str",
                        value: TrackableSubmitItemValue(str: newValue),
                      ));
                    },
                    controller: textController,
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
