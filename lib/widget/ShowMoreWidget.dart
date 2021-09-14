import 'package:flutter/material.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';

class ShowMoreWidget extends StatelessWidget {
  final String text;
  final Function() onTap;

  const ShowMoreWidget({Key key, this.text = "", this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: ScreenConstant.defaultWidthTen * 1.5,
            backgroundColor: AppColors.colorArrowButton,
            child: Icon(
              Icons.add,
              size: FontSize.s11,
              color: Colors.white,
            ),
          ),
          SizedBox(width: ScreenConstant.sizeDefault),
          Text(
            text,
            style: TextStyles.textStyleRegular.apply(color: AppColors.white),
          )
        ],
      ),
    );
  }
}
