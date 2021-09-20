import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ibs/routes/RouteConstants.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:get/get.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';

class Intro extends StatefulWidget {
  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  final arrIntroText = [
    'This Irritable Bowel Syndrome app is brought to you by the',
    'Easily track your IBS symptoms',
    'Learn what triggers your IBS',
    'Access the latest IBS research',
    'Share your findings with health care providers ',
  ];

  final _pageController = PageController();
  final _currentPageNotifier = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorBackground,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          brightness: Brightness.light,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          /*Positioned(
              top: 0,
              child: Image.asset(
                "assets/images/intro/curl1.png",
                height: Get.mediaQuery.size.height / 4,
              )),
          Positioned(
              bottom: 0,
              child: Image.asset(
                "assets/images/intro/curl2.png",
                width: Get.mediaQuery.size.width / 3,
              )),
          Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(
                "assets/images/intro/curl3.png",
                height: Get.mediaQuery.size.height / 2,
              )),*/
          Padding(
              padding: EdgeInsets.only(
                  top: context.mediaQuerySize.width > 400
                      ? ScreenConstant.defaultHeightOneHundred * 1.2
                      : ScreenConstant.defaultHeightSeventy),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      _buildPageView(),
                      SizedBox(height: ScreenConstant.sizeExtraLarge),
                      _buildCircleIndicator(),
                    ],
                  ),
                  SafeArea(
                    child: Column(
                      children: [
                        _getStartedButton(),
                        SizedBox(height: ScreenConstant.defaultHeightTwenty),
                        InkWell(
                          onTap: () => Get.toNamed(signIn),
                          child: RichText(
                            text: TextSpan(
                              text: 'Have an Account? ',
                              style: TextStyles.textStyleIntroDescription.apply(
                                  fontSizeDelta: -3,
                                  color: Colors.white.withOpacity(0.36)),
                              children: <TextSpan>[
                                TextSpan(
                                 // recognizer: TapGestureRecognizer()
                                //    ..onTap = () => Get.toNamed(signIn),
                                  text: 'Log in',
                                  style: TextStyles.textStyleIntroDescription
                                      .apply(
                                          fontSizeDelta: -2, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 40),
                      ],
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }

  _buildPageView() {
    return Container(
      height: 380,
      child: PageView.builder(
          itemCount: arrIntroText.length,
          controller: _pageController,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Container(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: Center(
                    child: Column(
                  children: [
                    Image.asset(
                      "assets/images/intro/intro$index.png",
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 20),
                    Text(
                      arrIntroText[index],
                      textAlign: TextAlign.center,
                      style: TextStyles.textStyleIntroDescription.apply(
                          fontSizeDelta: -4,
                          color: Colors.white.withOpacity(0.9)),
                    ),
                    SizedBox(height: 30),
                    SizedBox(
                      height: ScreenConstant.defaultHeightSixteen * 3,
                      child: Card(
                        color: AppColors.colorDot,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                                "assets/images/intro/candian_symbol.png",
                                width: 12,
                                height: 12),
                            SizedBox(width: ScreenConstant.defaultWidthTen),
                            Text(
                              "Canadian Digestive Health Information",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
              );
            } else {
              return Container(
                child: Center(
                    child: Stack(
                  children: [
                    Image.asset(
                      "assets/images/intro/intro$index.png",
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      bottom: ScreenConstant.defaultHeightSixteen * 3,
                      // left: ScreenConstant.screenWidthFifth,
                      // right: ScreenConstant.screenWidthFifth,

                      left: 70,
                      right: 70,

                      child: Text(
                        arrIntroText[index],
                        maxLines: 3,
                        textAlign: TextAlign.center,
                        style: TextStyles.textStyleIntroDescription,
                      ),
                    )
                  ],
                )),
              );
            }
          },
          onPageChanged: (int index) {
            _currentPageNotifier.value = index;
          }),
    );
  }

  _buildCircleIndicator() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: CirclePageIndicator(
        dotSpacing: 14,
        size: 8,
        selectedSize: 16,
        borderWidth: 7,
        // borderColor: Colors.red,
        dotColor: AppColors.colorDotNotFocused,
        selectedDotColor: AppColors.white,
        selectedBorderColor: AppColors.colorDot,
        itemCount: arrIntroText.length,
        currentPageNotifier: _currentPageNotifier,
      ),
    );
  }

  _getStartedButton() {
    return ElevatedButton(
      onPressed: () {
        Get.toNamed(myprofile);
      },
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(
              horizontal: ScreenConstant.defaultWidthSixty,
              vertical: ScreenConstant.defaultHeightSixteen),
          onPrimary: AppColors.colorDot,
          primary: AppColors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
      child: Text(
        "Get Started",
        textAlign: TextAlign.center,
        style: TextStyles.textStyleIntroDescription.apply(fontSizeDelta: -3),
      ),
    );
  }
}
