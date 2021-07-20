import 'package:flutter/material.dart';
import 'package:flutter_ibs/utils/Assets.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:get/get.dart';

class HeaderCard extends StatelessWidget {
  final double height;
  final String imageText;
  final String title;
  final String description;

  const HeaderCard(
      {Key key, this.height, this.imageText, this.title, this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            height: height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                colors: <Color>[
                  AppColors.colorBackground,
                  AppColors.colorBlue2,
                  AppColors.colorBlue3,
                ],
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                tileMode: TileMode.repeated,
              ),
            )),
        Positioned(
            right: 0,
            child: Image.asset(
              Assets.curl4,
              height: context.mediaQuerySize.height * 0.3,
            )),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            alignment: Alignment.center,
            height: ScreenConstant.defaultWidthNinetyEight,
            width: ScreenConstant.defaultHeightNinetyEight,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.colorYesButton,
            ),
            child: Image.asset(imageText,
                width: ScreenConstant.defaultWidthTwenty * 2),
          ),
        ),
        Positioned(
          left: 60,
          right: 60,
          bottom: 20,
          child: Column(
            children: [
              Text(title,
                  textAlign: TextAlign.center,
                  style: TextStyles.textStyleIntroDescription
                      .apply(color: Colors.white, fontSizeDelta: -4)),
              SizedBox(height: ScreenConstant.defaultHeightTen),
              Text(description,
                  textAlign: TextAlign.center,
                  style: TextStyles.textStyleRegular
                      .apply(color: Colors.white, fontSizeDelta: 2)),
            ],
          ),
        ),
      ],
    );
  }
}
