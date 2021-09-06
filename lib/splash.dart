import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_ibs/Store/HiveStore.dart';
import 'package:flutter_ibs/models/language/LanguageResponseModel.dart';
import 'package:flutter_ibs/routes/RouteConstants.dart';
import 'package:flutter_ibs/services/ServiceApi.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:get/route_manager.dart';
import 'package:path_provider/path_provider.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  List<LanguageDataModel> data = <LanguageDataModel>[];

  @override
  initState() {
    super.initState();
    getLanguage();
    HiveStore().initBox();
    Future.delayed(Duration(seconds: 2), () {
      if ((HiveStore().get(Keys.USERID) != null)) {
        Get.offNamed(home);
      } else
        Get.offNamed(intro);
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

  getLanguage() async {
    await ServiceApi().getLanguage().then((response) => data = response.data);
    data.forEach((element) {
      String lang = "";
      lang = element.lang;
      write(fileName: lang, text: element.toJson());
      print("lang:$lang");
    });
  }

  write({Map<String, dynamic> text, String fileName}) async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final File file = File('${directory.path}/$fileName.dart');

    print("file:$file");
    await file.writeAsString(text.toString());
  }
}
