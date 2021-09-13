import 'package:flutter/material.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class ListWidget extends StatelessWidget {
  final TrackableItem trackableItem;
  final bool isFirst;
  final bool isLast;
  final bool isChild;


  const ListWidget({
    //Key key,
    this.trackableItem,
    this.isFirst,
    this.isLast,
    this.isChild,

  }) : super();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            color: AppColors.colorYesButton,
          ),
        ),
        Container(
          color: AppColors.colorBackground,
          margin: EdgeInsets.only(
            left: ScreenConstant.defaultWidthTwenty,
            right: ScreenConstant.defaultWidthTwenty,
          ),
          padding: EdgeInsets.symmetric(
              horizontal: ScreenConstant.defaultWidthTwenty),
          child: Column(
            children: [
              SizedBox(height: ScreenConstant.defaultHeightForty),
              Text(trackableItem.name.tr,
                  style: TextStyles.textStyleIntroDescription
                      .apply(color: Colors.white, fontSizeDelta: -3)),
              SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
              Text(
                trackableItem.description.tr,
                textAlign: TextAlign.center,
                style: TextStyles.textStyleRegular
                    .apply(color: AppColors.colorSkipButton),
              ),
              SizedBox(height: ScreenConstant.defaultHeightTwenty),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: ScreenConstant.defaultWidthTen),
                child: GridView.builder(
                  //   padding: EdgeInsets.symmetric(
                  //       horizontal: ScreenConstant.defaultWidthTwenty),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: trackableItem.list.options.length,
                  itemBuilder: (BuildContext context, int optIdx) {
                    var model = trackableItem.list.options[optIdx];
                    return InkWell(
                      onTap: () {
                      /*  _healthWellnessController.onOptionTapped(
                          model: model,
                          tid: trackableItem.tid,
                          kind: trackableItem.kind,
                        ); */
                      },
                      child: Card(
                          elevation: 0,
                          color: model.optionDefault
                              ? AppColors.colorCloseLight
                              : AppColors.colorSymptomsGridBg,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Padding(
                            padding: ScreenConstant.spacingAllDefault,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.network(
                                  model.image.active,
                                  width:
                                  ScreenConstant.defaultWidthTwenty * 2.0,
                                ),
                                SizedBox(
                                    height: ScreenConstant.defaultHeightTen),
                                Text("${model.label.tr}",
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyles.textStyleRegular.apply(
                                        color: AppColors.white,
                                        fontSizeDelta: -2)),
                              ],
                            ),
                          )),
                    );
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, childAspectRatio: 1),
                ),
              ),
              SizedBox(height: ScreenConstant.defaultHeightTwenty),
              Divider(thickness: 1, color: AppColors.white.withOpacity(0.12)),
            ],
          ),
        ),
      ],
    );
  }
}
