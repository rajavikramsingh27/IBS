import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';

class AdditionalNoteWidget extends StatelessWidget {
  final TextEditingController textEditingController;

  AdditionalNoteWidget(
      {this.textEditingController,
      this.messageText = "",
      this.text,
      this.bottomText =
          '''For best results track every time you\nexperience a symptom.\n\nClick “Save” to log your results.''',
      this.hintText = "",
      this.margin = const EdgeInsets.all(15)});

  final String text;
  final String messageText;
  final String bottomText;
  final String hintText;
  final EdgeInsetsGeometry margin;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(text ?? "",
            textAlign: TextAlign.center,
            style: TextStyles.textStyleIntroDescription
                .apply(color: Colors.black, fontSizeDelta: -3)),
        messageText.isEmpty
            ? Offstage()
            : Text(
                messageText,
                textAlign: TextAlign.start,
                style: TextStyles.textStyleRegular.apply(color: Colors.white),
              ),
        Card(
          margin: margin,
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
            decoration: InputDecoration(
                contentPadding: ScreenConstant.spacingAllMedium,
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: TextStyles.textStyleRegular
                    .apply(color: AppColors.colorBlack)),
          ),
        ),
        SizedBox(height: ScreenConstant.defaultHeightSixteen),
        bottomText.isEmpty
            ? Offstage()
            : Text(
                bottomText,
                textAlign: TextAlign.center,
                style: TextStyles.textStyleRegular,
              ),
      ],
    );
  }
}
