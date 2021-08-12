library custom_check_box;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ibs/utils/Assets.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';

class CustomCheckBox extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color checkedIconColor;
  final Color checkedFillColor;
  final IconData checkedIcon;
  final Color uncheckedIconColor;
  final Color uncheckedFillColor;
  final IconData uncheckedIcon;
  final double borderWidth;
  final bool shouldShowBorder;
  final Color borderColor;
  final double borderRadius;

  const CustomCheckBox({
    Key key,
    this.value,
    this.onChanged,
    this.checkedIconColor = Colors.white,
    this.checkedFillColor = AppColors.colorCloseLight,
    this.checkedIcon = Icons.check,
    this.uncheckedIconColor = Colors.white,
    this.uncheckedFillColor = Colors.white,
    this.uncheckedIcon = Icons.close,
    this.borderWidth,
    this.shouldShowBorder = false,
    this.borderColor,
    this.borderRadius,
  }) : super(key: key);

  @override
  _CustomCheckBoxState createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool _checked;
  CheckStatus _status;

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  void didUpdateWidget(CustomCheckBox oldWidget) {
    super.didUpdateWidget(oldWidget);
    _init();
  }

  void _init() {
    _checked = widget.value;
    if (_checked) {
      _status = CheckStatus.checked;
    } else {
      _status = CheckStatus.unchecked;
    }
  }

  Widget _buildIcon() {
    Color fillColor;
    Color iconColor;

    switch (_status) {
      case CheckStatus.checked:
        fillColor = widget.checkedFillColor;
        iconColor = widget.checkedIconColor;
        break;
      case CheckStatus.unchecked:
        fillColor = widget.uncheckedFillColor;
        iconColor = widget.uncheckedIconColor;
        break;
    }

    return Container(
      height: ScreenConstant.defaultHeightTwenty,
      width: ScreenConstant.defaultWidthTwenty,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius:
            BorderRadius.all(Radius.circular(widget.borderRadius ?? 4)),
        border: Border.all(
          color: widget.shouldShowBorder
              ? (widget.borderColor ??
                  AppColors.colorBackground.withOpacity(0.19))
              : (!widget.value
                  ? (widget.borderColor ??
                      AppColors.colorBackground.withOpacity(0.19))
                  : AppColors.colorBackground.withOpacity(0.19)),
          width: widget.shouldShowBorder ? widget.borderWidth ?? 2.0 : 1.0,
        ),
      ),
      child: Image.asset(
        Assets.check,
        color: iconColor,
        height: 8,
        width: 8,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: _buildIcon(),
      onPressed: () {
        setState(() {
          widget.onChanged(!_checked);
        });
      },
    );
  }
}

enum CheckStatus {
  checked,
  unchecked,
}
