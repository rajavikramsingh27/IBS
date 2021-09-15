import 'package:flutter/material.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/DummyData.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';

class PlanDetailsManagementWidget extends StatelessWidget {
  final String title;
  final String heading;
  final String body;
  final List<dynamic> tags;
  PlanDetailsManagementWidget({this.body = "", this.heading = "", this.title = "", this.tags});
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
                vertical: ScreenConstant
                    .defaultWidthTwenty,
              ),
              child: Column(
                children: [
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
                  Wrap(
                    children: tags
                        .map((item) => InkWell(
                      onTap: null,
                      child: Card(
                        color: item.required
                            ? AppColors.colorCloseLight
                            : AppColors.colorSymptomsGridBg,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: ScreenConstant.spacingAllExtraSmall,
                          child: Text(
                            item.value,
                            textAlign: TextAlign.center,
                            //overflow: TextOverflow.ellipsis,
                            style: TextStyles.textStyleRegular
                                .apply(color: Colors.white, fontSizeDelta: -2),
                          ),
                        ),
                      ),
                    ))
                        .toList()
                        .cast<Widget>(),
                  ),
                ],
              )))
    ]);
  }

}
