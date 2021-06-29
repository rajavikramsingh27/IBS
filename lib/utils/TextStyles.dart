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
       static TextStyle get textDescription => TextStyle(
        color: AppColors.colorTextRegular,
        fontSize: FontSize.s12,
        fontFamily: 'Roboto-Medium',
      );
      static TextStyle get textStyleRegular => TextStyle(
        color: AppColors.colorTextDescription,
        fontSize: FontSize.s14,
        fontFamily: 'Roboto-Regular',
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
