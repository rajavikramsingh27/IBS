import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/CustomTextFormField%20.dart';

class AdditionalNoteWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Additional Notes",
            textAlign: TextAlign.center,
            style: TextStyles.textStyleIntroDescription
                .apply(color: Colors.black, fontSizeDelta: -3)),
        Padding(
          padding: ScreenConstant.spacingAllMedium,
          child: TextFormField(
            inputFormatters: <TextInputFormatter>[],
            readOnly: true,

            textInputAction: TextInputAction.newline,
            maxLines: 4,
            minLines: 4,
            // maxLength: 100,
            decoration: hintedInputDecoration(""),
          ),
        ),
        SizedBox(height: ScreenConstant.defaultHeightTwentyThree),
        Text(
          '''For best results track every time you\nexperience a symptom.\n\nClick “Save” to log your results.''',
          textAlign: TextAlign.center,
          style: TextStyles.textStyleRegular,
        ),
      ],
    );
  }
}
