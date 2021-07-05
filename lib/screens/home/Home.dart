import 'package:flutter/material.dart';
import 'package:flutter_ibs/controllers/home/HomeController.dart';
import 'package:flutter_ibs/utils/Assets.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/DummyData.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  final _controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorHomeBg,
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_outlined,
                  color: AppColors.colorButton,
                ),
                onPressed: () {
                  _datePicker();
                }),
            // SizedBox(width: ScreenConstant.defaultWidthTen),
            Text(
              "fdgdfg",
              style: TextStyles.appBarTitle,
            ),
            IconButton(
                icon: Icon(Icons.arrow_forward_ios_outlined,
                    color: AppColors.colorButton),
                onPressed: () {
                  _datePicker();
                }),
          ],
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: ScreenConstant.defaultWidthTwenty),
            child: Image.asset(
              Assets.settings,
              width: ScreenConstant.defaultWidthTwenty,
            ),
          )
        ],
      ),
      body: ListView(
        padding: ScreenConstant.spacingAllLarge,
        children: [
          SizedBox(height: ScreenConstant.defaultHeightFifteen),
          _buildTrackAndLogBar(),
          SizedBox(height: ScreenConstant.defaultHeightTwentyThree),
          Obx(() => _controller.selectedDailyLogin.value
              ? _buildDailyLogList()
              : _buildTrackList())
        ],
      ),
    );
  }

  _buildTrackAndLogBar() {
    return Obx(() => Row(children: [
          Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
              color: Colors.white,
            ),
            child: Container(
              height: ScreenConstant.defaultHeightForty * 1.2,
              width: ScreenConstant.defaultWidthOneSeventy,
              decoration: BoxDecoration(
                color: _controller.selectedDailyLogin.value
                    ? Colors.white
                    : AppColors.colorButton,
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
              ),
              child: GestureDetector(
                  onTap: () {
                    _controller.selectedDailyLogin.value = false;
                  },
                  child: Align(
                      // alignment: Alignment(-1, 0),
                      child: Container(
                    width: 70,
                    height: ScreenConstant.defaultHeightForty * 1.2,
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    child: Text(
                      "Track",
                      style: TextStyles.textStyleRegular.apply(
                          color: _controller.selectedDailyLogin.value
                              ? Colors.black
                              : Colors.white,
                          fontSizeDelta: 2),
                    ),
                  ))),
            ),
          ),
          Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8)),
              color: Colors.white,
            ),
            child: Container(
              height: ScreenConstant.defaultHeightForty * 1.2,
              width: ScreenConstant.defaultWidthOneSeventy,
              decoration: BoxDecoration(
                color: _controller.selectedDailyLogin.value
                    ? AppColors.colorButton
                    : Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
              ),
              child: GestureDetector(
                onTap: () {
                  _controller.selectedDailyLogin.value = true;
                },
                child: Align(
                    child: Container(
                        width: 70,
                        height: ScreenConstant.defaultHeightForty * 1.2,
                        color: Colors.transparent,
                        alignment: Alignment.center,
                        child: Text("Daily Log",
                            style: TextStyles.textStyleRegular.apply(
                                color: _controller.selectedDailyLogin.value
                                    ? AppColors.white
                                    : Colors.black,
                                fontSizeDelta: 2)))),
              ),
            ),
          ),
        ]));
  }

  _buildTrackList() {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: DummyData.trackFlow.length,
      itemBuilder: (BuildContext context, int index) {
        var model = DummyData.trackFlow[index];
        return Container(
          height: ScreenConstant.defaultHeightSeventy,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(12)),
          child: Row(
            children: [
              Container(
                padding: ScreenConstant.spacingAllLarge,
                height: ScreenConstant.defaultHeightSeventy,
                decoration: BoxDecoration(
                    color: AppColors.colorYesButton,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomLeft: Radius.circular(12),
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                child: Image.asset(model.image),
              ),
              SizedBox(width: ScreenConstant.defaultWidthTen),
              Text(model.text,
                  style: TextStyles.textStyleRegular
                      .apply(fontSizeDelta: 2, color: Colors.black))
            ],
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) =>
          SizedBox(height: ScreenConstant.defaultHeightTen),
    );
  }

  _buildDailyLogList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.maxFinite,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12), topRight: Radius.circular(12))),
          height: ScreenConstant.defaultHeightSeventy,
          padding: ScreenConstant.spacingAllLarge,
          child: Text("Treatment Plan :",
              textAlign: TextAlign.start,
              style: TextStyles.textStyleRegular
                  .apply(fontSizeDelta: 2, color: Colors.black)),
        ),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: DummyData.trackFlow.length,
          itemBuilder: (BuildContext context, int index) {
            var model = DummyData.trackFlow[index];
            return Container(
              height: ScreenConstant.defaultHeightSeventy,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  )),
              child: Row(
                children: [
                  Container(
                    padding: ScreenConstant.spacingAllLarge,
                    height: ScreenConstant.defaultHeightSeventy,
                    child: Image.asset(model.image,
                        color: AppColors.colorYesButton),
                  ),
                  SizedBox(width: ScreenConstant.defaultWidthTen),
                  Text(model.text,
                      style: TextStyles.textStyleRegular
                          .apply(fontSizeDelta: 2, color: Colors.black))
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  _datePicker() {
    return showDatePicker(
    
      context: Get.context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1970),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.dark(
              primary: Colors.deepPurple,
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: AppColors.colorButton,
            ),
            dialogBackgroundColor: Colors.white,
          ),
          child: child,
        );
      },
      lastDate: DateTime(2100),
    );
  }
}
