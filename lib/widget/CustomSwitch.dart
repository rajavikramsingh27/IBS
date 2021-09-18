

import 'package:flutter/material.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/HexColor.dart';


class CustomSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color color;

  CustomSwitch(
      {Key key,
      this.value,
      this.onChanged,
      this.color = AppColors.colorArrowButton})
      : super(key: key);

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch>
    with SingleTickerProviderStateMixin {
   Animation _circleAnimation;
   AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 60));
    _circleAnimation = AlignmentTween(
            begin: widget.value ? Alignment.centerRight : Alignment.centerLeft,
            end: widget.value ? Alignment.centerLeft : Alignment.centerRight)
        .animate(CurvedAnimation(
            parent: _animationController, curve: Curves.linear));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            if (_animationController.isCompleted) {
              _animationController.reverse();
            } else {
              _animationController.forward();
            }
            widget.value == false
                ? widget.onChanged(true)
                : widget.onChanged(false);
          },
          child: Container(
            width: ScreenConstant.sizeXXL,
            height: ScreenConstant.defaultHeightTwenty,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: _circleAnimation.value == Alignment.centerLeft
                  ? widget.color
                  : HexColor('5b5278'),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 2.0,
                bottom: 2.0,
                right: 4.0, left: 4.0
              ),
              child: Container(
                alignment: _circleAnimation.value == Alignment.centerLeft
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: Container(
                  width: 12.5,
                  height: 12.5,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: AppColors.white),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
