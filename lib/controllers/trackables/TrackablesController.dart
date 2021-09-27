import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:flutter_ibs/services/ServiceApi.dart';
import 'package:flutter_ibs/utils/ConnectionCheck.dart';
import 'package:get/get.dart';

class TrackablesController extends GetxController {
  RxBool connectionStatus = false.obs;
  RxBool loader = false.obs;

  Rx<TrackablesListModel> trackList = TrackablesListModel().obs;
  Map<String, dynamic> _rawTrackList;

  //List<TrackablesListModel> _sourceTrackList = TrackablesListModel();

  Rx<TrackableItem> symptoms = TrackableItem().obs;
  Rx<TrackableItem> bowelMovements = TrackableItem().obs;
  Rx<TrackableItem> foods = TrackableItem().obs;
  Rx<TrackableItem> journal = TrackableItem().obs;
  Rx<TrackableItem> medications = TrackableItem().obs;
  Rx<TrackableItem> healthWellness = TrackableItem().obs;

  bool _init = false;

  @override
  void onInit() async {
    super.onInit();
    _getTrackList();
  }


  RxList<TrackableItem> getSymptoms(){
    _cleanTrackList();

    RxList<TrackableItem> formWidgetList = RxList<TrackableItem>();
    symptoms.value.items.forEach((element) {
      formWidgetList.add(element);
    });

    symptoms.refresh();
    return formWidgetList ;
  }


  RxList<TrackableItem> getBowelMovements(){
    _cleanTrackList();

    RxList<TrackableItem> formWidgetList = RxList<TrackableItem>();
    bowelMovements.value.items.forEach((element) {
      formWidgetList.add(element);
    });

    bowelMovements.refresh();
    return formWidgetList ;
  }



  RxList<TrackableItem> getMedications(){
    _cleanTrackList();

    RxList<TrackableItem> formWidgetList = RxList<TrackableItem>();
    medications.value.items.forEach((element) {
      formWidgetList.add(element);
    });

    medications.refresh();
    return formWidgetList ;
  }


  RxList<TrackableItem> getHealthWellness(){
    _cleanTrackList();

    RxList<TrackableItem> formWidgetList = RxList<TrackableItem>();
    healthWellness.value.items.forEach((element) {
      formWidgetList.add(element);
    });

    healthWellness.refresh();
    return formWidgetList ;
  }


  RxList<TrackableItem> getFoods(){
    _cleanTrackList();

    RxList<TrackableItem> formWidgetList = RxList<TrackableItem>();
    foods.value.items.forEach((element) {
      formWidgetList.add(element);
    });

    foods.refresh();
    return formWidgetList ;
  }


  RxList<TrackableItem> getJournal(){
    _cleanTrackList();

    RxList<TrackableItem> formWidgetList = RxList<TrackableItem>();
    journal.value.items.forEach((element) {
      formWidgetList.add(element);
    });

    journal.refresh();
    return formWidgetList ;
  }




  /// Since Dart doesn't clone objects well and our data is a set
  /// of nested object, cleanTrackList creates a new object tree
  /// from the downloaded JSON.
  _cleanTrackList(){
    trackList.value = TrackablesListModel.fromJson(_rawTrackList);
    trackList.value.data.sort((a, b) {
      return a.weight.compareTo(b.weight);
    });
    _setCategories();
  }


  _getTrackList() async {
    if (_init) {
      return;
    }
    bool isInternet = await ConnectionCheck().initConnectivity();
    connectionStatus.value = isInternet;

    if (connectionStatus.value) {
      loader.value = true;
      await ServiceApi().getTrackables().then((value) {
        // Sort the list bw "weight" property ascending:
      /*  value.data.sort((a, b) {
          return a.weight.compareTo(b.weight);
        }); */

        trackList.value = TrackablesListModel.fromJson(value);
        _rawTrackList = value;

        _setCategories();

        loader.value = false;
        _init = true;
      });


    }
  }

  _setCategories() {
    if (trackList.value.data == null){
      return;
    }
    trackList.value.data.forEach((element) {
      switch (element.tid) {
        case "symptoms":
          symptoms.value = element;
          break;
        case "bowelMovements":
          bowelMovements.value = element;
          break;
        case "foods":
          foods.value = element;
          break;
        case "journal":
          journal.value = element;
          break;
        case "medications":
          medications.value = element;
          break;
        case "healthWellness":
          healthWellness.value = element;
          break;
      }
    });
  }
}
