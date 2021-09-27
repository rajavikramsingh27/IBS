import 'package:flutter/material.dart';
import 'package:flutter_ibs/controllers/treatment_plan/TreatmentPlanController.dart';
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/ShowMoreWidget.dart';
import 'package:get/get.dart';

class GridImageCommonWidget extends StatefulWidget {
  final String title;
  final String description;
  final int itemCount;
  final int gridIndex;
  final dataList;
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
      this.gridIndex,
      this.dataList})
      : super(key: key);

  @override
  State<GridImageCommonWidget> createState() => _GridImageCommonWidgetState();
}

class _GridImageCommonWidgetState extends State<GridImageCommonWidget> {
  final TreatmentPlanController _treatmentPlanController = Get.find();
  @override
  void initState() {
    super.initState();
    _treatmentPlanController.selectedTagsList = <ListOption>[].obs;
    _treatmentPlanController.selectedTagsList.refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: ScreenConstant.defaultHeightTwenty),
        Text(widget.title,
            textAlign: TextAlign.center,
            style: TextStyles.textStyleIntroDescription
                .apply(color: Colors.white, fontSizeDelta: -3)),
        SizedBox(height: ScreenConstant.defaultHeightTen),
        Text(
          widget.description,
          textAlign: TextAlign.center,
          style: TextStyles.textStyleRegular
              .apply(color: AppColors.colorSkipButton),
        ),
        widget.dataList.options.length > 0
            ? SizedBox(height: ScreenConstant.defaultHeightTwentyFour)
            : Offstage(),
        GridView.builder(
          padding: widget.gridPadding,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: widget.dataList.options.length,
          itemBuilder: (BuildContext context, int index) {
            ListOption model = widget.dataList.options[index];
            return InkWell(
              onTap: () {
                setState(() {
                  model.optionDefault = !model.optionDefault;
                  model.category = widget.dataList.category;
                  _treatmentPlanController.onTagTapped(model: model,);
                });
              },
              child: Card(
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
                        width: ScreenConstant.defaultWidthTwenty * 2.0,
                      ),
                      SizedBox(height: ScreenConstant.defaultHeightTen),
                      Text(model.value,
                          textAlign: TextAlign.center,
                          style: TextStyles.textStyleRegular.apply(
                              color: AppColors.white, fontSizeDelta: -2)),
                    ],
                  )),
            );
          },
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, childAspectRatio: 0.85),
        ),
        SizedBox(height: ScreenConstant.defaultHeightTen),
        widget.dataList.userAddable
            ? Column(
                children: [
                  Container(
                    height: ScreenConstant.sizeDefault,
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    child: FractionallySizedBox(
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Edit...",
                            hintStyle: TextStyles.textStyleRegular
                                .apply(color: AppColors.colorTextHint),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: ScreenConstant.sizeMedium,
                            )),
                      ),
                    ),
                  ),
                  SizedBox(height: ScreenConstant.defaultHeightSixteen),
                  ShowMoreWidget(
                    text: "Add custom exercise",
                  ),
                  SizedBox(height: ScreenConstant.defaultHeightSixteen),
                ],
              )
            : Offstage(),
      ],
    );
  }
}
