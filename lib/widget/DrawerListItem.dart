import 'package:flutter/material.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';

class DrawerListItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const DrawerListItem({Key key, this.title, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
          elevation: 0,
          margin: EdgeInsets.zero,
          // padding: EdgeInsets.symmetric(
          //     vertical: ScreenConstant.sizeLarge,
          //     horizontal: ScreenConstant.sizeLarge
          // ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: ScreenConstant.sizeLarge,
                horizontal: ScreenConstant.sizeLarge),
            child: Row(
              //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                ),
                Spacer(),
                Icon(
                  Icons.chevron_right,
                  color: AppColors.textSemiBold,
                  size: ScreenConstant.sizeLarge,
                ),
              ],
            ),
          )),
    );
  }
}
