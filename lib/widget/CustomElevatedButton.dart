import 'package:flutter/material.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';

class CustomElevatedButton extends StatelessWidget {
  final Function? onTap;
  final String? text;
  final double? widthFactor;

  const CustomElevatedButton(
      {Key? key, this.onTap, this.text, this.widthFactor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: widthFactor,
      child: ElevatedButton(
        onPressed: onTap as void Function()?,
        style: ElevatedButton.styleFrom(
            padding: ScreenConstant.spacingAllMedium,
            primary: AppColors.colorButton,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
        child: Text(
          text!,
          textAlign: TextAlign.center,
          style: TextStyles.textStyleIntroDescription
              .apply(fontSizeDelta: -3, color: Colors.white),
        ),
      ),
    );
  }
}

class CustomElevatedButton2 extends StatelessWidget {
  final Function? onTap;
  final String? text;
  final double? widthFactor;
  final Color? textColor;
  final Color? buttonColor;
  final double elevation;

  const CustomElevatedButton2(
      {Key? key,
      this.onTap,
      this.text,
      this.widthFactor,
      this.textColor,
      this.buttonColor,
      this.elevation = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: widthFactor,
      child: ElevatedButton(
        onPressed: onTap as void Function()?,
        style: ElevatedButton.styleFrom(
            shadowColor: AppColors.colorInactiveDividerSlider.withOpacity(0.12),
            elevation: elevation,
            padding: ScreenConstant.spacingAllMedium,
            primary: buttonColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
        child: Text(
          text!,
          textAlign: TextAlign.center,
          style: TextStyles.textStyleIntroDescription
              .apply(fontSizeDelta: -3, color: textColor),
        ),
      ),
    );
  }
}

class CustomElevatedButton3 extends StatelessWidget {
  final Function? onTap;
  final String? text;
  final double? widthFactor;

  const CustomElevatedButton3(
      {Key? key, this.onTap, this.text, this.widthFactor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: widthFactor,
      child: ElevatedButton(
        onPressed: onTap as void Function()?,
        style: ElevatedButton.styleFrom(
            padding: ScreenConstant.spacingAllMedium,
            primary: AppColors.colorCloseLight,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
        child: Text(
          text!,
          textAlign: TextAlign.center,
          style: TextStyles.textStyleIntroDescription
              .apply(fontSizeDelta: -3, color: Colors.white),
        ),
      ),
    );
  }
}
