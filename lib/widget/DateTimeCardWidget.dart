import 'package:flutter/material.dart';
import 'package:flutter_ibs/utils/Assets.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';

class DateTimeCardWidget extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(38)),
      margin:
          EdgeInsets.symmetric(horizontal: ScreenConstant.defaultWidthSixty),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              Assets.clock,
              width: ScreenConstant.defaultWidthTen * 1.3,
            ),
            Text("3 pm EST", style: TextStyles.textStyleRegular),
            CircleAvatar(
              backgroundColor: AppColors.colorTextRegular,
              radius: 1,
            ),
            Text("Monday, May 31", style: TextStyles.textStyleRegular),
          ],
        ),
      ),
    );
  }
}