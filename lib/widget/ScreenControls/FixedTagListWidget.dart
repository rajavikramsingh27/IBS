import 'package:flutter/material.dart';
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/utils/TrackableItemUtils.dart';
import 'package:flutter_ibs/widget/ScreenControls/TagWidget.dart';
import 'package:get/get.dart';

class FixedTagListWidget extends StatefulWidget {
  final TrackableItem trackableItem;
  final bool isFirst;
  final bool isLast;
  final bool isChild;
  final Function(TrackableSubmitItem) onValueChanged;
  final Function(TrackableItem)  onValueRemoved;


  FixedTagListWidget({
    //Key key,
    this.trackableItem,
    this.isFirst,
    this.isLast,
    this.isChild,
    this.onValueChanged,
    this.onValueRemoved,
  }) : super();

  @override
  _FixedTagListWidgetState createState() => _FixedTagListWidgetState();
}

class _FixedTagListWidgetState extends State<FixedTagListWidget> {
  RxList<Tag> selectedItems;
  RxList<Tag> _allTags;

  @override
  void initState() {
     super.initState();
     doInit();
  }



  @override
  void deactivate() {
    super.deactivate();
    widget.onValueRemoved(widget.trackableItem);
  }


  void doInit(){
    selectedItems = RxList<Tag>();

    // Set the initial list of selected tags
    if (widget.trackableItem.tags.selectedTags != null) {
      widget.trackableItem.tags.selectedTags.forEach((selTag) {
        selectedItems.add(selTag);
      });
      selectedItems.refresh();
    }

    // Combine the available tags default with the user's list:
    _allTags = RxList<Tag>();
    List<Tag> combinedTags = TrackableItemUtils()
        .addUserTagsToList(
        tags: widget.trackableItem.tags.tagsDefault,
        category: widget.trackableItem.tags.category);

    // Set the available tags active if they are selected:
    combinedTags.forEach((aTag) {
      selectedItems.forEach((sTag) {
        if(sTag.value == aTag.value){
          aTag.selected = true;
        }
      });
    });

    _allTags.addAll(combinedTags);


    List<String> flatList = [];
    selectedItems.forEach((element) {
      flatList.add(element.value);
    });

    widget.onValueChanged(TrackableSubmitItem(
      tid: widget.trackableItem.tid,
      category: widget.trackableItem.category,
      kind: widget.trackableItem.kind,
      dtype: "arr",
      value: TrackableSubmitItemValue(arr: flatList),
    ));
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
          child: Container(
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
                    children: TrackableItemUtils()
                        .addUserTagsToList(
                            tags: widget.trackableItem.tags.tagsDefault,
                            category: widget.trackableItem.tags.category)
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
                    visible: !widget.isLast && !widget.isChild,
                    child: Divider(
                        thickness: 1,
                        color: AppColors.white.withOpacity(0.12))),
              ],
            ),
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
        for(var i=0;i<selectedItems.length;i++){
          if (selectedItems[i].value == tag.value){
            selectedItems.removeAt(i);
          }
        }
        _allTags.forEach((aTag) {
          if (aTag.value == tag.value){
            aTag.selected = false;
          }
        });
      }
      selectedItems.refresh();
    });


    List<String> flatList = [];
    selectedItems.forEach((element) {
      flatList.add(element.value);
    });

    widget.onValueChanged(TrackableSubmitItem(
      tid: item.tid,
      category: item.category,
      kind: item.kind,
      dtype: "arr",
      value: TrackableSubmitItemValue(arr: flatList),
    ));
  }

  /*
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

   */
}
