import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'en_us.dart';

class LocalTranslations extends Translations {
  static final locale = Locale("en");

  static final fallBackLocale = Locale("tr", "TR");

  static final langs = ['English'];

  static final locales = [Locale("en", "US")];

  @override
  Map<String, Map<String, String>> get keys => {"en_Us": enUS};

  void changeLocale(String lang) {
    final locale = _getLocaleLang(lang);
    Get.updateLocale(locale);
  }

  Locale _getLocaleLang(String lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) return locales[i];
    }
    return Get.locale;
  }
}
