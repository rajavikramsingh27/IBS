import 'package:flutter/material.dart';
import 'package:flutter_ibs/utils/Assets.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:get/get.dart';

class CustomDialog extends StatelessWidget {
  final double height;
  final String title;
  final String description;

  const CustomDialog({Key key, this.height, this.title, this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildDialog();
  }

  _buildDialog() {
    return Material(
      type: MaterialType.transparency,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: ScreenConstant.defaultHeightTwenty),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16)),
                      ),
                      height: height,
                      margin: EdgeInsets.symmetric(
                          horizontal: ScreenConstant.defaultWidthTwenty),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: ScreenConstant.spacingAllLarge,
                            child: Text("$title",
                                textAlign: TextAlign.start,
                                style: TextStyles.textStyleIntroDescription
                                    .apply(color: Colors.black87)),
                          ),
                          SizedBox(height: ScreenConstant.defaultHeightFifteen),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: ScreenConstant.defaultWidthTwenty),
                            child: Text('''$description''',
                                textAlign: TextAlign.start,
                                style: TextStyles.textStyleRegular.apply(
                                    color: AppColors.colorDialogDescription)),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: ScreenConstant.screenHeightTwelve,
                      margin: EdgeInsets.symmetric(
                          horizontal: ScreenConstant.defaultWidthTwenty),

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(16),
                            bottomRight: Radius.circular(16)),
                        color: AppColors.colorBackground,
                      ),
                      child: Row(
                        children: [
                          Image.asset(Assets.curl6),
                          SizedBox(width: ScreenConstant.defaultWidthTwenty),
                          Image.asset(Assets.curl5)
                        ],
                      ),
                      // padding: ScreenConstant.spacingAllLarge,
                      // margin: ScreenConstant.spacingAllLarge,
                    )
                  ],
                ),
              ),
              Positioned(
                right: 10,
                top: 10,
                child: GestureDetector(
                  onTap: () => Get.back(),
                  child: CircleAvatar(
                    backgroundColor: AppColors.colorCloseLight,
                    radius: 20,
                    child: CircleAvatar(
                        backgroundColor: AppColors.colorCloseLight,
                        radius: 18,
                        child: Icon(
                          Icons.close,
                          color: Colors.white,
                          size: FontSize.s15,
                        )),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
