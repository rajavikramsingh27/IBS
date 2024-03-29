import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ibs/controllers/journal/JournalController.dart';
import 'package:flutter_ibs/controllers/trackables/TrackablesController.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/CustomArcPainter.dart';
import 'package:flutter_ibs/widget/CustomElevatedButton.dart';
import 'package:flutter_ibs/widget/DateTimeCardWidget.dart';
import 'package:flutter_ibs/widget/OvalPainterWidget.dart';
import 'package:flutter_ibs/widget/WavePainter.dart';
import 'package:flutter_ibs/widget/utils.dart';
import 'package:get/get.dart';

class Journal extends StatelessWidget {
  final JournalController _journalController = Get.find();
  final TrackablesController _trackablesController = Get.find();

  @override
  Widget build(BuildContext context) {
    return /* Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(height: ScreenConstant.defaultHeightTen),
            _journalController.loader.value
                ? Offstage()
                : CustomElevatedButton(
                    widthFactor: 0.7,
                    text: "Save",
                    onTap: _journalController.onSave),
            TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text("Cancel",
                    style: TextStyles.textStyleIntroDescription.apply(
                      color: AppColors.colorskip_also_proceed,
                    )))
          ],
        ),
      ),
      backgroundColor: Color(0xff1A103E).withOpacity(0.6),
      body:*/ InkWell(
        onTap: () => dismissKeyboard(context),
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: [
            Padding(
              padding:
                  EdgeInsets.only(top: ScreenConstant.defaultHeightOneThirty),
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: ScreenConstant.defaultHeightTwenty),
                    child: Card(
                      margin: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      )),
                      child: Column(
                        children: [
                          SizedBox(height: ScreenConstant.defaultHeightSixty),
                          Text(
                            _trackablesController.journal.value.header.tr,
                            style: TextStyles.textStyleIntroDescription
                                .apply(color: Colors.black, fontSizeDelta: -2),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: ScreenConstant.defaultHeightForty),
                          DateTimeCardWidget(),
                          SizedBox(height: ScreenConstant.defaultHeightForty),
                          Stack(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                  left: ScreenConstant.defaultWidthTwenty,
                                  right: ScreenConstant.defaultWidthTwenty,
                                  bottom: ScreenConstant.defaultHeightForty,
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                                child: _buildJournal(),
                              ),
                            ],
                          ),
                          Text(
                            '''Click “Save” to log your journal entry''',
                            textAlign: TextAlign.center,
                            style: TextStyles.textStyleRegular,
                          ),
                          SizedBox(
                              height: ScreenConstant.defaultHeightTwentyFour),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(height: ScreenConstant.defaultHeightTen),
                              _journalController.loader.value
                                  ? Offstage()
                                  : CustomElevatedButton(
                                  widthFactor: 0.7,
                                  text: "Save",
                                  onTap: _journalController.onSave),
                              TextButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: Text("Cancel",
                                      style: TextStyles.textStyleIntroDescription.apply(
                                        color: AppColors.colorskip_also_proceed,
                                      )))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(right: 0, left: 0, child: CustomArcPainter())
                ],
              ),
            ),
          ],
        ),
      );
  }

  _buildJournal() {
    return Stack(
      children: [
        Card(
          margin: EdgeInsets.zero,
          color: AppColors.colorBackground,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(height: ScreenConstant.defaultHeightForty),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: ScreenConstant.sizeExtraLarge),
                    child: Text(
                        _trackablesController.journal.value.items.first.name.tr,
                        textAlign: TextAlign.center,
                        style: TextStyles.textStyleIntroDescription
                            .apply(color: Colors.white, fontSizeDelta: -3)),
                  ),
                  SizedBox(height: ScreenConstant.defaultHeightTwenty * 1.6),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: ScreenConstant.sizeExtraLarge),
                    child: Text(
                      "${_trackablesController.journal.value.items.first.description.tr ?? ""}",
                      textAlign: TextAlign.center,
                      style: TextStyles.textStyleRegular
                          .apply(color: AppColors.colorSkipButton),
                    ),
                  ),
                  Padding(
                    padding: ScreenConstant.spacingAllMedium,
                    child: Card(
                      shadowColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      child: TextFormField(
                        controller: _journalController.noteTextController,
                        inputFormatters: <TextInputFormatter>[
                          LengthLimitingTextInputFormatter(500)
                        ],

                        decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: ScreenConstant.defaultWidthTen,
                                vertical: ScreenConstant.defaultHeightTen)),
                        textInputAction: TextInputAction.newline,
                        maxLines: 10,
                        minLines: 6,
                        // maxLength: 100,
                        // decoration: hintedInputDecoration(""),
                      ),
                    ),
                  ),
                  SizedBox(height: ScreenConstant.defaultHeightForty),
                ],
              ),
              Container(
                height: ScreenConstant.defaultHeightOneHundred,
                child: OvalPainterWidget(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  _buildWavePainter() {
    return Container(
      margin: EdgeInsets.only(top: ScreenConstant.defaultHeightTwenty * 1.5),
      width: Get.context.mediaQuerySize.width,
      child: CustomPaint(
        size: Size(Get.context.mediaQuerySize.width,
            Get.context.mediaQuerySize.height),
        painter: WavePainter(),
      ),
    );
  }
}
