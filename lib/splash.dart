import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ibs/routes/RouteConstants.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:get/get.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Get.offAndToNamed(intro);
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenConstant.setScreenAwareConstant(context);
    return Container(
        color: AppColors.colorBackground,
        child: Center(
          child: Image.asset("assets/images/intro/intro0.png"),
        ));
  }
}
