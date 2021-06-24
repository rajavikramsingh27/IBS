


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
    // GetPage(
    //   name: signUp,
    //   page: () => SignUp(),
    // ),
    // GetPage(
    //   name: home,
    //   page: () => Home(),
    // ),
   

  ];
}

