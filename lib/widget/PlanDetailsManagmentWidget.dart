import 'package:flutter/material.dart';
import 'package:flutter_ibs/controllers/treatment_plan/TreatmentPlanController.dart';
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:get/get.dart';

class PlanDetailsManagementWidget extends StatelessWidget {
  final String title;
  final String heading;
  final String body;
  final RxList<Tag> tags;
  final RxList<ListOption> optionList;

  PlanDetailsManagementWidget(
      {this.body = "", this.heading = "", this.title = "", this.tags, this.optionList,});
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(height: ScreenConstant.defaultHeightForty * 1.3),
      Text(title,
          style: TextStyles.textStyleIntroDescription
              .apply(color: Colors.white, fontSizeDelta: -2)),
      SizedBox(height: ScreenConstant.defaultHeightForty * 1.2),
      Card(
          margin: EdgeInsets.zero,
          color: AppColors.colorBackground,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ScreenConstant.defaultWidthTwenty,
                vertical: ScreenConstant.defaultWidthTwenty,
              ),
              child: Column(
                children: [
                  Text(
                    heading,
                    style: TextStyles.textStyleIntroDescription
                        .apply(color: Colors.white, fontSizeDelta: -2),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
                  Text(
                    body,
                    textAlign: TextAlign.center,
                    style: TextStyles.textStyleRegular
                        .apply(color: AppColors.colorSkipButton),
                  ),
                  Obx(()=>tags.length>0?Wrap(
                    children: tags
                        .map((item) => InkWell(
                      onTap: null,
                      child: Card(
                        color: item.required
                            ? AppColors.colorCloseLight
                            : AppColors.colorSymptomsGridBg,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(10)),
                        child: Padding(
                          padding: ScreenConstant
                              .spacingAllExtraSmall,
                          child: Text(
                            item.value,
                            textAlign: TextAlign.center,
                            //overflow: TextOverflow.ellipsis,
                            style: TextStyles.textStyleRegular
                                .apply(
                                color: Colors.white,
                                fontSizeDelta: -2),
                          ),
                        ),
                      ),
                    ))
                        .toList()
                        .cast<Widget>(),
                  ):Offstage(),),
                  Obx(()=>optionList.length>0?GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: optionList.length,
                    itemBuilder: (BuildContext context, int index) {
                      var model = optionList[index];
                      return Card(
                          elevation: 0,
                          color: model.optionDefault
                              ? AppColors.colorCloseLight
                              : AppColors.colorSymptomsGridBg,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(
                                model.image.active,
                                width:
                                ScreenConstant.defaultWidthTwenty *
                                    2.0,
                              ),
                              SizedBox(
                                  height:
                                  ScreenConstant.defaultHeightTen),
                              Text(model.value,
                                  textAlign: TextAlign.center,
                                  style: TextStyles.textStyleRegular
                                      .apply(
                                      color: AppColors.white,
                                      fontSizeDelta: -2)),
                            ],
                          ));
                    },
                    gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, childAspectRatio: 0.85),
                  ):Offstage())
                ],
              )))
    ]);
  }
}
