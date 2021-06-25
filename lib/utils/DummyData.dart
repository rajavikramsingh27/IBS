import 'package:flutter_ibs/utils/Assets.dart';

class DummyData {
 
  static List<IBSTypeModel> ibsType = [
     IBSTypeModel(text: "IBS - C (Constipation)", image: Assets.ibTypeC),
     IBSTypeModel(text: "IBS - D (Diarrhea)", image: Assets.ibTypeD),
     IBSTypeModel(text: "IBS - M (Mixed)", image: Assets.ibTypeM),
     IBSTypeModel(text: "IBS - U (Untyped)", image: Assets.ibTypeU),
    
  ];
}
class IBSTypeModel {
  IBSTypeModel({this.image, this.text});
  String image;
  String text;
}