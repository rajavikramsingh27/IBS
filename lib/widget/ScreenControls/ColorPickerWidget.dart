import 'package:flutter/material.dart';
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:flutter_ibs/services/url.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:get/get.dart';

class ColorPickerWidget extends StatefulWidget {
  final TrackableItem trackableItem;
  final bool isFirst;
  final bool isLast;
  final bool isChild;
  final Function(TrackableSubmitItem) onValueChanged;
  final Function(TrackableItem)  onValueRemoved;

  const ColorPickerWidget({
    Key key,
    this.trackableItem,
    this.isFirst,
    this.isLast,
    this.isChild,
    this.onValueChanged,
    this.onValueRemoved,
  }) : super(key: key);

  @override
  _ColorPickerWidgetState createState() => _ColorPickerWidgetState();
}

class _ColorPickerWidgetState extends State<ColorPickerWidget> {
  double _currentValue; // this.trackableItem.rating.value.toDouble();

  @override
  void initState() {
    //  _currentValue = widget.trackableItem.rating.value.toDouble();
    super.initState();
  }



  @override
  void deactivate() {
    super.deactivate();
    widget.onValueRemoved(widget.trackableItem);
  }




  @override
  Widget build(BuildContext context) {
    return Stack(children: [
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
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: ScreenConstant.defaultHeightTwenty),
            child: Column(children: [
              Card(
                color: AppColors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                margin: EdgeInsets.only(
                  left: widget.isChild ? 0 : ScreenConstant.defaultWidthTwenty,
                  right: widget.isChild ? 0 : ScreenConstant.defaultWidthTwenty,
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenConstant.sizeXL,
                      vertical: ScreenConstant.defaultHeightTwentyFour),
                  child: Column(
                    children: [
                      Text(widget.trackableItem.name.tr,
                          style: TextStyles.textStyleIntroDescription.apply(
                              color: Colors.black)), // fontSizeDelta: -1)),
                      SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
                      Text(
                        widget.trackableItem.color.value == null
                            ? ""
                            : widget.trackableItem.color.value.description,
                        textAlign: TextAlign.center,
                        style: TextStyles.textStyleRegular.apply(),
                      ),
                      SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
                      GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount:
                            widget.trackableItem.color.options.length ?? 0,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                widget.trackableItem.color.value =
                                    widget.trackableItem.color.options[index];
                              });
                              widget.onValueChanged(TrackableSubmitItem(
                                tid: widget.trackableItem.tid,
                                category: widget.trackableItem.category,
                                kind: widget.trackableItem.kind,
                                dtype: "str",
                                value: TrackableSubmitItemValue(
                                    str: widget.trackableItem.color.value
                                        .toString()),
                              ));
                            },
                            child: widget.trackableItem.color.colorDefault
                                        .value ==
                                    widget.trackableItem.color.options[index]
                                        .value
                                ? CircleAvatar(
                                    radius: 30,
                                    backgroundColor:
                                        AppColors.colordropdownArrow,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColors.fromHex(widget
                                              .trackableItem
                                              .color
                                              .options[index]
                                              .hex)),
                                      width: ScreenConstant.sizeXL,
                                    ),
                                  )
                                : CircleAvatar(
                                    radius: 30,
                                    backgroundColor: AppColors.fromHex(widget
                                        .trackableItem
                                        .color
                                        .options[index]
                                        .hex),
                                  ),
                          );
                        },
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 20,
                            crossAxisCount: 3,
                            childAspectRatio: 1.4),
                      ),

                      SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
                    ],
                  ),
                ),
              ),
              SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
              Visibility(
                  visible: true, // !widget.isChild && !widget.isLast,
                  child: Divider(
                      thickness: 1, color: AppColors.white.withOpacity(0.12))),
            ]),
          ))
    ]);
  }

  getImage({RatingOption item}) {
    Widget image = FadeInImage(
      width: ScreenConstant.defaultWidthOneHundredSeven,
      height: ScreenConstant.defaultHeightOneHundred,
      image: NetworkImage(item.image.normal),
      placeholder: NetworkImage(BLANK_PLACEHOLDER),
      imageErrorBuilder: (context, error, stackTrace) {
        return Image.network(BLANK_PLACEHOLDER,
            width: ScreenConstant.defaultWidthOneHundredSeven,
            height: ScreenConstant.defaultHeightOneHundred,
            fit: BoxFit.fitWidth);
      },
      fit: BoxFit.fitWidth,
    );
    return image;
  }

  getDesc({RatingOption item}) {
    return Text(item.description.tr ?? "",
        textAlign: TextAlign.center, style: TextStyles.textStyleRegular);
  }
}
