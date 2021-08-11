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
                painter: MyPainter(AppColors.colorYesButton.withOpacity(0.27)),
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

class CustomArcPainter2 extends StatelessWidget {
  final double heightFactor;
  final int quarterTurns;
  final double height;
  final double width;
  final CustomPainter painter;

  const CustomArcPainter2(
      {Key key,
      this.heightFactor,
      this.quarterTurns,
      this.height,
      this.width,this.painter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
        quarterTurns: quarterTurns,
        child: CustomPaint(
          painter: painter,
          size: Size(width, height),
        ));
  }
}
