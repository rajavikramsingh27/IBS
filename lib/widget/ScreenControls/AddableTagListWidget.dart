import 'package:flutter/material.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:flutter_ibs/widget/ScreenControls/TagWidget.dart';
import 'package:get/get.dart';

class AddableTagListWidget extends StatefulWidget {
  final TrackableItem trackableItem;
  final bool isFirst;
  final bool isLast;
  final bool isChild;
  final Function(TrackableSubmitItem) onValueChanged;
  List<Tag> _selectedItems;

  AddableTagListWidget({
    //Key key,
    this.trackableItem,
    this.isFirst,
    this.isLast,
    this.isChild,
    this.onValueChanged,
  }) : super();

  @override
  _AddableTagListWidgetState createState() => _AddableTagListWidgetState();
}

class _AddableTagListWidgetState extends State<AddableTagListWidget> {
  List<Tag> selectedItems;

  @override
  void initState() {
    selectedItems = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool hasChildren = widget.trackableItem.children.length > 0;

    return Stack(
      children: [
        Positioned.fill(
          top: widget.isFirst ? ScreenConstant.defaultHeightOneHundred : 0,
          child: Container(
            color: AppColors.colorYesButton,
          ),
        ),
        Card(
          color: AppColors.colorBackground,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(widget.isFirst ? 20 : 0),
                  topRight: Radius.circular(widget.isFirst ? 20 : 0),
                  bottomLeft: Radius.circular(widget.isLast ? 20 : 0),
                  bottomRight: Radius.circular(widget.isLast ? 20 : 0))),
          margin: EdgeInsets.only(
            left: widget.isChild ? 0 : ScreenConstant.defaultWidthTwenty,
            right: widget.isChild ? 0 : ScreenConstant.defaultWidthTwenty,
          ),
          child: Column(
            children: [
              SizedBox(height: ScreenConstant.defaultHeightTwenty),
              Text(widget.trackableItem.name.tr,
                  style: TextStyles.textStyleIntroDescription
                      .apply(color: Colors.white, fontSizeDelta: -3)),
              Text("Select from this list of common medications and supplements or add your own.",
                style: TextStyles.textStyleRegular
                    .apply(color: AppColors.textGray),
              ),

              /* SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
              Text(
                widget.trackableItem.description.tr,
                textAlign: TextAlign.center,
                style: TextStyles.textStyleRegular
                    .apply(color: AppColors.colorSkipButton),
              ),*/
              // Selected Item Tags
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: ScreenConstant.defaultWidthTen,
                    vertical: ScreenConstant.defaultHeightTen),
                child: Wrap(
                  children: selectedItems
                      .map((item) => InkWell(
                    child: TagWidget(
                      tag: item,
                      onValueChanged: _userTagListTapped,
                    ),
                  ))
                      .toList()
                      .cast<Widget>(),
                ),
              ),

              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                margin: ScreenConstant.spacingAllLarge,
                child: FractionallySizedBox(
                  child: TextFormField(
                    //     controller: _controller.foodTextController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Add Food",
                        hintStyle: TextStyles.textStyleRegular
                            .apply(color: AppColors.colorTextHint),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: ScreenConstant.sizeMedium,
                        )),
                  ),
                ),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: ScreenConstant.defaultWidthTen * 1.5,
                      backgroundColor: AppColors.colorArrowButton,
                      child: Icon(
                        Icons.add,
                        size: FontSize.s11,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: ScreenConstant.sizeDefault),
                    Text(widget.trackableItem.tags.addableLabel.tr,
                      style: TextStyles.textStyleRegular
                          .apply(color: AppColors.white),
                    ),
                  ],
                ),

              SizedBox(width: ScreenConstant.sizeDefault, height: ScreenConstant.defaultHeightTwenty),

              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: ScreenConstant.defaultWidthTen,
                    vertical: ScreenConstant.defaultHeightTwenty),
                child: Wrap(
                  children: widget.trackableItem.tags.tagsDefault
                      .map((item) => InkWell(
                            child: TagWidget(
                              tag: item,
                              onValueChanged: _userTagListTapped,
                            ),
                          ))
                      .toList()
                      .cast<Widget>(),
                ),
              ),
              SizedBox(height: ScreenConstant.defaultHeightTwenty),
              Visibility(
                  visible: !widget.isChild && !widget.isLast && !hasChildren,
                  child: Divider(
                      thickness: 1,
                      color: AppColors.white.withOpacity(0.12))),
            ],
          ),
        ),
      ],
    );
  }

  /// Tap of the list of tags under the input field
  _userTagListTapped(Tag tag) {
    _onHandleToggle(widget.trackableItem, tag);
  }

  _onHandleToggle(TrackableItem item, Tag tag) {
    setState(() {
      if (tag.selected) {
        selectedItems.add(tag);
      } else {
        selectedItems.remove(tag);
      }
    });

    widget.onValueChanged(TrackableSubmitItem(
      tid: item.tid,
      category: item.category,
      kind: item.kind,
      dtype: "arr",
      value: selectedItems,
    ));
  }
}
