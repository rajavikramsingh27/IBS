

import 'package:flutter/material.dart';
import 'package:flutter_ibs/routes/NavRouter.dart';
import 'package:flutter_ibs/routes/RouteConstants.dart';
import 'package:flutter_ibs/services/ServiceApi.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/Strings.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'Store/HiveStore.dart';
import 'language/LocalTranslations.dart';
import 'models/language/LanguageResponseModel.dart';


main() async{
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  WidgetsFlutterBinding.ensureInitialized();
  await HiveStore().initBox();
  await getLanguage();
  runApp(IBS());
}

getLanguage() async {
  List<Datum> data = <Datum>[];
  List<String> languages = <String>[];

  await ServiceApi().getLanguage().then((response) => data = response.data);
  data.forEach((element) {
    print("lang:${element.lang}");
    LocalizationService.languages.add(element.lang);
    LocalizationService.locales.add(Locale(element.lang));
    Datum lg = element;
    HiveStore().put(element.lang, lg.toJson());
    LocalizationService.keyList[element.lang] = HiveStore().get(element.lang);
    printWrapped("KeyList: ${LocalizationService.keyList}",);
  });
}
void printWrapped(String text) {
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

class IBS extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: splash,
      defaultTransition: Transition.fade,
      getPages: NavRouter.generateRoute,
      title: AppStrings.appName,
      theme: ThemeData(
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: AppColors.primaryColor,
        ),
        fontFamily: 'Roboto',
        primaryColor: AppColors.primaryColor,
        // textTheme: GoogleFonts.redHatDisplayTextTheme(),
        //    primarySwatch: AppColors.primaryColor,
        splashColor: Colors.transparent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      localizationsDelegates: [
        // THIS CLASS WILL BE ADDED LATER
        // A class which loads the translations from JSON files
        GlobalCupertinoLocalizations.delegate,
        // Built-in localization of basic text for Material widgets
        GlobalMaterialLocalizations.delegate,
        // Built-in localization for text direction LTR/RTL
        GlobalWidgetsLocalizations.delegate,
      ],
      translations: LocalizationService(),
      supportedLocales: LocalizationService.locales,
      fallbackLocale: LocalizationService.fallbackLocale,
      locale: LocalizationService.locale,
    );
  }
}




class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext mainContext) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: GetBuilder<AuthController>(
        init: AuthController(),
        builder: (authController) =>
        authController.loggedIn ? HomePage.create() : AuthPage.create(),
      ),
    );
  }
}

class AuthController extends GetxController {
  bool loggedIn = false;

  signIn() {
    loggedIn = true;
    update();
  }

  signOut() {
    loggedIn = false;
    update();
  }
}

class AuthPage extends StatelessWidget {
  AuthPage._(this.controller);

  static const routeName = '/';
  final AuthController controller;

  static Widget create() {
    return AuthPage._(Get.find<AuthController>());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Authentication'), centerTitle: true),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: Column(
                children: <Widget>[
                  Text('logged in: ${controller.loggedIn}'),
                ],
              ),
            ),
          ),
          RaisedButton(
            onPressed: () => controller.signIn(),
            child: Text('Sign in'),
          )
        ],
      ),
    );
  }
}

class HomePageController extends GetxController {
  bool _initialized = false;

  @override
  void onInit() {
    _initialized = true;
    print('HomePageController initialized');
  }

  bool get initialized => _initialized;
}

class HomePage extends StatelessWidget {
  HomePage._(this.controller);

  static const routeName = '/home';
  final HomePageController controller;

  static Widget create() {
    return GetBuilder<HomePageController>(
      init: HomePageController(),
      initState: (state) async {
        print('HomePageController state initialized');
      },
      builder: (controller) => HomePage._(controller),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home'), centerTitle: true),
      body: GetBuilder<AuthController>(
        builder: (authController) => Column(
          children: <Widget>[
            Expanded(
              child: Center(
                child: Column(
                  children: <Widget>[
                    Text('logged in: ${authController.loggedIn}'),
                    Text(
                      'controller initialized: ${controller.initialized}',
                      style: TextStyle(
                        color:
                        controller.initialized ? Colors.green : Colors.red,
                      ),
                    )
                  ],
                ),
              ),
            ),
            RaisedButton(
              onPressed: () => authController.signOut(),
              child: Text('Sign out'),
            )
          ],
        ),
      ),
    );
  }
}
