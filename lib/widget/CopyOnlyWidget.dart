import 'package:flutter/material.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';

class CopyOnlyWidget extends StatelessWidget {
  final String title;
  final String description;
  final List dataList;

  const CopyOnlyWidget({Key key, this.title, this.description, this.dataList})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ScreenConstant.spacingAllMedium,
      child: ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemCount: dataList.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              SizedBox(height: ScreenConstant.defaultHeightTwenty),
              Text(dataList[index].heading,
                  textAlign: TextAlign.center,
                  style: TextStyles.textStyleIntroDescription
                      .apply(color: Colors.white, fontSizeDelta: -3)),
              SizedBox(height: ScreenConstant.defaultHeightTen),
              Text(
                dataList[index].body,
                textAlign: TextAlign.center,
                style: TextStyles.textStyleRegular
                    .apply(color: AppColors.colorSkipButton),
              ),
              SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
            ],
          );
        },
      ),
    );
  }
}
