import 'package:flutter/material.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:get/get.dart';

class LeadingBackButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
        return Navigator.canPop(context)? IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.white,
          ),
          color: AppColors.white,
          onPressed: () {
            Get.back();
          },
        ) : Offstage();

  }
}
