import 'package:flutter/material.dart';
import 'package:flutter_ibs/controllers/treatment_plan/TreatmentPlanController.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
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
  Widget build(BuildContext context) {
    return Padding(
      padding: ScreenConstant.spacingAllMedium,
      child: Column(
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
          SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
          Wrap(
            children: widget.dataList.tagsDefault
                .map((item) => InkWell(
                      onTap: (){
                        setState(() {
                          item.required = !item.required;
                          _treatmentPlanController.onTagTapped(model: item);
                        });
                      },
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
          widget.dataList.userAddable?Column(
            children: [
              Container(
                height: ScreenConstant.sizeDefault,
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(
                        8)),
                child: FractionallySizedBox(
                  child: TextFormField(
                    decoration: InputDecoration(
                        border:
                        InputBorder.none,
                        hintText: "Edit...",
                        hintStyle: TextStyles
                            .textStyleRegular
                            .apply(
                            color: AppColors
                                .colorTextHint),
                        contentPadding:
                        EdgeInsets
                            .symmetric(
                          horizontal:
                          ScreenConstant
                              .sizeMedium,
                        )),
                  ),
                ),
              ),
              SizedBox(
                  height: ScreenConstant
                      .defaultHeightSixteen),
              Row(
                mainAxisAlignment:
                MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: ScreenConstant
                        .defaultWidthTen *
                        1.5,
                    backgroundColor: AppColors
                        .colorArrowButton,
                    child: Icon(
                      Icons.add,
                      size: FontSize.s11,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                      width: ScreenConstant
                          .sizeDefault),
                  Text(
                    "Add relaxation technique",
                    style: TextStyles
                        .textStyleRegular
                        .apply(
                        color: AppColors
                            .white),
                  )
                ],
              ),
            ],
          ):Offstage(),
        ],
      ),
    );
  }
}
