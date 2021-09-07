import 'package:flutter/material.dart';
import 'package:flutter_ibs/routes/NavRouter.dart';
import 'package:flutter_ibs/routes/RouteConstants.dart';
import 'package:flutter_ibs/services/ServiceApi.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/Strings.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'Store/HiveStore.dart';
import 'language/LocalTranslations.dart';
import 'models/language/LanguageResponseModel.dart';
List<LanguageDataModel> data = <LanguageDataModel>[];
List<String> languages = <String>[];
main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await HiveStore().initBox();
  await getLanguage();
  runApp(IBS());
}
getLanguage() async {
  await ServiceApi().getLanguage().then((response) => data = response.data);
  data.forEach((element) {
    print("lang:${element.lang}");
    LocalizationService.languages.add(element.lang);
    LocalizationService.locales.add(Locale(element.lang));
    LanguageDataModel lg = element;
    HiveStore().put(element.lang, lg.toJson());
    LocalizationService.keyList.putIfAbsent(element.lang, () => HiveStore().get(element.lang));
  });
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
