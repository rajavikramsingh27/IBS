import 'package:flutter/material.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';

class HeadingWidget extends StatelessWidget {
  final String title;
  final String description;

  const HeadingWidget({Key key, this.title, this.description})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ScreenConstant.spacingAllMedium,
      child: Column(
        children: [
          SizedBox(height: ScreenConstant.defaultHeightTwenty),
          Text(title,
              textAlign: TextAlign.center,
              style: TextStyles.textStyleIntroDescription
                  .apply(color: Colors.white, fontSizeDelta: -3)),
          SizedBox(height: ScreenConstant.defaultHeightTen),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyles.textStyleRegular
                .apply(color: AppColors.colorSkipButton),
          ),
          SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
        ],
      ),
    );
  }
}
