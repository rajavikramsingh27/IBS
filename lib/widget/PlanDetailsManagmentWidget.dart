import 'package:flutter/material.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/DummyData.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';

class PlanDetailsManagementWidget extends StatelessWidget {
  final String title;
  final String heading;
  final String body;
  PlanDetailsManagementWidget({this.body = "", this.heading = "", this.title = ""});
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
          height: ScreenConstant
              .defaultHeightForty *
              1.3),
      Text(title,
          style: TextStyles
              .textStyleIntroDescription
              .apply(
              color: Colors.white,
              fontSizeDelta: -2)),
      SizedBox(
          height: ScreenConstant
              .defaultHeightForty *
              1.2),
      Card(
          margin: EdgeInsets.zero,
          color: AppColors.colorBackground,
          shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.circular(20)),
          child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ScreenConstant
                    .defaultWidthTwenty,
              ),
              child: Column(
                children: [
                  SizedBox(
                      height: ScreenConstant
                          .defaultHeightForty),
                  Text(
                    heading,
                    style: TextStyles
                        .textStyleIntroDescription
                        .apply(
                        color:
                        Colors.white,
                        fontSizeDelta:
                        -2),
                    textAlign:
                    TextAlign.center,
                  ),
                  SizedBox(
                      height: ScreenConstant
                          .defaultHeightTwentyFour),
                  Text(
                    body,
                    textAlign:
                    TextAlign.center,
                    style: TextStyles
                        .textStyleRegular
                        .apply(
                        color: AppColors
                            .colorSkipButton),
                  ),
                  _buildRelxTechniqueList(),
                ],
              )))
    ]);
  }
  _buildRelxTechniqueList() {
    return GridView.builder(
      padding: EdgeInsets.symmetric(
          horizontal: ScreenConstant.sizeLarge,
          vertical: ScreenConstant.defaultHeightTwentyFour),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: DummyData.medicationList.length,
      itemBuilder: (BuildContext context, int index) {
        var model = DummyData.medicationList[index];
        return Card(
          color: AppColors.colorSymptomsGridBg,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          child: Center(
            child: Text(
              model.title,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyles.textStyleRegular
                  .apply(color: Colors.white, fontSizeDelta: -2),
            ),
          ),
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, childAspectRatio: 3.5),
    );
  }

}
