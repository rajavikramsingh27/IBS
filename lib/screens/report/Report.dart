import 'package:flutter/material.dart';
import 'package:flutter_ibs/routes/RouteConstants.dart';
import 'package:flutter_ibs/utils/Assets.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/CustomBottomNavigation.dart';
import 'package:flutter_ibs/widget/Indicator.dart';
import 'package:get/get.dart';

class Report extends StatefulWidget {
  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {
  PageController _pageController = PageController(initialPage: 0);
  int selectedindex = 0;
  double currentPage = 0;

  @override
  void initState() {
    super.initState();

    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorTracBg,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "REPORTS",
          style: TextStyles.appBarTitle,
        ),
        actions: [
          InkWell(
            onTap: () => Get.toNamed(settings),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: ScreenConstant.defaultWidthTwenty),
              child: Image.asset(
                Assets.settings,
                width: ScreenConstant.defaultWidthTwenty,
              ),
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          ListView(
            physics: ClampingScrollPhysics(),
            children: [
              Container(
                height: context.mediaQuerySize.height,
                child: PageView.builder(
                    physics: BouncingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        selectedindex = page;
                      });
                    },
                    itemCount: 3,
                    itemBuilder: (BuildContext _, int index) {
                      return _buildReport(index);
                    }),
              )
            ],
          ),
          Positioned(
              bottom: 0, left: 0, right: 0, child: CustomBottomNavigation()),
        ],
      ),
    );
  }

  _buildReport(int index) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: ScreenConstant.defaultHeightForty),
        Center(
            child: Image.asset("assets/images/report/report$index.png",
                width: ScreenConstant.defaultHeightTwoHundredTen)),
        SizedBox(height: ScreenConstant.defaultHeightForty),
        Text(
            index == 0
                ? "Keep Tracking!"
                : index == 1
                    ? "Uniquely Yours"
                    : "Great Start!",
            style: TextStyles.textStyleIntroDescription
                .apply(color: Colors.black)),
        SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
        Padding(
          padding: ScreenConstant.spacingAllLarge,
          child: Card(
            elevation: 0,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: ScreenConstant.spacingAllLarge,
              child: Column(
                children: [
                  Text(
                    index == 0
                        ? '''After 5 days of tracking you will start to see\nReports of your symptoms here.\n\nKeep up the great work!'''
                        : index == 1
                            ? '''Your reports will show your unique experience of IBS and are a part of helping you understand and communcate your symptoms with your Health care provider.'''
                            : '''Did you know that keeping track of your IBS Symptoms and contributing factors like food, stress and exercise is the first step towards managing your IBS?''',
                    style: TextStyles.textStyleRegular,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
                  Indicator(
                    controller: _pageController,
                    itemCount: 3,
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
