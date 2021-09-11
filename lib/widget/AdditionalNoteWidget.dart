import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';

class AdditionalNoteWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  AdditionalNoteWidget({this.textEditingController, this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(text??"",
            textAlign: TextAlign.center,
            style: TextStyles.textStyleIntroDescription
                .apply(color: Colors.black, fontSizeDelta: -3)),
        Card(
          margin: ScreenConstant.spacingAllMedium,
          shadowColor: Colors.grey,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: TextFormField(
            controller: textEditingController,
            inputFormatters: <TextInputFormatter>[],
            textInputAction: TextInputAction.newline,
            maxLines: 4,
            minLines: 4,
            // maxLength: 100,
            decoration: InputDecoration(border: InputBorder.none),
          ),
        ),
        SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
        Text(
          '''For best results track every time you\nexperience a symptom.\n\nClick “Save” to log your results.''',
          textAlign: TextAlign.center,
          style: TextStyles.textStyleRegular,
        ),
      ],
    );
  }
}
