import 'package:flutter/material.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/widget/CustomPainters.dart';

class CustomArcPainter extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: 0.5,
      child: Stack(
        alignment: Alignment.center,
        children: [
          RotatedBox(
              quarterTurns: 2,
              child: CustomPaint(
                painter: MyPainter(),
                size: Size(ScreenConstant.defaultHeightEightyTwo,
                    ScreenConstant.defaultHeightEightyTwo),
              )),
          CircleAvatar(
            backgroundColor: AppColors.colorYesButton,
            child: Icon(
              Icons.keyboard_arrow_up_outlined,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}