import 'package:flutter/material.dart';
import 'package:flutter_ibs/controllers/home/HomeController.dart';
import 'package:flutter_ibs/routes/RouteConstants.dart';
import 'package:flutter_ibs/utils/Assets.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/DummyData.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/BottomTabPainter.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  final _controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorHomeBg,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(ScreenConstant.defaultHeightTwoHundred),
        child: AppBar(
          flexibleSpace: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                (_controller.formattedTime.value >= 5 &&
                        _controller.formattedTime.value < 12)
                    ? Assets.morning
                    : (_controller.formattedTime.value >= 12 &&
                            _controller.formattedTime.value < 18)
                        ? Assets.afternoon
                        : (_controller.formattedTime.value >= 18 &&
                                _controller.formattedTime.value < 22)
                            ? Assets.evening
                            : Assets.night,
                fit: BoxFit.fill,
              ),
              Positioned(
                  bottom: ScreenConstant.defaultHeightTwenty,
                  left: ScreenConstant.defaultWidthTwenty,
                  child: Container(
                    padding: ScreenConstant.spacingAllDefault,
                    decoration: BoxDecoration(
                      color: AppColors.colorHomeCard,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(16),
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16)),
                    ),
                    child: Text(
                      (_controller.formattedTime.value >= 5 &&
                              _controller.formattedTime.value < 12)
                          ? "Good Morning"
                          : (_controller.formattedTime.value >= 12 &&
                                  _controller.formattedTime.value < 18)
                              ? "Good Afternoon"
                              : (_controller.formattedTime.value >= 18 &&
                                      _controller.formattedTime.value < 22)
                                  ? "Good Evening"
                                  : "Good Night",
                      style: TextStyles.textStyleIntroDescription
                          .apply(fontSizeDelta: -4, color: Colors.white),
                    ),
                  ))
            ],
          ),
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
          automaticallyImplyLeading: false,
        ),
      ),

      // bottomNavigationBar: Padding(
      //     padding: const EdgeInsets.all(8.0),
      //     child: SizedBox(
      //         height: ScreenConstant.defaultHeightNinety,
      //         child: Card(
      //           elevation: 0,
      //           color: Colors.white,
      //           shape: RoundedRectangleBorder(
      //               borderRadius: BorderRadius.circular(24)),
      //           child: Wrap(
      //               direction: Axis.horizontal,
      //               alignment: WrapAlignment.spaceAround,
      //               runAlignment: WrapAlignment.spaceAround,
      //               children: [
      //                 Column(
      //                   children: [
      //                     Image.asset(
      //                       Assets.treatPlans,
      //                       fit: BoxFit.fill,
      //                       width: ScreenConstant.defaultWidthTen * 1.5,
      //                     ),
      //                     SizedBox(height: ScreenConstant.defaultHeightTen),
      //                     Text(
      //                       "Treatment \nPlans",
      //                       style: TextStyles.textStylebottom,
      //                       textAlign: TextAlign.center,
      //                     )
      //                   ],
      //                 ),
      //                 InkWell(
      //                   onTap: () {},
      //                   child: Column(
      //                     children: [
      //                       Image.asset(Assets.report,
      //                           fit: BoxFit.fill,
      //                           width: ScreenConstant.defaultWidthTen * 1.8),
      //                       SizedBox(height: ScreenConstant.defaultHeightTen),
      //                       Text(
      //                         "Reports",
      //                         style: TextStyles.textStylebottom,
      //                       )
      //                     ],
      //                   ),
      //                 ),
      //                 Column(
      //                   children: [
      //                     Image.asset(Assets.track,
      //                         fit: BoxFit.fill,
      //                         width: ScreenConstant.defaultWidthTen * 1.8),
      //                     SizedBox(height: ScreenConstant.defaultHeightTen),
      //                     Text(
      //                       "Track",
      //                       style: TextStyles.textStylebottom,
      //                     )
      //                   ],
      //                 ),
      //                 InkWell(
      //                   onTap: () {},
      //                   child: Column(children: [
      //                     Image.asset(Assets.resources,
      //                         fit: BoxFit.fill,
      //                         width: ScreenConstant.defaultWidthTwenty),
      //                     SizedBox(height: ScreenConstant.defaultHeightTen),
      //                     Text(
      //                       "Resources",
      //                       style: TextStyles.textStylebottom,
      //                     )
      //                   ]),
      //                 ),
      //                 Column(children: [
      //                   Image.asset(Assets.profile,
      //                       fit: BoxFit.fill,
      //                       width: ScreenConstant.defaultWidthTwenty),
      //                   SizedBox(height: ScreenConstant.defaultHeightTen),
      //                   Text(
      //                     "My IBS",
      //                     style: TextStyles.textStylebottom,
      //                   )
      //                 ])
      //               ]),
      //         ))),
      body: Stack(
        children: [
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            margin: EdgeInsets.zero,
            clipBehavior: Clip.antiAlias,
            color: AppColors.colorTracBg,
            child: ListView(
              physics: ClampingScrollPhysics(),
              padding: ScreenConstant.spacingAllLarge,
              children: [
                SizedBox(height: ScreenConstant.defaultHeightFifteen),
                _buildTrackAndLogBar(),
                SizedBox(height: ScreenConstant.defaultHeightTwentyThree),
                Obx(() => _controller.selectedDailyLogin.value
                    ? _buildDailyLogList()
                    : _buildTrackList()),
                SizedBox(height: ScreenConstant.defaultHeightOneHundred),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              width: context.mediaQuerySize.width,
              height: Get.context.mediaQuerySize.height * 0.13,
              child: Stack(
                children: [
                  CustomPaint(
                      painter: BottomTabPainter(),
                      size: Size(Get.context.mediaQuerySize.width,
                          Get.context.mediaQuerySize.height * 0.13)),
                  Center(
                      heightFactor: 1.5,
                      child: FloatingActionButton(
                        onPressed: () {},
                        child: _buildMiddleTabItem(),
                      )),
                  Positioned(
                    bottom: 0, right: 0, left: 0,
                    // height: Get.context.mediaQuerySize.height * 0.12,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: ScreenConstant.defaultHeightTen),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.ideographic,
                          children: [
                            _buildTabItem(
                                title: "Treatment\nPlans",
                                imageText: Assets.treatPlans),
                            _buildTabItem(
                                title: "Reports", imageText: Assets.report),
                            Container(
                                width: context.mediaQuerySize.width * 0.13),
                            _buildTabItem(
                                title: "Resources",
                                imageText: Assets.resources),
                            _buildTabItem(
                                title: "My IBS", imageText: Assets.profile),
                          ]),
                    ),
                  )
                ],
              ),
            ),
          ),
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
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8)),
                color: AppColors.colorHomeTabBg),
            child: Container(
              height: ScreenConstant.defaultHeightForty * 1.2,
              width: ScreenConstant.defaultWidthOneSeventy,
              decoration: BoxDecoration(
                color: _controller.selectedDailyLogin.value
                    ? AppColors.colorHomeTabBg
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
              color: AppColors.colorHomeTabBg,
            ),
            child: Container(
              height: ScreenConstant.defaultHeightForty * 1.2,
              width: ScreenConstant.defaultWidthOneSeventy,
              decoration: BoxDecoration(
                color: _controller.selectedDailyLogin.value
                    ? AppColors.colorButton
                    : AppColors.colorHomeTabBg,
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
        return GestureDetector(
          onTap: () => _navigateToScreen(index),
          child: Container(
            height: ScreenConstant.defaultHeightSeventy,
            padding: ScreenConstant.spacingAllDefault,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12)),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  // padding: ScreenConstant.spacingAllMedium,
                  // height: ScreenConstant.defaultHeightSeventy,
                  // decoration: BoxDecoration(
                  backgroundColor: AppColors.colorArrowButton.withOpacity(0.1),
                  // borderRadius: BorderRadius.circular(50)),
                  child: Image.asset(model.image,
                      width: ScreenConstant.defaultWidthTwenty
                      // color: AppColors.colorArrowButton,
                      ),
                ),
                SizedBox(width: ScreenConstant.defaultWidthTen),
                Text(model.text,
                    style: TextStyles.textStyleRegular
                        .apply(fontSizeDelta: 2, color: Colors.black)),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: AppColors.colorArrowButton,
                  size: FontSize.s12,
                ),
                SizedBox(width: ScreenConstant.defaultWidthTen),
              ],
            ),
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
                  color: index.isEven ? AppColors.colorCardSeen : Colors.white,
                  // borderRadius: BorderRadius.all(
                  //   Radius.circular(12),
                  // ),
                ),
                child: ListTile(
                    dense: true,
                    leading: Container(
                      // padding: ScreenConstant.spacingAll,
                      height: ScreenConstant.defaultHeightSeventy,
                      child: Image.asset(
                        model.image,
                        width: ScreenConstant.defaultWidthTwenty,
                      ),
                    ),
                    title: Text(model.text,
                        style: TextStyles.textStyleRegular
                            .apply(fontSizeDelta: 2, color: Colors.black)),
                    subtitle: Text(model.text,
                        style: TextStyles.textStyleRegular.apply(
                            fontSizeDelta: -2,
                            color: Colors.black.withOpacity(0.54))),
                    trailing: Image.asset(Assets.edit,
                        width: ScreenConstant.defaultWidthTen * 1.2))

                // Row(
                //   children: [
                //     Container(
                //       padding: ScreenConstant.spacingAllLarge,
                //       height: ScreenConstant.defaultHeightSeventy,
                //       child: Image.asset(model.image
                //           ),
                //     ),
                //     SizedBox(width: ScreenConstant.defaultWidthTen),
                //     Text(model.text,
                //         style: TextStyles.textStyleRegular
                //             .apply(fontSizeDelta: 2, color: Colors.black))
                //   ],
                // ),
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

  _navigateToScreen(int index) {
    switch (index) {
      case 0:
        return Get.toNamed(symptoms);
        break;
          case 1:
        return Get.toNamed(bowel);
        break;

      default:
        return;
    }
  }

  Widget _buildTabItem({
    String title,
    String imageText,
    int index,
    ValueChanged<int> onPressed,
  }) {
    Color color = _controller.selectedIndex.value == index
        ? AppColors.colorArrowButton
        : AppColors.colorBackground;
    return InkWell(
      onTap: () => onPressed(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            imageText,
            fit: BoxFit.fill,
            width: ScreenConstant.defaultWidthTen * 1.5,
          ),
          SizedBox(height: ScreenConstant.defaultHeightTen),
          Text(
            title,
            style: TextStyles.textStylebottom,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

  Widget _buildMiddleTabItem() {
    return CircleAvatar(
      radius: 37,
      backgroundColor: AppColors.colorTrackButton,
      child: CircleAvatar(
        radius: 30,
        backgroundColor: AppColors.colorArrowButton,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              Assets.track,
              fit: BoxFit.fill,
              width: ScreenConstant.defaultWidthTen * 1.5,
            ),
            SizedBox(height: ScreenConstant.defaultHeightTen),
            Text(
              "Track",
              style: TextStyles.textStylebottom.apply(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
