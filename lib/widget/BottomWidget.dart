import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/CustomPainters.dart';
import 'package:get/get.dart';

class BottomWidget extends StatelessWidget {
  final Function() onSkipTap;
  final Function() onContinueTap;
  final Function() onCircleTap;

  const BottomWidget(
      {Key key, this.onSkipTap, this.onContinueTap, this.onCircleTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildBottom();
  }

  Widget _buildBottom() {
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: CustomPaint(
              painter: BottomCustomPainter(),
              size: Size(Get.context.mediaQuerySize.width,
                  Get.context.mediaQuerySize.height * 0.11)),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                onPressed: onSkipTap,
                child: Text("Skip",
                    style: TextStyles.textStyleRegular.apply(
                        color: AppColors.colorSkipButton, fontSizeDelta: 3)),
              ),
              TextButton(
                onPressed: onContinueTap,
                child: Text("Continue",
                    style: TextStyles.textStyleIntroDescription
                        .apply(color: AppColors.white, fontSizeDelta: -3)),
              ),
              InkWell(
                onTap: onCircleTap,
                child: Container(
                    width: ScreenConstant.defaultWidthNinetyEight,
                    height: ScreenConstant.defaultHeightNinetyEight,
                    child: _buildCircleAvatar()),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildCircleAvatar() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final radius = min(constraints.maxHeight / 3, constraints.maxWidth / 3);
        return Center(
          child: CircleAvatar(
            radius: radius,
            backgroundColor: AppColors.colorArrowButton,
            child: Icon(
              Icons.arrow_forward_ios,
              size: 10,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
