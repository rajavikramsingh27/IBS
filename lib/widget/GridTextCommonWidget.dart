import 'package:flutter/material.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';

class GridTextCommonWidget extends StatelessWidget {
  final String title;
  final String description;
  final int itemCount;
  final int gridIndex;

  final EdgeInsetsGeometry gridPadding;
  final Function() onTap;
  final Color color;

  final String gridText;

  const GridTextCommonWidget(
      {Key key,
      this.title,
      this.description,
      this.itemCount,
      this.onTap,
      this.color,
      this.gridText,
      this.gridPadding,
      this.gridIndex})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ScreenConstant.spacingAllMedium,
      child: Column(
        children: [
          SizedBox(height: ScreenConstant.defaultHeightTwenty),
          Text(title,
              textAlign: TextAlign.center,
              style: TextStyles.textStyleIntroDescription
                  .apply(color: Colors.white, fontSizeDelta: -3)),
          SizedBox(height: ScreenConstant.defaultHeightTen),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyles.textStyleRegular
                .apply(color: AppColors.colorSkipButton),
          ),
          SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
          GridView.builder(
            padding: EdgeInsets.symmetric(
                horizontal: ScreenConstant.sizeLarge,
                vertical: ScreenConstant.defaultHeightTwentyFour),
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: itemCount,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: onTap,
                child: Card(
                  color: AppColors.colorSymptomsGridBg,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)),
                  child: Center(
                    child: Text(
                      gridText,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyles.textStyleRegular
                          .apply(color: Colors.white, fontSizeDelta: -2),
                    ),
                  ),
                ),
              );
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, childAspectRatio: 2.5),
          )
        ],
      ),
    );
  }
}
