import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ibs/controllers/home/HomeController.dart';
import 'package:flutter_ibs/controllers/trackables/TrackablesController.dart';
import 'package:flutter_ibs/controllers/user/UserController.dart';
import 'package:flutter_ibs/routes/NavRouter.dart';
import 'package:flutter_ibs/routes/RouteConstants.dart';
import 'package:flutter_ibs/services/ServiceApi.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/Strings.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:get/get.dart';

import 'Store/HiveStore.dart';
import 'language/LocalTranslations.dart';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/subjects.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

final BehaviorSubject<ReceivedNotification> didReceiveLocalNotificationSubject = BehaviorSubject<ReceivedNotification>();

final BehaviorSubject<String> selectNotificationSubject = BehaviorSubject<String>();

const MethodChannel platform = MethodChannel('dexterx.dev/flutter_local_notifications_example');

class ReceivedNotification {
  ReceivedNotification({
    this.id,
    this.title,
    this.body,
    this.payload,
  });

  final int id;
  final String title;
  final String body;
  final String payload;
}

String selectedNotificationPayload;




main() async{
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  // ToDo Local Notification
  await _configureLocalTimeZone();

  const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('@drawable/app_icon');

  /// Note: permissions aren't requested here just to demonstrate that can be
  /// done later

  final IOSInitializationSettings initializationSettingsIOS = IOSInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
      onDidReceiveLocalNotification: (
          int id,
          String title,
          String body,
          String payload,
          ) async {
        didReceiveLocalNotificationSubject.add(
          ReceivedNotification(
            id: id,
            title: title,
            body: body,
            payload: payload,
          ),
        );
      });

  final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
  );

  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: (String payload) async {
        if (payload != null) {
          debugPrint('notification payload: $payload');
        }

        selectedNotificationPayload = payload;
        selectNotificationSubject.add(payload);
      });

  // ToDo Local Notification

  await HiveStore().initBox();
  await getLanguage();

  Get.put(
      TrackablesController()); //Init trackables which pulls the list together
  Get.put(UserController());
  Get.put(HomeController());
  runApp(IBS());
}

// ToDo Local Notification
Future<void> _configureLocalTimeZone() async {

  tz.initializeTimeZones();
  String timeZoneName = await FlutterNativeTimezone.getLocalTimezone();
  tz.setLocalLocation(tz.getLocation(timeZoneName));
}



// ToDo Local Notification

getLanguage() async {
  var data;

  await ServiceApi().getLanguage().then((response) => data = response.data);
  data.forEach((element) {
    LocalizationService.languages.add(element["lang"]);
    LocalizationService.locales.add(Locale(element["lang"]));
    Map<String, String> stringParams = {};
    element.forEach((k, v) => stringParams[k.toString()] = v.toString());
    HiveStore().put(element["lang"], stringParams);
    LocalizationService.keyList[element["lang"]] =
        HiveStore().get(element["lang"]);
    printWrapped(
      "KeyList: ${LocalizationService.keyList}",
    );
  });
}

void printWrapped(String text) {
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}


class IBS extends StatefulWidget {
  @override
  _IBSState createState() => _IBSState();
}

class _IBSState extends State<IBS> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _requestPermissions();
    _configureDidReceiveLocalNotificationSubject();
    _configureSelectNotificationSubject();
  }

  @override
  void dispose() {
    didReceiveLocalNotificationSubject.close();
    selectNotificationSubject.close();
    super.dispose();
  }

  void _requestPermissions() {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
      alert: true,
      badge: true,
      sound: true,
    );

  }

  void _configureSelectNotificationSubject() {
    selectNotificationSubject.stream.listen((String payload) async {
      await Navigator.pushNamed(context, '/secondPage');
    });
  }

  void _configureDidReceiveLocalNotificationSubject() {
    didReceiveLocalNotificationSubject.stream
        .listen((ReceivedNotification receivedNotification) async {
      await showDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: receivedNotification.title != null
              ? Text(receivedNotification.title)
              : null,
          content: receivedNotification.body != null
              ? Text(receivedNotification.body)
              : null,
          actions: <Widget>[
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () async {
                print('Did Receive Local Notification');


                Navigator.of(context, rootNavigator: true).pop();
                // await Navigator.push(
                //   context,
                //   MaterialPageRoute<void>(
                //     builder: (BuildContext context) =>
                //         SecondPage(receivedNotification.payload),
                //   ),
                // );
              },
              child: const Text('Ok'),
            )
          ],
        ),
      );
    });
  }

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
