import 'package:flutter/material.dart';
import 'package:flutter_ibs/controllers/treatment_plan/TreatmentPlanController.dart';
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/ShowMoreWidget.dart';
import 'package:get/get.dart';

class GridTextCommonWidget extends StatefulWidget {
  final String title;
  final String description;
  final int itemCount;
  final int gridIndex;
  final EdgeInsetsGeometry gridPadding;
  final Function() onTap;
  final Color color;
  final dataList;
  final String gridText;

  GridTextCommonWidget(
      {Key key,
      this.title = "",
      this.description = "",
      this.itemCount = 0,
      this.onTap,
      this.color,
      this.gridText = "",
      this.gridPadding,
      this.gridIndex,
      this.dataList})
      : super(key: key);

  @override
  _GridTextCommonWidgetState createState() => _GridTextCommonWidgetState();
}

class _GridTextCommonWidgetState extends State<GridTextCommonWidget> {
  final TreatmentPlanController _treatmentPlanController = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _treatmentPlanController.selectedTagsList = <Tag>[].obs;
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
        widget.dataList.tagsDefault.length > 0
            ? SizedBox(height: ScreenConstant.defaultHeightTwentyFour)
            : Offstage(),
        Wrap(
          children: widget.dataList.tagsDefault
              .map((Tag item) => InkWell(
                    onTap: () {
                      setState(() {
                        item.required = !item.required;
                        item.category = widget.dataList.category;
                        _treatmentPlanController.onTagTapped(model: item);
                      });
                    },
                    child: Card(
                      color: item.required
                          ? AppColors.colorCloseLight
                          : AppColors.colorSymptomsGridBg,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        item.value,
                        textAlign: TextAlign.center,
                        //overflow: TextOverflow.ellipsis,
                        style: TextStyles.textStyleRegular
                            .apply(color: Colors.white, fontSizeDelta: -2),
                      ),
                    ),
                  ))
              .toList()
              .cast<Widget>(),
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
                        controller: _treatmentPlanController.tagsController,
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
                    text: "Add relaxation technique",
                    onTap: () async {
                      Tag tagsDefault = Tag(
                        required: true,
                        selected: true,
                          value: _treatmentPlanController.tagsController.text,
                          key: _treatmentPlanController.tagsController.text,
                          category: widget.dataList.category);

                      if (await _treatmentPlanController.addTags(
                          tagValue: tagsDefault,)) {
                        setState(() {
                          widget.dataList.tagsDefault.add(tagsDefault);
                        });
                      }
                    },
                  ),
                  SizedBox(height: ScreenConstant.defaultHeightSixteen),
                ],
              )
            : Offstage(),
      ],
    );
  }
}
