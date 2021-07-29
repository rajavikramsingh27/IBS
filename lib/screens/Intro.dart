import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ibs/routes/RouteConstants.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/Indicator.dart';
import 'package:get/get.dart';

class Intro extends StatefulWidget {
  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  PageController _pageController = PageController(initialPage: 0);
  double currentPage = 0;
  int selectedindex = 0;

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
      backgroundColor: AppColors.colorBackground,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
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
              )),
          Padding(
            padding: EdgeInsets.only(
                top: context.mediaQuerySize.width > 400
                    ? ScreenConstant.defaultHeightOneHundred * 1.2
                    : ScreenConstant.defaultHeightSeventy),
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  selectedindex = page;
                });
              },
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: ScreenConstant.defaultWidthTwenty),
                          child: Center(
                            child: AspectRatio(
                              aspectRatio: 01,
                              child: Align(
                                alignment: Alignment(0, -1.5),
                                child: AspectRatio(
                                  aspectRatio: index == 0 ? 1.35 : 0.8,
                                  child: Image.asset(
                                    "assets/images/intro/intro$index.png",
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        _getPageByIndex(index)
                      ],
                    ),
                    SizedBox(
                        height: context.mediaQuerySize.width >= 400
                            ? ScreenConstant.defaultHeightTwentyFour
                            : ScreenConstant.defaultHeightSixteen),
                    Indicator(
                      controller: _pageController,
                      itemCount: 5,
                    ),
                    SizedBox(
                        height: context.mediaQuerySize.width >= 400
                            ? ScreenConstant.defaultHeightOneHundred
                            : ScreenConstant.defaultHeightSeventy),
                    _getStartedButton(),
                    SizedBox(height: ScreenConstant.defaultHeightTen),
                    RichText(
                      text: TextSpan(
                        text: 'Have an Account? ',
                        style: TextStyles.textStyleIntroDescription.apply(
                            fontSizeDelta: -3,
                            color: Colors.white.withOpacity(0.36)),
                        children: <TextSpan>[
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => print('Tap Here onTap'),
                            text: 'Log in',
                            style: TextStyles.textStyleIntroDescription
                                .apply(fontSizeDelta: -3, color: Colors.white),
                          ),
                        ],
                      ),
                    )
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }

  _getPageByIndex(int index) {
    switch (index) {
      case 0:
        return Positioned(
          bottom: 10,
          left: ScreenConstant.screenWidthThirteen,
          right: ScreenConstant.screenWidthThirteen,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "This Irritable Bowel Syndrome app is brought to you by",
                textAlign: TextAlign.center,
                style: TextStyles.textStyleIntroDescription.apply(
                    fontSizeDelta: -4, color: Colors.white.withOpacity(0.9)),
              ),
              SizedBox(height: ScreenConstant.defaultHeightTwenty),
              SizedBox(
                height: ScreenConstant.defaultHeightSixteen * 3,
                child: Card(
                  color: AppColors.colorDot,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset("assets/images/intro/candian_symbol.png",
                          width: 12, height: 12),
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
          ),
        );
        break;
      case 1:
        return Positioned(
          bottom: ScreenConstant.defaultHeightSixteen * 3,
          left: ScreenConstant.screenWidthFifth,
          right: ScreenConstant.screenWidthFifth,
          child: Text(
            "Easily Track your IBS Symptoms",
            maxLines: 3,
            textAlign: TextAlign.center,
            style: TextStyles.textStyleIntroDescription,
          ),
        );
        break;
      case 2:
        return Positioned(
          bottom: ScreenConstant.defaultHeightSixteen * 3,
          left: ScreenConstant.screenWidthFifth,
          right: ScreenConstant.screenWidthFifth,
          child: Text(
            "Learn what triggers your IBS",
            maxLines: 3,
            textAlign: TextAlign.center,
            style: TextStyles.textStyleIntroDescription,
          ),
        );
        break;
      case 3:
        return Positioned(
          bottom: ScreenConstant.defaultHeightSixteen * 3,
          left: ScreenConstant.screenWidthFifth,
          right: ScreenConstant.screenWidthFifth,
          child: Text(
            "Access the latest IBS Research",
            maxLines: 3,
            textAlign: TextAlign.center,
            style: TextStyles.textStyleIntroDescription,
          ),
        );
        break;
      case 4:
        return Positioned(
          bottom: ScreenConstant.defaultHeightSixteen * 3,
          left: ScreenConstant.screenWidthFifth,
          right: ScreenConstant.screenWidthFifth,
          child: Text(
            "Share your findings with health care providers",
            maxLines: 3,
            textAlign: TextAlign.center,
            style: TextStyles.textStyleIntroDescription,
          ),
        );
        break;
      default:
        return Container();
    }
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
