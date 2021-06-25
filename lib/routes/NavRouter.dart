import 'package:flutter/cupertino.dart';
import 'package:flutter_ibs/screens/my_profile/MyProfileStep1.dart';
import 'package:flutter_ibs/screens/my_profile/MyProfileStep2.dart';
import 'package:flutter_ibs/splash.dart';
import 'package:get/get.dart';

import 'RouteConstants.dart';
import 'package:flutter_ibs/screens/Intro.dart';

class NavRouter {
  static final generateRoute = [
    GetPage(
      name: splash,
      page: () => Splash(),
    ),
    GetPage(
      name: intro,
      page: () => Intro(),
    ),
    GetPage(
      name: myprofile,
      page: () => SafeArea(
        child: MyProfileStep1(),
      ),
    ),
    GetPage(
      name: myprofile2,
      page: () => SafeArea(
        child: MyProfileStep2(),
      ),
    ),
  ];
}
