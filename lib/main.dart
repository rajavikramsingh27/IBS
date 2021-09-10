

import 'package:flutter/material.dart';
import 'package:flutter_ibs/routes/NavRouter.dart';
import 'package:flutter_ibs/routes/RouteConstants.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/Strings.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';



main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(IBS());
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
    );
  }
}

// Local Notifications implementation

// import 'dart:async';
// import 'dart:convert';
// import 'dart:io';
// import 'dart:typed_data';
// import 'dart:ui';
//
// import 'package:device_info/device_info.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:flutter_native_timezone/flutter_native_timezone.dart';
// import 'package:http/http.dart' as http;
// import 'package:path_provider/path_provider.dart';
// import 'package:rxdart/subjects.dart';
// import 'package:timezone/data/latest.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;

// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
// final BehaviorSubject<ReceivedNotification> didReceiveLocalNotificationSubject = BehaviorSubject<ReceivedNotification>();
// final BehaviorSubject<String> selectNotificationSubject = BehaviorSubject<String>();
//
// const MethodChannel platform = MethodChannel('dexterx.dev/flutter_local_notifications_example');
//
// class ReceivedNotification {
//   ReceivedNotification({
//     this.id,
//     this.title,
//     this.body,
//     this.payload,
//   });
//
//   final int id;
//   final String title;
//   final String body;
//   final String payload;
// }
//
// String selectedNotificationPayload;
//
// Future<void> _configureLocalTimeZone() async {
//   tz.initializeTimeZones();
//   final String timeZoneName = await FlutterNativeTimezone.getLocalTimezone();
//   tz.setLocalLocation(tz.getLocation(timeZoneName));
// }
//
// class PaddedElevatedButton extends StatelessWidget {
//   const PaddedElevatedButton({
//     this.buttonText,
//     this.onPressed,
//     Key key,
//   }) : super(key: key);
//
//   final String buttonText;
//   final VoidCallback onPressed;
//
//   @override
//   Widget build(BuildContext context) => Padding(
//     padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
//     child: ElevatedButton(
//       onPressed: onPressed,
//       child: Text(buttonText),
//     ),
//   );
// }


// Future<void> main() async {
//   // needed if you intend to initialize in the `main` function
//   WidgetsFlutterBinding.ensureInitialized();
//
//   SystemChrome.setSystemUIOverlayStyle(
//       SystemUiOverlayStyle(statusBarColor: Colors.transparent));
//   SystemChrome.setPreferredOrientations(
//       [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
//
//   await _configureLocalTimeZone();
//
//   final NotificationAppLaunchDetails notificationAppLaunchDetails = await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
//
//   if (notificationAppLaunchDetails?.didNotificationLaunchApp ?? false) {
//     selectedNotificationPayload = notificationAppLaunchDetails.payload;
//   //  from here notification tap screen
//   }
//
//   const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('app_icon');
//
//   /// Note: permissions aren't requested here just to demonstrate that can be
//   /// done later
//   final IOSInitializationSettings initializationSettingsIOS = IOSInitializationSettings(
//       requestAlertPermission: false,
//       requestBadgePermission: false,
//       requestSoundPermission: false,
//       onDidReceiveLocalNotification: (
//           int id,
//           String title,
//           String body,
//           String payload,
//           ) async {
//         didReceiveLocalNotificationSubject.add(
//           ReceivedNotification(
//             id: id,
//             title: title,
//             body: body,
//             payload: payload,
//           ),
//         );
//       });
//
//   final InitializationSettings initializationSettings = InitializationSettings(
//     android: initializationSettingsAndroid,
//     iOS: initializationSettingsIOS,
//   );
//
//   await flutterLocalNotificationsPlugin.initialize(initializationSettings,
//       onSelectNotification: (String payload) async {
//         if (payload != null) {
//           debugPrint('notification payload: $payload');
//         }
//         selectedNotificationPayload = payload;
//         selectNotificationSubject.add(payload);
//       });
//
//   runApp(IBS());
// }

// class IBS extends StatefulWidget {
//   @override
//   _IBSState createState() => _IBSState();
// }
//
// class _IBSState extends State<IBS> {
//   // This widget is the root of your application.
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//
//     Future.delayed(Duration(milliseconds: 1), () {
//       _requestPermissions();
//       _configureDidReceiveLocalNotificationSubject();
//       _configureSelectNotificationSubject();
//     });
//   }
//
//   void _requestPermissions() {
//     flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<
//         IOSFlutterLocalNotificationsPlugin>()
//         ?.requestPermissions(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//     flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<
//         MacOSFlutterLocalNotificationsPlugin>()
//         ?.requestPermissions(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//   }
//
//   void _configureDidReceiveLocalNotificationSubject() {
//     didReceiveLocalNotificationSubject.stream
//         .listen((ReceivedNotification receivedNotification) async {
//       await showDialog(
//         context: context,
//         builder: (BuildContext context) => CupertinoAlertDialog(
//           title: receivedNotification.title != null
//               ? Text(receivedNotification.title)
//               : null,
//           content: receivedNotification.body != null
//               ? Text(receivedNotification.body)
//               : null,
//         ),
//       );
//     });
//   }
//
//   void _configureSelectNotificationSubject() {
//     selectNotificationSubject.stream.listen((String payload) async {
//       await Navigator.pushNamed(context, '/secondPage');
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       initialRoute: splash,
//       defaultTransition: Transition.fade,
//       getPages: NavRouter.generateRoute,
//       title: AppStrings.appName,
//       theme: ThemeData(
//         textSelectionTheme: TextSelectionThemeData(
//           cursorColor: AppColors.primaryColor,
//         ),
//         fontFamily: 'Roboto',
//         primaryColor: AppColors.primaryColor,
//         // textTheme: GoogleFonts.redHatDisplayTextTheme(),
//         //    primarySwatch: AppColors.primaryColor,
//         splashColor: Colors.transparent,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//     );
//   }
// }



