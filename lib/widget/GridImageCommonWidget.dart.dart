import 'package:flutter/material.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';

class GridImageCommonWidget extends StatelessWidget {
  final String title;
  final String description;
  final int itemCount;
  final int gridIndex;

  final EdgeInsetsGeometry gridPadding;
  final Function() onTap;
  final Color color;
  final String imageText;
  final String gridText;

  const GridImageCommonWidget(
      {Key key,
      this.title,
      this.description,
      this.itemCount,
      this.onTap,
      this.color,
      this.imageText,
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
            padding: gridPadding,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: itemCount,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: onTap,
                child: Card(
                    elevation: 0,
                    color: color,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: ScreenConstant.spacingAllDefault,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            imageText,
                            width: ScreenConstant.defaultWidthTwenty * 2.0,
                          ),
                          SizedBox(height: ScreenConstant.defaultHeightTen),
                          Text(gridText,
                              textAlign: TextAlign.center,
                              style: TextStyles.textStyleRegular.apply(
                                  color: AppColors.white, fontSizeDelta: -2)),
                        ],
                      ),
                    )),
              );
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, childAspectRatio: 1),
          ),
        ],
      ),
    );
  }
}
