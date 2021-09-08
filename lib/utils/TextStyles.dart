import 'package:flutter/material.dart';
import 'package:flutter_ibs/utils/Colors.dart';

import 'ScreenConstants.dart';

class TextStyles {
  static TextStyle get blankTest => TextStyle(
        color: Colors.white70,
        fontSize: FontSize.s30,
        fontWeight: FontWeight.w800,
      );

  static TextStyle get textStyleIntroDescription => TextStyle(
      color: AppColors.colorButton,
      fontSize: FontSize.s20,
      fontFamily: "Roboto-Medium",
      fontWeight: FontWeight.w500);

  static TextStyle get appBarTitle => TextStyle(
        color: Colors.black,
        fontSize: FontSize.s14,
        fontFamily: 'Roboto-Medium',
        fontWeight: FontWeight.bold,
      );

  static TextStyle get textStyleRegular => TextStyle(
        color: AppColors.colorTextDescription,
        fontSize: FontSize.s14,
        fontFamily: 'Roboto-Regular',
      );

  static TextStyle get textStylebottom => TextStyle(
        color: AppColors.colorBottomNavText,
        fontSize: FontSize.s10,
        fontFamily: 'Roboto-Regular',
      );

  static TextStyle get headerName => TextStyle(
        fontFamily: 'Proxima Nova Semibold',
        color: AppColors.white,
        fontSize: FontSize.s22,
        // fontWeight: FontWeight.w800,
      );

  static TextStyle get textStyleSettingTitle => TextStyle(
      color: AppColors.colorBlue2,
      fontSize: FontSize.s17,
      fontFamily: "Roboto",
      fontWeight: FontWeight.w500);

  static TextStyle get textStyleSettingDescription => TextStyle(
      color: AppColors.colorBlue2,
      fontSize: FontSize.s13,
      fontFamily: "Roboto",
      fontWeight: FontWeight.normal);

  static TextStyle get textStyleSettingQuestionaireBlack => TextStyle(
    color: Colors.black,
    fontSize: FontSize.s16,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.normal,
  );

  static TextStyle get textStyleSettingQuestionaireBlue => TextStyle(
    color: AppColors.colorBackground,
    fontSize: FontSize.s16,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.normal,
  );

  static TextStyle get textStyleSettingQuestionaireButton => TextStyle(
    color: AppColors.colorBackground,
    fontSize: FontSize.s15,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w500,
  );

  static TextStyle get textStyleSettingNotificationsTitle => TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    fontFamily: 'Roboto-Regular',
    color: Colors.white,
  );

  static TextStyle get textStyleSettingNotificationsSubTitle => TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: 'Roboto-Regular',
    color: Colors.white,
  );

}
