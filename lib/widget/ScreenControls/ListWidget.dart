import 'package:flutter/material.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:get/get.dart';

class ListWidget extends StatefulWidget {
  final TrackableItem trackableItem;
  final bool isFirst;
  final bool isLast;
  final bool isChild;
  final Function(TrackableSubmitItem) onValueChanged;

  const ListWidget({
    Key key,
    this.trackableItem,
    this.isFirst,
    this.isLast,
    this.isChild,
    this.onValueChanged,

  }) : super(key: key);

  @override
  _ListWidgetState createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {

  List<ListOption> _selectedItems = [];

  @override
  void initState() {

    super.initState();
  }

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
                child: GridView.builder(
                  //   padding: EdgeInsets.symmetric(
                  //       horizontal: ScreenConstant.defaultWidthTwenty),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: widget.trackableItem.list.options.length,
                  itemBuilder: (BuildContext context, int optIdx) {
                    var option = widget.trackableItem.list.options[optIdx];
                    return InkWell(
                      onTap: () {
                        _onHandleToggle(widget.trackableItem, option);
                        /*_onOptionTapped(
                          model: model,
                          tid: trackableItem.tid,
                          kind: trackableItem.kind,
                        );*/
                      },
                      child: Card(
                          elevation: 0,
                          color: option.selected
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
                                  option.image.active,
                                  width:
                                  ScreenConstant.defaultWidthTwenty * 2.0,
                                ),
                                SizedBox(
                                    height: ScreenConstant.defaultHeightTen),
                                Text("${option.label.tr}",
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

  /// Toggle our element's state for tracking
  /// and send a list of all selected items to onValueChanged.
  _onHandleToggle(TrackableItem item, ListOption option){
    setState(() {
      option.selected = !option.selected;

      if (option.selected){
        _selectedItems.add(option);
      }else{
        _selectedItems.remove(option);
      }
    });


    widget.onValueChanged(TrackableSubmitItem(
      tid: item.tid,
      category: item.category,
      kind: item.kind,
      dtype: "arr",
      value: _selectedItems,
    ));


  }


}
