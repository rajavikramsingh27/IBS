import 'package:flutter/material.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:get/get.dart';


class FixedTagListWidget extends StatefulWidget {
  final TrackableItem trackableItem;
  final bool isFirst;
  final bool isLast;
  final bool isChild;
  final Function(TrackableSubmitItem) onValueChanged;
  List<Tag> _selectedItems;

  FixedTagListWidget({
    //Key key,
    this.trackableItem,
    this.isFirst,
    this.isLast,
    this.isChild,
    this.onValueChanged,
  }) : super();

  @override
  _FixedTagListWidgetState createState() => _FixedTagListWidgetState();
}

class _FixedTagListWidgetState extends State<FixedTagListWidget> {

  List<Tag> _selectedItems;

  @override
  void initState() {
    _selectedItems = [];

    widget.trackableItem.tags.tagsDefault.forEach((element) {
      element.selected = false;
    });

    widget.onValueChanged(TrackableSubmitItem(
      tid: widget.trackableItem.tid,
      category: widget.trackableItem.category,
      kind: widget.trackableItem.kind,
      dtype: "arr",
      value: TrackableSubmitItemValue(arr: []),
    ));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        Positioned.fill(
          top: 0,
          bottom: 0,
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
              SizedBox(height: ScreenConstant.defaultHeightTwenty),
              Text(widget.trackableItem.name.tr,
                  style: TextStyles.textStyleIntroDescription
                      .apply(color: Colors.white, fontSizeDelta: -3)),
              SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
              Text(
                widget.trackableItem.description.tr,
                textAlign: TextAlign.center,
                style: TextStyles.textStyleRegular
                    .apply(color: AppColors.colorSkipButton),
              ),
              SizedBox(height: ScreenConstant.defaultHeightTwenty),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: ScreenConstant.defaultWidthTen),
                child: Wrap(
                  children: widget.trackableItem.tags.tagsDefault
                      .map((item) => InkWell(
                    onTap: () {
                      _onHandleToggle(widget.trackableItem, item);

                    },
                    child: Card(
                      color: item.selected
                          ? AppColors.colorCloseLight
                          : AppColors.colorSymptomsGridBg,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: ScreenConstant.spacingAllExtraSmall,
                        child: Text(
                          item.value.tr,
                          textAlign: TextAlign.center,
                          //overflow: TextOverflow.ellipsis,
                          style: TextStyles.textStyleRegular.apply(
                              color: Colors.white, fontSizeDelta: -2),
                        ),
                      ),
                    ),
                  ))
                      .toList()
                      .cast<Widget>(),
                ),
              ),
              SizedBox(height: ScreenConstant.defaultHeightTwenty),
              Visibility(
                  visible: !widget.isChild,
                  child: Divider(
                      thickness: 1,
                      color: AppColors.white.withOpacity(0.12))),
            ],
          ),
        ),
      ],
    );
  }

  _onHandleToggle(TrackableItem item, Tag tag){

    setState(() {
      tag.selected = !tag.selected;

      if (tag.selected){
        _selectedItems.add(tag);
      }else{
        _selectedItems.remove(tag);
      }
    });

    List<String> flatList = [];

    _selectedItems.forEach((element) {
      flatList.add(element.value);
    });

    widget.onValueChanged(TrackableSubmitItem(
      tid: item.tid,
      category: item.category,
      kind: item.kind,
      dtype: "arr",
      value: TrackableSubmitItemValue(arr:flatList),
    ));
  }
}
