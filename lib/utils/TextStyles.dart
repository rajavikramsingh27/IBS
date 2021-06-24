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
        color: AppColors.white,
        fontSize: FontSize.s18,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
      );
  static TextStyle get loginSignUpBoldText => TextStyle(
        fontFamily: 'Proxima Nova Semibold',
        color: AppColors.textSemiBold,
        fontSize: FontSize.s24,
        //  fontWeight: FontWeight.w800,
      );

  static TextStyle get loginSignUpText => TextStyle(
    color: AppColors.textRegular,
    fontSize: FontSize.s14,
   // fontWeight: FontWeight.w800,
  );
  
  static TextStyle get bottomTextStyle => TextStyle(
        color: AppColors.textSemiBold,
        fontSize: FontSize.s12,
        // fontWeight: FontWeight.w800,
      );
  
  static TextStyle get headerName => TextStyle(
    fontFamily: 'Proxima Nova Semibold',
    color: AppColors.white,
        fontSize: FontSize.s22,
        // fontWeight: FontWeight.w800,
      );

 
  
}
