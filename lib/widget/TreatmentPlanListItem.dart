import 'package:flutter/material.dart';
import 'package:flutter_ibs/controllers/treatment_plan/TreatmentPlanController.dart';
import 'package:flutter_ibs/utils/Assets.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:get/get.dart';

class TreatmentPlanListItem extends StatelessWidget {
  final title;
  final tid;
  final onPressed;
  final TreatmentPlanController _treatmentPlanController = Get.find();

  TreatmentPlanListItem({this.title, this.onPressed, this.tid});

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
        contentPadding: ScreenConstant.spacingAllExtraSmall,
        leading: _treatmentPlanController.existTreatmentPlans.contains(tid)
            ? Container(
                height: ScreenConstant.sizeLarge,
                width: ScreenConstant.sizeLarge,
                decoration: new BoxDecoration(
                    color: Colors.orange,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(
                          Assets.MarkDone,
                        ),
                        fit: BoxFit.fill)),
              )
            : Offstage(),
        title: Center(
          child: Text(
            title ?? "",
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
