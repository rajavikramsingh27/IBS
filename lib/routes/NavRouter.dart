import 'package:flutter_ibs/screens/Intro.dart';
import 'package:flutter_ibs/screens/about_ibs/MyIbs.dart';
import 'package:flutter_ibs/screens/exercise/Exercise.dart';
import 'package:flutter_ibs/screens/home/Home.dart';
import 'package:flutter_ibs/screens/signIn/ForgotPassword.dart';
import 'package:flutter_ibs/screens/signIn/Login.dart';
import 'package:flutter_ibs/screens/signIn/Otp.dart';
import 'package:flutter_ibs/screens/signIn/ResetPassword.dart';
import 'package:flutter_ibs/screens/low_diet/LowDiet.dart';
import 'package:flutter_ibs/screens/my_profile/MyProfileStep1.dart';
import 'package:flutter_ibs/screens/my_profile/MyProfileStep2.dart';
import 'package:flutter_ibs/screens/my_profile/MyProfileStep3.dart';
import 'package:flutter_ibs/screens/report/Report.dart';
import 'package:flutter_ibs/screens/settings/Settings.dart';
import 'package:flutter_ibs/screens/signup/SignupStep1.dart';
import 'package:flutter_ibs/screens/signup/SignupStep2.dart';
import 'package:flutter_ibs/screens/signup/SignupStep3.dart';
import 'package:flutter_ibs/screens/sleep/Sleep.dart';
import 'package:flutter_ibs/screens/stress_management/TreatmentPlanListWidget.dart';
import 'package:flutter_ibs/screens/stress_management/TreatmentPlanListWidgetDetails.dart';
import 'package:flutter_ibs/screens/treatment_plans/TreatmentPlans.dart';
import 'package:flutter_ibs/splash.dart';
import 'package:get/get.dart';

import 'RouteConstants.dart';

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
      name: treatPlans,
      page: () => TreatmentPlans(),
    ),
    GetPage(
      name: stressManagement,
      page: () => TreatmentPlanListWidget(),
    ),
    GetPage(
      name: stressManagementDetails,
      page: () => TreatmentPlanListWidgetDetails(),
    ),
    GetPage(
      name: lowDiet,
      page: () => LowDiet(),
    ),
    GetPage(
      name: exercise,
      page: () => Exercise(),
    ),
    GetPage(
      name: sleep,
      page: () => Sleep(),
    ),
    GetPage(
      name: settings,
      page: () => Settings(),
    ),
    GetPage(
      name: myIbs,
      page: () => MyIbs(),
    ),
    GetPage(
      name: report,
      page: () => Report(),
    ),
    GetPage(
      name: signIn,
      page: () => SignIn(),
    ),
    GetPage(
      name: forgotPass,
      page: () => ForgotPassword(),
    ),
    GetPage(
      name: otp,
      page: () => Otp(),
    ),
    GetPage(
      name: resetPass,
      page: () => ResetPassword(),
    ),
  ];
}
