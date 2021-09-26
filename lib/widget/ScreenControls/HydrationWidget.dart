import 'package:flutter/material.dart';
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:get/get.dart';

class HydrationWidget extends StatefulWidget {
  final TrackableItem trackableItem;
  final bool isFirst;
  final bool isLast;
  final bool isChild;
  final Function(TrackableSubmitItem) onValueChanged;
  final Function(TrackableItem)  onValueRemoved;

  const HydrationWidget({
    Key key,
    this.trackableItem,
    this.isFirst,
    this.isLast,
    this.isChild,
    this.onValueChanged,
    this.onValueRemoved,
  }) : super(key: key);

  @override
  _HydrationWidgetState createState() => _HydrationWidgetState();
}

class _HydrationWidgetState extends State<HydrationWidget> {
  int num;

  @override
  void initState() {
    num = 0;

    // As this is tracked, set its initial tracking state:
    widget.onValueChanged(TrackableSubmitItem(
      tid: widget.trackableItem.tid,
      category: widget.trackableItem.category,
      kind: widget.trackableItem.kind,
      dtype: "num",
      value: TrackableSubmitItemValue(number: num),
    ));
    super.initState();
  }



  @override
  void deactivate() {
    super.deactivate();
    widget.onValueRemoved(widget.trackableItem);
  }




  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          top: widget.isFirst ? ScreenConstant.defaultHeightOneHundred : 0,
          child: Container(
            color: AppColors.colorYesButton,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
              horizontal:
                  widget.isChild ? 0 : ScreenConstant.defaultWidthTwenty,
              vertical: 1),
          child: Column(
            children: [
              SizedBox(height: ScreenConstant.defaultHeightForty),
              Text(widget.trackableItem.name.tr,
                  style: TextStyles.textStyleIntroDescription
                      .apply(color: Colors.black, fontSizeDelta: -2)),
              SizedBox(height: ScreenConstant.sizeDefault),
              Text(
                widget.trackableItem.description.tr,
                textAlign: TextAlign.center,
                style: TextStyles.textStyleRegular.apply(color: Colors.black),
              ),
              SizedBox(height: ScreenConstant.defaultHeightTwenty),
              _buildHydrationList(num),
            ],
          ),
        ),
      ],
    );
  }

  _buildHydrationList(int index) {
    return GridView.builder(
      // padding:
      // EdgeInsets.symmetric(horizontal: ScreenConstant.defaultWidthTwenty),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: widget.trackableItem.sum.range ?? 0,
      itemBuilder: (BuildContext context, int ind) {
        return InkWell(
          onTap: () {
            setState(() {
              if (ind == 0 && num == 1){
                num = 0;
              }else {
                num = ind + 1;
              }
            });

            widget.onValueChanged(TrackableSubmitItem(
              tid: widget.trackableItem.tid,
              category: widget.trackableItem.category,
              kind: widget.trackableItem.kind,
              dtype: "num",
              value: TrackableSubmitItemValue(number: num),
            ));

            /* ind++;
            _controller.noOfGlasses.value = ind;
            _controller.noOfGlasses.refresh();
            _signUpController.food.refresh();
            print("glass:${_controller.noOfGlasses}");

            */
          },
          // child: CircleAvatar(
          //   backgroundColor: Colors.white.withOpacity(0.20),
          child: Padding(
              padding: ScreenConstant.spacingAllSmall,
              child: Image.network(
                num > ind
                    ? widget.trackableItem.sum.image.active
                    : widget.trackableItem.sum.image.normal,
                width: ScreenConstant.defaultWidthTwenty * 20,
                height: ScreenConstant.defaultHeightTwenty * 10,
              )),
          // ),
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 0.01,
          mainAxisSpacing: 0.01,
          crossAxisCount: 5,
          childAspectRatio: 1),
    );
  }
}
