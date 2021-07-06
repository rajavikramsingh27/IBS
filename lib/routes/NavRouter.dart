import 'package:flutter/cupertino.dart';
import 'package:flutter_ibs/screens/home/Home.dart';
import 'package:flutter_ibs/screens/my_profile/MyProfileStep1.dart';
import 'package:flutter_ibs/screens/my_profile/MyProfileStep2.dart';
import 'package:flutter_ibs/screens/my_profile/MyProfileStep3.dart';
import 'package:flutter_ibs/screens/signup/SignupStep1.dart';
import 'package:flutter_ibs/screens/signup/SignupStep2.dart';
import 'package:flutter_ibs/screens/signup/SignupStep3.dart';
import 'package:flutter_ibs/screens/symptoms/Symptoms.dart';
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
      page: () => MyProfileStep1(),
    ),
    GetPage(
      name: myprofile2,
      page: () => MyProfileStep2(),
    ),
     GetPage(
      name: myprofile3,
      page: () => MyProfileStep3(),
    ),
    GetPage(
      name: signup,
      page: () => SignupStep1(),
    ),
    GetPage(
      name: signup2,
      page: () => SignupStep2(),
    ),
    GetPage(
      name: signup3,
      page: () => SignupStep3(),
    ),
     GetPage(
      name: home,
      page: () => Home(),
    ),
    GetPage(
      name: symptoms,
      page: () => Symptoms(),
    ),
  ];
}
