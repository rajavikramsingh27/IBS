
import 'package:flutter/material.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';

class TreatmentPlanListItem extends StatelessWidget {
final title;
final onPressed;
TreatmentPlanListItem(this.title, this.onPressed);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: ScreenConstant.spacingAllSmall,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.colorBorder, width: 1)),
      child: ListTile(
        dense: true,
        contentPadding: EdgeInsets.zero,
        title: Padding(
          padding: EdgeInsets.only(left: ScreenConstant.sizeXXL),
          child: Text(
            title??"",
            style: TextStyles.textStyleIntroDescription
                .apply(color: Colors.black, fontSizeDelta: -6),
          ),
        ),
        trailing: Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.colorArrowButton, width: 1)),
          child: IconButton(
            visualDensity: VisualDensity(horizontal: -4, vertical: -4),
            icon: Icon(
              Icons.arrow_forward_ios_outlined,
              color: AppColors.colorArrowButton,
              size: FontSize.s14,
            ),
            onPressed: onPressed,
          ),
        ),
      ),
    );
  }
}
