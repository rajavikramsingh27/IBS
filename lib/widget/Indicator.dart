import 'package:flutter/material.dart';
import 'package:flutter_ibs/utils/Colors.dart';

class Indicator extends StatelessWidget {
  Indicator({
    required this.controller,
    this.itemCount: 0,
  }) : assert(controller != null);

  /// PageView Controller
  final PageController controller;

  /// Number of indicators
  final int itemCount;

  /// Ordinary colours
  final Color normalColor = Colors.blue;

  /// Selected color
  final Color selectedColor = Colors.red;

  /// Size of points
  final double size = 8.0;

  /// Spacing of points
  final double spacing = 8.0;

  /// Point Widget
  Widget _buildIndicator(
      int index, int pageCount, double dotSize, double spacing) {
    // Is the current page selected?
    bool isCurrentPageSelected = true;
    // if (index==controller.page.round() % pageCount){
    //    isCurrentPageSelected=true;
    // }
    // else
    //   isCurrentPageSelected=false;
    try {
      isCurrentPageSelected =
          index == (controller.page!.round() % pageCount) ?? 0 as bool;
    } catch (_) {
      return AnimatedContainer(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            index == 0
                ? BoxShadow(
                    color: AppColors.colorDot,
                    // blurRadius: 4.0,
                    spreadRadius: 5.0,
                    offset: Offset(
                      0.0,
                      0.0,
                    ),
                  )
                : BoxShadow(
                    color: Colors.transparent,
                  )
          ],
        ),
        height: size,
        width: size + (2 * spacing),
        duration: Duration(milliseconds: 300),
        child: Center(
          child: Material(
            color: isCurrentPageSelected
                ? AppColors.white
                : AppColors.colorDotNotFocused,
            type: MaterialType.circle,
            child: Container(
              width: dotSize,
              height: dotSize,
            ),
          ),
        ),
      );
    }
    // isCurrentPageSelected= index ==
    //   ( controller.page.round() % pageCount )??0;
    //   print("page:$pageCount");

    return AnimatedContainer(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          isCurrentPageSelected
              ? BoxShadow(
                  color: AppColors.colorDot,
                  // blurRadius: 4.0,
                  spreadRadius: 5.0,
                  offset: Offset(
                    0.0,
                    0.0,
                  ),
                )
              : BoxShadow(
                  color: Colors.transparent,
                ),
        ],
      ),
      height: size,
      width: size + (2 * spacing),
      duration: Duration(milliseconds: 300),
      child: Center(
        child: Material(
          color: isCurrentPageSelected
              ? AppColors.white
              : AppColors.colorDotNotFocused,
          type: MaterialType.circle,
          child: Container(
            width: dotSize,
            height: dotSize,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(itemCount, (int index) {
        return _buildIndicator(index, itemCount, size, spacing);
      }),
    );
  }
}
