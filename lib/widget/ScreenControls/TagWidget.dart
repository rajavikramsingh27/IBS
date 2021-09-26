import 'package:flutter/material.dart';
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class TagWidget extends StatefulWidget {
  final Tag tag;
  final bool isFirst;
  final bool isLast;
  final bool isChild;
  final Function(Tag) onValueChanged;

  const TagWidget({
    Key key,
    this.tag,
    this.isFirst,
    this.isLast,
    this.isChild,
    this.onValueChanged,
  }) : super(key: key);

  @override
  _TagWidgetState createState() => _TagWidgetState();
}

class _TagWidgetState extends State<TagWidget> {
  // bool _selected; // this.trackableItem.rating.value.toDouble();

  @override
  void initState() {
    //  _currentValue = widget.trackableItem.rating.value.toDouble();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.tag.selected = !widget.tag.selected;
          widget.onValueChanged(widget.tag);
        });
      },
      // The custom button
      child: Card(
        color: widget.tag.selected
            ? AppColors.colorCloseLight
            : AppColors.colorSymptomsGridBg,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: ScreenConstant.spacingAllSmall,
          child: Text(
            widget.tag.value.tr,
            textAlign: TextAlign.center,
            //overflow: TextOverflow.ellipsis,
            style: TextStyles.textStyleRegular
                .apply(color: Colors.white, fontSizeDelta: -2),
          ),
        ),
      ),
    );
  }
}
